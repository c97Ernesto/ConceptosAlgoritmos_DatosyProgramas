{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de
la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de
1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 y 1300), día del mes,
facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren
universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más de un medio de
transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de datos
apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

PROGRAM EJER14;						{METODO 1 (sin terminar)}
TYPE
	str50 = string[50];

	rng_alumno = 1..1300;
	rng_dia = 1..31;
	rng_transporte = 1..5;

	regViaje = record
		codAlumno: rng_alumno;
		dia: rng_dia;
		facultad: str50;
		transporte: rng_transporte;
	end;

	vecTransporte = array [rng_transporte] of integer;
	vecPrecioViaje = array [rng_transporte] of real;

	lista = ^nodo;
	nodo = record                             {alternativa: lista simple ordenada por alumno, y secundariamente por dia}
		datos: regViaje;
		sig: lista;
	end;

	vecMes = array [rng_dia] of lista;       {alternativa: vector de alumnos con listas de viajes ordenadas por dia}

Procedure InicializarVecTransporte(var vT: vecTransporte);
Var
    i: rng_transporte;
Begin
	for i:= 1 to 5 do
		vT[i]:= 0;
End;

Procedure GenerarVecMes (var vM: vecMes);
	Procedure GenerarLista (var l: lista);
		procedure leerReg (var r: regViaje);
		begin
			with r do begin
				read(codAlumno);
                {if codigo <> -1}
				read(dia);
				read(facultad);
				read(transporte);
			end;
		end;
		procedure crearNodo(var l: lista; r: regViaje);
		var
			ant, nodo, act: lista;
		begin
			new(nodo);
			nodo^.datos:= r;
			act:= l;
			while (act <> nil) and (r.codAlumno < act^.datos.codAlumno) do begin
				ant:= act;
				act:= act^.sig;
			end;
			if (act = l) then
				l:= nodo
			else
				ant^.sig:= nodo;
			nodo^.sig:= act;
		end;
	var
	    r: regViaje;
	begin
        l:= nil; {falto inicializar}
		leerReg(r);
		while r.codAlumno <> -1 do begin   {distinto -1}
			crearNodo(l, r);
			leerReg(r);
		end;
	end;
Var
	i: rng_dia;

Begin
	for i:= 1 to 31 do                { for i:= 1 to 1300 do agregar en v[codAlumno] }
		GenerarLista(vM[i]);
End;

PROCEDURE RecorrerVecMes(vM: vecMes; vP: vecPrecioViaje; var vT: vecTransporte);

	Procedure recorrerLista(l: lista; vP: vecPrecioViaje; var vT: vecTransporte; var biciYotro: integer);
	var
		antCod, cant6viajes, cant80pesos, cantViajes: integer;
		pesos: real;
		bici, otroTrans: boolean;
	begin
		cant6viajes:= 0;
		cant80pesos:= 0;
		while (l <> nil) do begin
			bici:= False;
			otroTrans:= False;
			cantViajes:= 0;
			pesos:= 0;
			antCod:= l^.datos.codAlumno;
			while (l <> nil) and (l^.datos.codAlumno = antCod) do begin     {mantener condicion de fin}
				if l^.datos.transporte <> 0 then begin  {lo podemos sacar}
					cantViajes:= cantViajes + 1;
					pesos:= vP[l^.datos.transporte] + pesos;
					vT[l^.datos.transporte]:= vT[l^.datos.transporte] + 1;
					if (l^.datos.transporte = 5) then
						bici:= True
					else
						otroTrans:= True;
				end;
				l:= l^.sig;
			end;
			if (otroTrans and bici) then
				biciYotro:= biciYotro + 1;
			if (cantViajes > 6) then
				cant6viajes:= cant6viajes + 1;
			if (pesos > 80) then
				cant80pesos:= cant80pesos + 1;
		end;
		writeln('La cantidad de alumnos que realizaron mas de 6 viajes por dias es: ',cant6viajes);
		writeln('La cantidad de alumnos que gastan mas de 80 pesos por dias es: ',cant80pesos);
	end;

	Function Maximo (v: vecTransporte):rng_transporte;
	var
		i, max: rng_transporte;
	begin
		max:= 1;
		for i:= 2 to 5 do
			if v[i] > v[max] then      {serian dos maximos}
				max:= i;
		Maximo:= max;
	end;

Var
    i: rng_dia;
	cantBiciYotro: integer;
Begin
	for i:= 1 to 31 do
		RecorrerLista(vM[i], vP, vT, cantBiciYotro);
	write('El transporte mas utilizado fue: ',Maximo(vT));
	write('La cantidad de alumnos que usan bici y otro transporte es: ',cantBiciYotro);
End;

VAR
	vectorMes: vecMes;
	vectorPrecio: vecPrecioViaje;
	vectorTransporte: vecTransporte;
BEGIN
	InicializarVecPrecio(vectorPrecio);			{Se dispone}
	InicializarVecTransporte(vectorTransporte);
	GenerarVecMes(vectorMes);
	RecorrerVecMes(vectorMes, vectorPrecio, vectorTransporte);
END.

Procedure sublista(l: lista; a, b: integer; var l2: lista);
var
	nodo: lista;
begin
	if (l^.num > b) and (l^.num < a) then begin
		new(nodo);
		nodo^.num:= l^.num;
		nodo^.sig:= l2;
		l2:= nodo;
	end;
end;