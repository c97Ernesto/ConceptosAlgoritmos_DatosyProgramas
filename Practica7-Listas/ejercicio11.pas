{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará
el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el promedio obtenido
durante toda su carrera.
Implementar un programa que:
a. Lea la información de los todos egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados que
recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor a menor).}

PROGRAM Ejer11;
CONST
	MAXEgresados = 10;
TYPE
	rngEgreados = 0..MAXEgresados;
	str50 = string[50];
	regEgresados = record
		nroAlumno: integer;
		apellido: str50;
		promedio: real;
	end;
	vecEgresados = array [1..MAXEgresados] of regEgresados;
	lista = ^nodo;
	nodo = record
		datos: regEgresados;
		sig: lista;
	end;
PROCEDURE GenerarLista (var l: lista);
	procedure leerReg (var e: regEgresados);
	begin
		with e do begin
			readln(nroAlumno);
			readln(apellido);
			readln(promedio);
		end;
	end;
	procedure CrearNodo (var l: lista; e: regEgresados);
	var
		ant, nodo, act: lista;
	begin
		new(nodo);
		nodo^.datos:= e;
		act:= l;
		ant:= l;
		while (act <> nil) and (act^.datos.promedio > e.promedio) do begin
			ant:= act;
			act:= act^.sig ;
		end;
		if (ant = act) then
			l:= nodo
		else
			ant^.sig:= nodo;
		nodo^.sig:= act;
	end;
Var
	egresado: regEgresados;
Begin
	l:= nil;
	LeerReg(egresado);
	while (egresado.nroAlumno <> 0) do begin
		CrearNodo(l, egresado);
		LeerReg(egresado);
	end;
End;

PROCEDURE RecorrerLista (l: lista; var v: vecEgresados; var dl: rngEgreados);
Begin
	dl:= 0;
	while (l <> nil) and (dl < MAXEgresados) do begin
		dl:= dl + 1;
		v[dl]:= l^.datos;  {informar apellido y nro alumno}
        {avanzar en lista}
	end;
End;
PROCEDURE RecorrerVector (v: vecEgresados; dl: rngEgreados);
Var
	i: rngEgreados;
Begin
	for i:=1 to dl do begin
		writeln(v[i].apellido);
		writeln(v[i].nroAlumno);
	end;
End;
VAR
	L: lista;
	vector: vecEgresados;
	dimL: rngEgreados;
BEGIN												{P.P}
	GenerarLista(L);
	RecorrerLista(L, vector, dimL);
	RecorrerVector(vector, dimL);
END.