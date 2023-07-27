{7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la
carrera de Analista Programador Universitario. Para ello se deberá leer la información de cada
alumno, a saber: número de alumno, apellido, nombres, dirección de correo electrónico, año de
ingreso, año de egreso y las notas obtenidas en cada una de las 24 materias que aprobó (los
aplazos no se registran).
1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas
correspondientes a cada alumno deben quedar ordenadas de forma descendente.
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
	a. El promedio de notas obtenido por cada alumno.
	b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
	únicamente por dígitos impares.
	c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más
	rápido se recibieron (o sea, que tardaron menos años)
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y
elimine de la estructura generada en el inciso 1. El alumno puede no existir.}

PROGRAM ejercicio07;

CONST
	MAXanios = 3000;
	MAXnotas = 24;
	FIN = -1;
	
TYPE

	rng_anios = 2000..MAXanios;
	rng_notas = 1..MAXnotas;
	
	vec_notas = array [rng_notas] of real;
	
	reg_alumno = record
		nro: integer;
		apellido: string;
		nombres: string;
		correo: string;
		anioIngreso: rng_anios;
		anioEgreso: rng_anios;
		notas: vec_notas;
	end;

	lista_alumnos = ^nodo;
	nodo = record
		datos: reg_alumno;
		sig: lista_alumnos;
	end;

//__________________________Generar Lista__________________________
Procedure GenerarLista(var l: lista_alumnos);
{1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas
correspondientes a cada alumno deben quedar ordenadas de forma descendente.}
	procedure leerInfo(var r: reg_alumno);
	
		procedure cargarNotas(var v: vec_notas);
		
			function buscarPos(v: vec_notas; dL: rng_notas; n: integer): rng_notas;
			var
				pos: rng_notas;
			begin
				pos:= 1;
				while (pos <= dL) and (v[pos] < n) do
					pos:= pos + 1;
				buscarPos:= pos;
			end;
			
			procedure insertar(var v: vec_notas; var dL: rng_notas; pos: rng_notas; n: rng_notas);
			var
				i: rng_notas;
			begin
				for i:= dL downto pos do
					v[i+1]:= v[i];
				v[pos]:= n;
				dL:= dL + 1;
			end;
			
		var
			i, dimL, pos: rng_notas;
			nota: integer;
		begin
			dimL:= 1;
			for i:= 1 to MAXnotas do begin
				write('Ingresar Nota ', i, ' : ');
				readln(nota);
				while (dimL < MAXnotas) do begin
					pos:= buscarPos(v, dimL, nota);
					insertar(v, dimL, pos, nota);
				end;				
			end;
		end;
		
	begin
		with r do begin
			readln(nro);
			if (nro <> FIN) then begin;
				readln(apellido);
				readln(nombres);
				readln(correo);
				readln(anioIngreso);
				readln(anioEgreso);
				cargarNotas(notas);
			end;
		end;
	end;
	
	procedure crearLista(var l: lista_alumnos; r: reg_alumno);
	var
		nodo: lista_alumnos;
	begin
		new(nodo);
		nodo^.datos:= r;
		nodo^.sig:= l;
		l:= nodo;
	end;
	
Var
    alumno: reg_alumno;
Begin
	l:= nil;
	leerInfo(alumno);
	while (alumno.nro <> FIN) do begin
		crearLista(l, alumno);
		leerInfo(alumno);
	end;
End;

//__________________________Eliminar Alumno__________________________
Procedure RecorrerListaEliminar(var l: lista_alumnos);
{3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y
elimine de la estructura generada en el inciso 1. El alumno puede no existir.}
	procedure borrarElem(var l: lista_alumnos; n: integer; ok: boolean);
	var
		ant, act: lista_alumnos;
	begin
		ok:= false;
		act:= l;
		while (act <> nil) and (act^.datos.nro <> n) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act <> nil) then begin
			ok:= true;
			if(act = l) then
				l:= act^.sig
			else
				ant^.sig:= act^.sig;
			dispose(act);
		end;
	end;
	
Var
	n: integer;
	eliminado: boolean;
Begin
	write('Ingresar nro de alumno: ');
	readln(n);
	borrarElem(l, n, eliminado);
	if(eliminado)then
		writeln('EL alumno se eliminó correctamente')
	else
		writeln('El aluno no se encontró');
End;	
//__________________________P.P__________________________
VAR
	alumnos: lista_alumnos;
BEGIN
	GenerarLista(alumnos);
	RecorrerListaEliminar(alumnos);
END.