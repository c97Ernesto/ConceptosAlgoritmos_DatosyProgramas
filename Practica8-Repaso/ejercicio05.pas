{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en
kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura
finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión
que menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año
en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos
impares.
Nota:​ Los códigos de viaje no se repiten.}

PROGRAM EjercicioCinco;
Const
	MAX = 100;
Type
	cadena10: string[10];
	anio: 1900..3000;
	camiones = 1..MAX;
	vector = array [camiones] of flota
	camion = record
		patente: integer;
		añoFabricacion: anio;
		capacidad: real;
	end;
	viaje = record
		codViaje: integer;
		codCamion: camiones
		kms: real;
		ciudadDestino: string;
		añoViaje: anio;
		dniChofer: integer;
	end;
	lista = ^nodo
	nodo = record
	   datos: viaje;
	   sig: lista;  
    end;
Procedure GenerarLista (var l: nil);
	Procedure almacenarInfo (var d: viaje)
	begin
		with d do begin
			read(codViaje);
			if codViaje <> -1) then begin
				read(codCamion);
				read(kms);
				read(ciudadDestino);
				read(añoViaje);
				read(dniChofer);
			end;
	end;
	Procedure insertarOrdenado (var l: lista);
	var
		nodo, act, ant: lista;
	begin
		new(nodo);
		nodo^.datos:= d;
		act:= l
		while (l <> nil) and (d.codViaje > act^.datos.codViaje)
			ant:= act;
			act:= act^.sig;
		end;
		if l = act then begin
			l:= nodo
		else
			ant^.sig:= nodo;
		nodo^.sig:= act;
	end;
var
	d: viaje;
begin
	almacenarInfo(d);
	while (d.codViaje <> -1) do begin
		insertarOrdenado(l, d);
		almacenarInfo(d);
	end;
end;

Procedure recorrerLista(l: lista, v: vector);
	Function maxYmin(var max, min: real; var pmax, pmin: integer; v: vector; kms: real; cod: camiones): integer;
	var
		i: camiones;
	begin
		if kms > max then
			max:= kms;
			pmax:= v[cod].patente;						//acceso directo al arreglo mediante el codigo de camion
		end;
		if kms < min then begin
			min:= kms;
			pmin:= v[cod].patente;
		end;
	end;
	Function incisoDos (codC: integer; anioF: integer; v: vector): boolean; 						//Inciso 2
	var
		antiguedad: integer;
	begin
		antiguedad:= aniof - v[cod].añoFabricacion;
		if (v[codC].capacidad > 30,5) and (antiguedad > 5) then
			IncisoDos:= true;
			else
				IncisoDos:= false;
	end;
	Function incisoTres (num: integer): boolean;													//Inciso 3
	var
	
	begin
		ok:= true;
		while (num <> 0) and (ok) do begin
			resto:= num mod 10;
			if ((resto mod 2) = 0)
				ok:= false;
			num:= num div 10;
		end;
	end;
var
	max, min: real
	patenteMax, patenteMin, cantV: integer;
begin
	while (l <> nil) do begin
		maxYmin(max, min, patenteMax, patenteMin, vecCamiones, l^.datos.kms, l^.datos.codCamion);
		if incisoDos( l^.datos.codCamion, l^.datos.añoFabricacion, v) then
			cantV:= cantV + 1;
		if incisoTres(l^.datos.dniChofer); then
			writeln(l^.datos.codViaje);
		l:= l^.sig;
	end;
	writeln('El camion con mas kms fue: ',patenteMax,' y el de menos kms fue: ',patenteMin);
	writeln('La cantidad de viajes es de: ',cantV);
end;

var

begin

end;