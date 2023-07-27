{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de los
usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario se
conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de días desde
el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista Económica
El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

PROGRAM EJER13;
CONST
	MAXUsuarios = 3600;

TYPE
	str50 = string[50];

	rng_usuarios = 1..MAXUsuarios;

	rng_rol = 1..4;

	reg_usuario = record
		email: str50;
		rol: rng_rol;
		revista: str50;
		ultAcceso: integer;
	end;

	reg_economica = record
		nombre: str50;
		ultAcceso: integer;
	end;

	vec_usuarios = array [rng_usuarios] of reg_usuario;

	vec_rol = array [rng_rol] of integer;

	lista = ^nodo;
	nodo = record
		datos: reg_economica;
		sig: lista;
	end;

//____________________________________PROCEDIMIENTOS_____________________________________________

//____________________________________IniVec_____________________________________________

Procedure InicializarVecRol (var v: vec_rol);
Var
    i: rng_rol;
Begin
    for i:= 1 to 4 do
        v[i]:= 0;
End;

//____________________________________GenerarVector_____________________________________________

Procedure GenerarVector (var v: vec_usuarios);
Begin
		{Se dispone}
End;

//____________________________________GenerarLista_____________________________________________

Procedure GenerarLista (var l: lista; v: vec_usuarios);

	procedure leerRegEconomica (var e: reg_economica; acceso: integer);
	begin
		readln(e.nombre);          {asignar el email}
		e.ultAcceso:= acceso;
	end;

	procedure crearNodo (var l: lista; e: reg_economica);
	var
		ant, nodo, act: lista;
	begin
		new(nodo);
		nodo^.datos:= e;
		act:= l;
		while (act <> nil) and (e.ultAcceso > act^.datos.ultAcceso) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
		else
			ant^.sig:= nodo;
		nodo^.sig:= act;
	end;

Var
	e: reg_economica;
	i: rng_usuarios;
Begin
	l:= nil;
	for i:= 1 to MAXUsuarios do
		if (v[i].revista = 'Economica') then begin
			leerRegEconomica(e, v[i].ultAcceso);
			crearNodo(l, e);
		end;
       {hacer el c en el mismo recorrido}
End;

//____________________________________Recorrer Lista_____________________________________________

Procedure RecorrerLista(L: lista);

	procedure ImprimirDatos(e: reg_economica);
	begin
		with e do begin
			writeln('Nombre de Usiario: ',nombre);
			writeln('Dias desde el ultimo acceso: ',ultAcceso);
		end;
	end;

Begin
	while (l <> nil) do begin
		ImprimirDatos(l^.datos);
		l:= l^.sig;
	end;
End;

//____________________________________Recorrer Vector_____________________________________________

Procedure RecorrerVector (vU: vec_usuarios; vR: vec_rol);

	procedure Maximos (acc: integer; mail: str50; var acc1, acc2: integer; var mail1, mail2: str50);
	begin
		if acc > acc1 then begin
			acc2:= acc1;
			mail2:= mail1;
			acc1:= acc;
			mail1:= mail;
		end
			else
				if acc > acc2 then begin
					acc2:= acc;
					mail2:= mail;
				end;

	end;

Var
	i: rng_usuarios;
	email1, email2: str50;
	acceso1, acceso2: integer;
Begin
		for i:= 1 to MAXUsuarios do begin
			Maximos(vU[i].ultAcceso, vU[i].email, acceso1, acceso2, email1, email2);

		end;
End;

//____________________________________P . P_____________________________________________

VAR
	L: lista;
	vecU: vec_usuarios;
	vecR: vec_rol;
BEGIN
    InicializarVecRol(vecR);
	GenerarVector(vecU);		{Se dispone}
	GenerarLista(L, vecU);
	RecorrerLista(L);
	RecorrerVector(vecU, vecR);
END.