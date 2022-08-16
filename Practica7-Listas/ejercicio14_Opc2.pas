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

PROGRAM EJER14							{METODO 2 (sin terminar)}
CONST

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
	
	vecAlumno = array [rng_alumno] of lista;   {alternativa: vector de alumnos con listas de viajes ordenadas por dia}

//_____________________________________PROCEDIMIENTOS_____________________________________________
//_____________________________________Vector Alumnos_____________________________________________

Procedure GenerarVecAlumnos (var vA: vecAlumno);

	procedure GenerarLista (var l: lista);
	
		procedure leerReg (var r: regViaje);
		begin
			with r do begin
				read(codAlumno);
                if codAlumno <> -1 then begin
					read(dia);
					read(facultad);
					read(transporte);
				end;
			end;
		end;
		
		procedure crearNodo(var l: lista; r: regViaje);
		var
			ant, nodo, act: lista;
		begin
			new(nodo);
			nodo^.datos:= r;
			act:= l;
			while (act <> nil) and (r.dia < act^.datos.dia) do begin
				while (act <> nil) and (r.dia < act^.datos.dia) and (r.codAlumno < act^.datos.codAlumno) do begin
					ant:= act;
					act:= act^.sig;
				end;
				if not((act <> nil) or (r.dia < act^.datos.dia)) then			//CORREGIR
					ant^.sig:=
					
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
	i: rng_alumno;
Begin
	for i:= 1 to 1300 do                { for i:= 1 to 1300 do agregar en v[codAlumno] }
		GenerarLista(vA[i]);
End;