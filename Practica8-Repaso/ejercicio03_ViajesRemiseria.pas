PROGRAM ejercicio03_Viajes;
CONST
	FIN = -1;

TYPE
	str100 = String[100];
	
	reg_Viaje = record
		numViaje: integer;
		codAuto: integer;
		dirOrigen: str100;
		dirDestino: str100;
		kmRecorridos: real;
	end;
	
	lista_Viajes = ^nodo;
	nodo = record
		datos: reg_Viaje;
		sig: lista_Viajes;
	end;
	
//__________________________Generar Lista Ordenada__________________________	
Procedure GenerarLista(var lV: lista_Viajes);
{Esta información se encuentra ordenada por código de auto y 
para un mismo código de auto pueden existir 1 o más viajes.}
	procedure leerInfo(var reg: reg_Viaje);
	begin
	    with reg do begin
	        write('Codigo de Auto: ');
	        readln(codAuto);
	        if(codAuto <> FIN) then begin
	            writeln('Numero de Viaje: ');
	            readln(numViaje);
	            write('Direccion Origen: ');
	            readln(dirOrigen);
	            write('Direccion Destino: ');
	            readln(dirDestino);
	        end;
	    end;
	end;
	
	procedure crearListaOrdenada(var l: lista_Viajes; datos: reg_Viaje);
	var
		ant, nodo, act: lista_Viajes;
	begin
		new(nodo);
		nodo^.datos:= datos;
		act:= l;
		while((act <> nil) and (datos.codAuto <= act^.datos.codAuto))do begin
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
	viaje: reg_Viaje;
Begin
    lV:= nil; 
    
	leerInfo(viaje);
	while(viaje.codAuto <> FIN) do begin
		crearListaOrdenada(lV, viaje);
		leerInfo(viaje);
	end;
End;
//__________________________Recorrer Lista y crear Nueva__________________________	
Procedure GenerarNuevaListaEInformar(lV: lista_Viajes; var lNueva: lista_Viajes);
{a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por
número de viaje.}
	procedure crearListaOrdenadaNroViaje(l: lista_Viajes; reg: reg_Viaje);
	var
		ant, nodo, act: lista_Viajes;
	begin
		new(nodo);
		nodo^.datos:= reg;
		act:= l;
		while((act <> nil) and (reg.numViaje <= act^.datos.numViaje))do begin
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
	regViajeAct: reg_Viaje;
	maxCod1, maxCod2: integer;
	cantKms, maxKms1, maxKms2: real;
Begin
	maxKms1:= 0;
	maxKms2:= 0;
	lNueva:= nil;
	
	while (lV <> nil) do begin
		regViajeAct:= lV^.datos;
		cantKms:= 0;
		
		while (lV <> nil) and (regViajeAct.codAuto = lV^.datos.codAuto) do begin
			if (lV^.datos.kmRecorridos > 5) then
				crearListaOrdenadaNroViaje(lNueva, lV^.datos);
		
			cantKms:= cantKms + lV^.datos.kmRecorridos;
			lV:= lV^.sig;
		end;
		
		if (cantKms > maxKms1) then begin
			maxKms2:= maxKms1;
			maxCod2:= maxCod1;
			maxKms1:= cantKms;
			maxCod1:= regViajeAct.codAuto;
		end
		else	
			if(cantKms > maxKms2) then begin
				maxKms2:= cantKms;
				maxCod2:= regViajeAct.codAuto;
			end;
	end;		
	
End;

//__________________________P.P__________________________	
VAR
    listaViajes: lista_Viajes;
    listaNuevaViajes: lista_Viajes;
BEGIN
    GenerarLista(listaViajes);
    GenerarNuevaListaEInformar(listaViajes, listaNuevaViajes);
END.