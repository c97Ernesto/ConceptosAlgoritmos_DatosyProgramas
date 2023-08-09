{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al
espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de
meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del espectro
electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar
la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.}

PROGRAM Ejer6;
TYPE
	str50 = string[50];
	rngEspectro = 1..7;
	regZonda = record
		nombre: str50;
		meses: integer;
		costConst: real;
		costMant: real;
		espectro: rngEspectro;
	end;
	lista = ^nodo;
	nodo = record
		datos: regZonda;
		sig: lista;
	end;
	vecEspectro = array [rngEspectro] of integer;
{________________________Inicializar Vec________________________}
PROCEDURE InicializarVector(var v: vecEspectro);
var
	i: rngEspectro;
begin
	for i:= 1 to 7 do
		v[i]:= 0;
end;
{________________________Generar Lista________________________}
PROCEDURE GenerarLista (var l: lista; var vector: vecEspectro );
	procedure leerReg (var z: regZonda);
	begin
		with z do begin
			writeln('Nombre');
			readln(nombre);
			writeln('Meses en Orbita');
			readln(meses);
			writeln('Costo construccion');
			readln(costConst);
			writeln('Costo de Mantenimiento');
			readln(costMant);
			writeln('Espectro');
			readln(espectro);
		end;
	end;
	procedure crearNodo (var l: lista; z: regZonda);
	var
	    nodo: lista;
	begin
		new(nodo);
		nodo^.datos:= z;
		nodo^.sig:= l;
		l:= nodo;
	end;
var
	regZ: regZonda;
begin
	repeat
		leerReg(regZ);
		vector[regZ.espectro]:= vector[regZ.espectro] + 1;   {calcular mientras recorre}
		crearNodo(l, regZ);
	until (regZ.nombre = 'GAIA')
end;

{________________________Recorrer Vec________________________}
PROCEDURE RecorrerVector(v: vecEspectro);
var
	i: integer;
begin
	for i:= 1 to 7 do
		writeln('La cantidad de zondas que realizan estudios en el espectro ',i,' es de ',v[i]);

end;

{________________________Recorrer Lista________________________}
PROCEDURE RecorrerLista(l: lista);
	procedure recorrerListaProm(l: lista; var promCosto, promDuracion: real);
	var
		cant: integer;
	begin
	    cant:= 0;
		promCosto:= 0;
		promDuracion:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			promCosto:= promCosto + l^.datos.costConst;
			promDuracion:= promDuracion + l^.datos.meses;
            {pasar al siguiente}
		end;
		promCosto:= (promCost/ cant);
		promDuracion:= (promDuracion / cant);
	end;
	procedure Maximo(costo: real; nombre: str50; var max: real; var maxnom: str50);
	begin
		if (costo > max) then begin
			max:= costo;
			maxnom:= nombre;
		end;
	end;
var
	maxCost, promCosto, promDuracion: real;
	maxNom: str50;
	cantZ: integer;
begin
    cantZ:= 0;
	recorrerListaProm(l, promCosto, promDuracion);
	while (l <> nil) do begin
		Maximo(l^.datos.costConst + l^.datos.costMant * l^.datos.meses, l^.datos.nombre, maxCost, maxNom);
		if (promDuracion < l^.datos.meses) then
			cantZ:= cantZ + 1;
		if (promCosto < l^.datos.costConst) then
			writeln('La Zonda ',l^.datos.nombre,' supero el costo construccion de todas las zondas');			{d}

       {avanzar en la lista}
	end;
	writeln('La Zonda mas costosa es: ',maxNom);						{a}
	writeln('La cantidad de zondas que superan la duracion promedio es: ',cantZ);		{c}
end;

{________________________P.P________________________}
VAR
	L: lista;
	vector: vecEspectro;
BEGIN
	L:= nil;
	InicializarVector(vector);
	GenerarLista(L, vector);
	RecorrerVector(vector);				{b}
	RecorrerLista(L);
END.
