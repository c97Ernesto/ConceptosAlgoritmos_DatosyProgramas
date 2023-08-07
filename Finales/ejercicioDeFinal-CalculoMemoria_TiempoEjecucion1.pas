{Teniendo en cuenta la siguiente tabla calcule e indique la cant de
memoria estática y dinámica que utitiliza el sig programa y su tiempo
de ejecución.
Tipo de Dato	Memoria
Char			1 byte
Integer			6 byte
Real			8 byte
Boolean			1 byte
String			Longitud + 1 byte
Puntero			4 byte}

PROGRAM
TYPE
	cadena35 = srtring[35];		 {36b}
	
	empleado = record		{36 + 6 + 8 = 50b}
		dirCorreo: cadena35;	
		edad: integer;		
		sueldo: real;		
	end;
	punt = ^empleado;		{4b}
	
	vector = array [1..500] of punt;	{500b * 4b = 2000b}
	
	lista = ^nodo;			{4b}
	nodo = record 			{50b + 4 = 54b}
		dato: empleado;
		sig: lista; 
	end;

VAR		{2000b + 8b + 50b + 6b = 2064b de Mem Estática}
	v: vector;		
	l, aux: lista;
	emp: empleado;
	i: integer;
BEGIN
	l:= nil;			// 1ut
	for i:= 1 to 10 do begin		// (3*10) + 2 = 32ut
		read(emp.dirCorreo, emp.edad, emp.sueldo);
		if (emp.edad < 40) and (emp.sueldo < 40000) then	// 3 * 10 = 30ut
			emp.sueldo:= emp.sueldo + 7000;			// 2 * 10 = 20ut
		new(aux);		{(50b + 4) * 10 = 540 bytes de Mem Dinámica}	
		aux^.dato:= emp;	// 1 * 10 = 10ut
		aux^.sig:= l;		// 1 * 10 = 10ut
		l:= aux;		// 1 * 10 = 10ut
	end;
END.//Tiempo de Ejecucion: 1 + 32 + 30 + 20 + 10 + 10 + 10 = 113ut
