{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede}

PROGRAM ejercicio1
Const
    MAXG = 5;
Type
    rango = 1..MAXG;
    cadena50 = string[50];
    anios = 1..100;
    persona = record
        cod: genAct;
		ap: cadena50;
		nom: cadena50
        edad: anios;
        DNI: integer;
    end;
    vecCodigos = array [rango] of integer;
    lista: ^nodo;
    nodo = record
        datos: persona;
        sig: lista;
    end;

procedure GenerarLista (l:lista);		//Generamos Lista
	procedure leerPersona(var p: persona);      //Ingresar INFO de la persona
	var
	    p: persona;
	begin
	    with p do begin
	        write('Ingrese nro de Codigo de Genero que prefiera:');
	        write('1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror');
	        readln(cod);
	        write('Ingrese apellido:');
			readln(ap);
			write('Ingrese nombre:');
			readln(nom);
	        write('Ingrese edad:');
	        readln(edad);
	        write('Ingrese DNI:');
	        readln(DNI);
	    end;
	end;

	procedure agregarAtras (var pri, ult: lista; p:persona);    //Agregamos los datos a la lista
	var
	    nue: lista;
	begin
	    new(nue);
	    nue^.datos:= p;
	    nue^.sig:= nil;
	    if pri <> nil then
	        ult^.sig:= nue;
	        else 
	            pri:= nue;
	    ult:= nue
	end;
var
	per: persona;
	L: lista;
	U: lista;
begin
	crearLista(L, U);
	repeat
		leerPersona(per);
		agregarAtras(L, U, per);

	until per.dni = 33555444;
end;

Procedure IncisoAyB (l: lista, var v: vecCodigos);	//IncisoB
	Procedure iniVector (var v: vecCodigos); //Procedimiento Inicializar Vector
	var
		i: integer
	begin
		for i:= 1 to MAXG do 
			v[i]:= 0;
	end;
		Function masPares(n: integer): boolean;		//Funcion masPares
	var
		p, i, resto: integer
	begin
		p:= 0;
		i:= 0;
		while num <> 0 do begin
			resto:= num div 10;			//nos quedamos con el ultimo numero del dni
			if (resto mod 2) = 0 then		//si el ultimo numero que queda en el dni es par...
				p:= p + 1;			//incrementamos pares
			else			//sino...
				i:= i + 1;			//incrementamos inpares
			num:= num div 10;	//le sacamos el ultimo digito al dni
		end;
		if (p > i) then			//si hay mas pares que impares..
			masPares:= true			//devuelve verdadero
		else
			masPares.= false;		//sino, devuelve falso
	end;
	Procedure recorrerLista (L: lista; var v: vecCodigos; var: cantP: integer);		//Recorremos
	begin
		while (l <> nil) do begin
			if (masPares(l^datos.dni) then
				cantP:= cantP + 1;
			v[l^datos.cod]:= v[l^.datos.cod] + 1;		//al vector "v" en la pos "[.cod]" le asigno lo que tenia anteriormente la pos "[.cod]" y le sumo 1 para contar que encontre de nuevo algo en esa posicion
			l:= l^.sig;
		end;
	end;
	procedure maximos (var cod1, cod2: integer; v: vecCodigos);
	var
		max1, max2: integer;
	begin
		max1:= -1;
		max2:= -1;
		for i:= 1 to MAXG do begin
			if v[i] > max1 then begin
				max2:= max1;
				max1:= v[i];
				cod2:= cod1;
				cod1:= i;
			end;
			else begin
				if v[i] > max2 then begin
					max2:= v[i];
					cod2:= i;
				end;
			end;
		end;
	end;
var
	v: vecCodigos;
	cod1, cod2: integer;
begin
	IniVector(v);
	recorrerLista(l, v);
	maximos(cod1, cod2, v);
	writeln('Los Generos mas elegido son: ',cod1,' y ',cod2);
	
end;
Procedure EliminarDNI (var l: lista);
	Procedure borrarElem(var L: lista; n: integer; var e: boolean); //Borrar Numero
	var
	    ant, act: lista;
	begin
	    e:= false;
	    act:= L;
	    while (L <> nil) and (act^.datos.DNI <> n) do begin
	        ant:= act;
	        act:= act^.sig;
	    end;
	    if (act <> nil) then
	        e:= true;
	        if (act = L) then
	            L:= L^.sig;
	            else
	                ant^.sig:= act^.sig;
	        dispose(act);
	    end;
	end;
var
	n: integer;
	ok: boolean;
begin
	Writeln('Ingrese el numero de DNI a eliminar');
	readln(n);
	borrarElem(l, n, ok);
	if ok then
		writeln('La persona con el DNI ',n,' fue eliminada);
	end;
end;

var         //PROGRAMA PRINCIPAL
    L, U: lista;
	vector: vecCodigos;
begin
	L:= nil;
	U:= nil;
	GenerarLista(L, U);
	IncisoB(L, vector);
	EliminarDNI(L);
end;	