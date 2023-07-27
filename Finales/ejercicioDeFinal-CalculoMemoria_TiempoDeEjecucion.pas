{
1) Teniendo en cuenta la tabla, calcular la memoria estatica, dinamica y el tiempo de ejecución.
Tipo de Dato	Memoria
Char			1 byte
Integer			6 byte
Real			8 byte
Boolean			1 byte
String			Longitud + 1 byte
Puntero			4 byte
}

PROGRAM ejercicioDeFinal;
TYPE
	cadena35 = string[35];
	empleado = record
		dirCorreo: cadena35;
		edad: integer;
		sueldo:real;
	end;
  
	punt = ^empleado;
	vec = array [1..500] of punt;
  
	lista = ^nodo;
	nodo = record
		dato: empleado;
		sig: lista;
	end;
  
VAR							//MEMORIA ESTÁTICA: Es la suma de declarada las variables declaradas en VAR
	v: vec;			{"v" de tipo array de 500 pos * 4 por ser cada pos de tipo puntero): 500  * 4 = 2000}
	l,aux: lista;			{"l" y "aux" de tipo puntero: 4 + 4 = 8}
	emp: empleado;				{"emp" de tipo registro(la suma de sus campos string + integer + real): (35+1) + 6 + 8 = 50}
	i: integer;		{"i" de tipo integer: 6 bytes}		
{TOTAL de memoria ESTÁTICA = 2000 + 8 + 50 + 6 = 2064 bytes}

BEGIN						//MEMORIA DINÁMICA: Se empieza a calcular desde el primer new(), (siempre y cuando se encuentre en el programa)
	l:=nil;
	for i:=1 to 10 do begin
		read(emp.dirCorreo, emp.edad, emp.sueldo);
		if (emp.edad < 40) and (emp.sueldo < 40000) then
			exp.sueldo:= exp.sueldo + 7000;
		new(aux); 			{"aux" de tipo puntero al tener el reg(empleado), 50b + el enlace al prox 4b: 54b}
		aux^.dato := emp;
		aux^.sig: := l;
		l := aux;    
	end;
END.
{TOTAL memoria DINÁMICA = Creación de un puntero dentro del for(iteracion de 10) * creación de puntero ( new(aux) 54) = 10*54 = 540 bytes}


				//TIEMPO DE EJECUCION
BEGIN
	l:= nil;  					{1ut}
  
	{Para for: inicialización (i:= 1), testeo (i <= 30), e incremento (i:= i + 1) = 3*n + 2}
	for i:=1 to 10 do begin   				{(3*10+2) = 32ut}
		read(emp.dirCorreo, emp.edad, emp.sueldo);   				{read y write no se cuentan: 0ut}
	
		if (emp.edad < 40) and (emp.sueldo < 40000) then   					{(1ut + 1ut + 1ut) * 10 = 30ut }
			exp.sueldo:= exp.sueldo + 7000;   			{2ut * 10 = 20ut}
	  
		new(aux); 				{1ut * 10 = 10ut}
		aux^.dato:= emp; 				{1ut * 10 = 10ut}
		aux^.sig:= l; 				{1ut * 10 = 10ut}
		l:= aux;    			{1ut * 10 = 10ut}
	
	end;
END.
{TOTAL de TIEMPO DE EJECUCIÖN = 1 + 32 + 30 + 20 + 10 + 10 + 10 + 10 = 123ut como maximo





  