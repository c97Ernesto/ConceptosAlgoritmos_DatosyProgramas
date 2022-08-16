{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2018. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección
de destino y kilómetros recorridos durante el viaje. Esta información ​ se encuentra ordenada ​ por
código de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por
número de viaje.}

PROGRAM ejercicio3;

Type
	viaje = record
		numViaje: integer;
		codAuto: integer;
		dirOrigen: string;
		dirDestino: string;
		kmsViaje: real;
	end;
	lista: ^nodo;
	nodo = record
		datos: viaje;
		sig: lista;
	end;

Procedure GenerarLista (var l: lista)													//GenerarLista
    procedure ingresarDatos (var v: viaje);
    var
        v: viaje
    begin
        with v do begin
            write('Numero de Viaje:');
            readln(numViaje);
            write('Codigo de Auto');
			readln(codAuto);
			write('Ciudad de Partida');
			readln(dirOrigen);
			write('Ciudad de Destino');
			readln(dirDestino);
			write('Kilometros Recorridos');
			readln(kmsViaje);
		end;
	end;
var
	infoV: viaje
begin
	ingresarDatos(infoV);
	while infoV.numViaje <> 0 do begin 
		ingresarDatos(infoV);
		insertarOrdenado(l, infoV);
	end;
end;

procedure insertarOrdenado (var l: lista; v: viaje);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.datos:= v;
	act:= l;
	while (l <> nil) and (v.codAuto > act^.datos.codAuto) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (l = act) then
		l:= nue;
	else 
		ant^.sig:= nue;
	nue^.sig:= act;
end;

end;
Procedure Informar_A (l: lista);													//Informar_A
	Procedure maximos(k: real; var k1, k2: real; c: integer; var c1, c2: integer); 
	begin
		if k > k1 then begin
			k2:= k1;
			k1:= k;
			c2:= c1
			c1:= c;
		end;
		else begin
			if k > k2 then begin
				k2:= k;
				c2:= c;
			end;
		end;
	end;
var
	k1, k2: real;
	c1, c2: integer;
begin
	k1:= 0;
	k2:= 0;
	while (l <> nil) then begin
		Procedure maximos(l^.datos.kmsViaje, k1, k2, l^.datos.codAuto, c1, c2); 
		l:= l^.sig;
	end;
	write('Los codigos de autos que mas KM hicieron fueron: ',c1,' y ',c2);
	
end;
Procedure GenerarNueLista(l: lista; var l2: lista);											//GenerarNueLista
var
begin
	l2:= nil
	while (l <> nil) do begin
		if (l^.datos.kmsViaje > 5) then begin
			insertarOrdenado(l2, l^.datos);
		l:= l^.sig;
	end;
	if l2 = nil then
		write('No hubo viajes de mas de 5 Km');
	end;
end;

var
	L, L2: lista;
begin
	L:= nil
	GenerarLista(L);
	Informar_A(L)
	GenerarNueLista(L,L2);
end;
