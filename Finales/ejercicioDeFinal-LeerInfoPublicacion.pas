{La facultad de informática organizará el congreso WICC, en donde se
expondrán trabajos de investigación. Realizar un programa que lea la 
información de cada publicación: título de la publicación, nombre del
autor, DNI del autor y tipo de publicación(1..12). La lectura de 
publicaciones finaliza al ingresar un DNI con valor 0 (el cual no debe
procesarse). La información se lee ordenada por DNI del autor y un autor
puede tener varias publicaciones. Se pide escribir un programa que: 
a. Informe el tipo de publicación con mayor cantidad de publicaciones.
b. Informar para cada autor la cantidad de publicaciones presentadas}

PROGRAM EjerDeFinal;
CONST
	MAXtipo = 12;
TYPE
	rng_tipo = 1..MAXtipo;
	
	reg_publicacion = record
		titulo: string;
		nombreAutor: string;
		DNI: integer;
		tipo: rng_tipo;
	end;
	
	lista = ^nodo;
	nodo = record
		datos: reg_publicacion;
		sig: lista;
	end;
	
	vec_tipos = array [rng_tipo] of integer;
	
Procedure GenerarLista(var l: lista; var vec: vec_tipos);

	procedure iniVector(var v: vec_tipos);
	var
		i: rng_tipo;
	begin
		for i:= 1 to MAXtipo do 
			v[i]:= 0;
	end;
	
	procedure leerInfo(var r: reg_publicacion; var v: vec_tipos);
	begin
		with r do begin
			readln(DNI);
			if (DNI <> 0) then begin
				readln(titulo);
				readln(nombreAutor);
				readln(tipo);
				v[tipo]:= v[tipo] + 1;
			end;
		end;
	end;
	
	procedure crearNodo(var l: lista; r: reg_publicacion);
	var
		ant, nodo, act: lista;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (r.DNI > act^.datos.DNI) do begin
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
	publicacion: reg_publicacion;
Begin
	l:= nil;
	iniVector(vec);
	leerInfo(publicacion, vec);
	while (publicacion.DNI <> 0) do begin
		crearNodo(l, publicacion);
		leerInfo(publicacion, vec);
	end;
End;

Function Maximo(v: vec_tipos): integer;
Var
	i, max: rng_tipo;
	
Begin
	for i:= 1 to MAXtipo do 
		if (v[i] > v[max]) then
			max:= i;
	Maximo:= max;
End;

Procedure RecorrerLista(l: lista);
Var
	cantPublic: integer;
	actAutor: string;
Begin
	while (l <> nil) do begin
		actAutor:= l^.datos.nombreAutor;
		cantPublic:= 0;
		while (l <> nil) and (actAutor = l^.datos.nombreAutor) do begin
			cantPublic:= cantPublic + 1;
			l:= l^.sig;
		end;
		writeln('La cantidad de Publicaciones para el Autor ', actAutor, ' es de ', cantPublic);
	end;
End;

VAR
	L: lista;
	vecTipos: vec_tipos;
BEGIN
	GenerarLista(L, vecTipos);
	writeln('El tipo de publicacion con mayor cantidad de publicaciones es: ', Maximo(vecTipos));
	RecorrerLista(L);
END.