{7. Realizar un programa que resuelva los siguientes incisos:
a) Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura
finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b) Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c) Lea un nombre y lo inserte en la posición 4 del vector.
d) Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}
Program Ejer7;
Const
	MAXal = 500;
Type
	indice = 0..MAXal;
	str50 = string[50];
	rng_al = 1..MAXal;
	vecAlumnos = array [rng_al] of str50;
Procedure LeerNombres (var v: vecAlumnos; var dL: indice);										{a}
var
	nom: str50;
begin
	dl:= 0;
	writeln('Ingrese Nombre Alumno');
	readln(nom);
	while (nom <> 'ZZZ') and (dl < MAXal) do begin
		dL:= dL + 1;
		v[dl]:= nom;
		writeln('Ingrese Nombre Alumno');
		readln(nom);
	end;
end;
Procedure ElimNombres (var v: vecAlumnos; var dl: indice; elem: str50; var ok: boolean);        {b}
	function buscarPosElem (x: str50; v: vecAlumnos; dl: indice): indice;
	var
		i: indice;
		ok: boolean;
	begin
		i:= 1;
		ok:= false;
		while (i <= dl) and (not ok) do
			if (x = v[i]) then
				ok:= true
			else
				i:= i + 1;
		if ok = false then
			i:= 0;
		buscarPosElem:= i;
	end;
	Procedure borrarPos(var v:vecAlumnos; var dl: indice; pos: rng_al);
	var
		i: rng_al;
	begin
		for i:= (pos + 1) to dl do
			v[i-1]:= v[i];
		dl:= dl - 1;
	end;
var
	pos: indice;
begin
	ok:= false;
	pos:= buscarPosElem (elem, v, dl);
	if pos <> 0 then begin
		borrarPos(v, dl, pos);
		ok:= true;
	end;
end;
Var
	vAlumnos: vecAlumnos;
	dimL: indice;
	ok: boolean;
	nombre: str50;
Begin                                                                                      {P.P}
	LeerNombres(vAlumnos, dimL);
	writeln('Ingrese un nombre para borrar');
	readln(nombre);
	ElimNombres(vAlumnos, dimL, nombre, ok);
	if ok then
		writeln('El nombre ',nombre,' se eliminó');
End.