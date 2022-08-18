{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede
no existir.}
PROGRAM ejercicio01_repaso
CONST
	MAXgeneros = 5;
	
TYPE
	rng_genero = 1..MAXgeneros;
	
	Persona = record
		dni: integer;
		nomApe: string;
		edad: integer;
		codGenero: integer;
	end;
	
	vec_Generos = array [rng_genero];
	
	lista_Personas =  ^nodo;
	nodo = record;
		datos: Persona;
		sig: lista_Personas;
	end;

//__________________________Generar Lista__________________________
{leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido 
y nombre, edad y el código de género de actuación que prefiere (1: drama, 
2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza 
cuando llega una persona con DNI 33555444, la cual debe procesarse.}
Procedure GenerarLista(var lP: lista_Personas; var vGeneros: vec_Generos);

	procedure leerInfo(var r: Persona; var v: vec_Generos);
	begin
		with r do begin
			write('Dni: ');
			readln(dni);
			write('Nombre y Apellido: ');
			readln(nomApe);
			write('Edad: ');
			readln(edad);
			write('Codigo de genero: ');
			readln(codGenero);
			v[codGenero]:= v[codGenero] + 1;
		end;
	end
	
	procedure crearLista(var l: lista_Personas; r: Persona);
	var
		act, nodo: lista_Personas;
	begin
		new(nodo);
		nodo^.datos:= r;
		nodo:= nil;
		if (l <> nil) then begin
			act:= l;
			while(act^.sig <> nil) do 
				act:= act.sig;
			act^.sig:= nodo;
		end
		else
			l:= nodo;
	end;
	
Var
	persona: Persona;
Begin
	lP:= nil;
	
	repeat
		leerInfo(persona, vGeneros);
		crearLista(lP, persona);
	until (persona.dni = 33555444);
End;
//__________________________P.P__________________________
{b. Informar los dos códigos de género más elegidos.}
Procedure RecorrerVector(v: vec_Generos);

	procedure calcularMaximos(cant: integer; var m1, m2: integer; i: rng_genero; var g1, g2: rng_genero);
	begin
		if (cant > m1) then begin
			m2:= m1;
			g2:= g1;
			m1:= cant;
			g1:= i;
		end;
		else
			if (cant > m2) then begin
				m2:= cant;
				g2:= i;
			end
	end;
	
Var
	i, gen, genMax1, genMax2: rng_genero;
	max1, max2: integer;
Begin
	max1:= -1; 
	max2:= -1;
	
	for i:= 1 to MAXgeneros do 
		calcularMaximos(v[i], max1, max2, i, genMax1, genMax2);
	
	writeln('El Mayor Genero es: ', max1);
	writeln('El Segundo Mayor Genero es: ', max2);
End;
//__________________________Recorrer Lista y eliminar__________________________
{c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede
no existir.}
Procedure RecorrerListaEliminar(var lP: lista_Personas);

	procedure eliminarDeLista(var l: lista_Personas; var ok: boolean; n: integer);
	var
		ant, act: lista_Personas;
	begin
		ok:= false;
		act:= l;
		
		while(act <> nil) and (act^.datos.dni <> n)do begin
			ant:= act;
			act:= act^.sig;
		end;
		
		if (act <> nil) then
			ok:= true;
			if (act = l) then
				l:= l^.sig;
			else
				ant^.sig:= act^.sig;
			dispose(act);
		end;
	end;

Var
	num: integer;
	eliminado: boolean;
Begin
	write('Ingresar DNI de Persona a eliminar: ');
	readln(num);
	eliminarDeLista(lP, num, elimnado);
	if (eliminado) then 
		writeln('La Persona con Dni ', num, ' se elimino.');
End;

//__________________________P.P__________________________
VAR
	listaPersona: lista_Personas;
	vecGeneros: vec_Generos;
BEGIN
	IniVector(vecGeneros);
	GenerarLista(listaPersona, vecGeneros);
	RecorrerVector(vecGeneros);
	RecorrerListaEliminar(listaPersona);
END.