{14. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza 
todos los años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno 
de estos lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 
años, y con todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis 
estadísticos. Realizar un programa que lea y almacene los datos correspondientes a las mediciones 
de los últimos 50 años (la información se ingresa ordenada por año). Una vez finalizada la 
carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

PROGRAM ejer14;
CONST
	MAXanio = 50;
	MAXlugar = 100;
	
TYPE 
	rng_lugar = 1..MAXlugar;
	rng_anio = 1..MAXanio;
	vecLugar = array [rng_lugar] of real;
	vecAnios = array [rng_anio] of vecLugar;
	
Procedure LeerVecAnios (var v: vecAnios);						{Leer Vector Años}	
	Procedure leerVecLugar(var v: vecLugar);						
	var	
		i: rng_lugar;
	begin
		for i:= 1 to MAXlugar do begin
			writeln('Temperatura');
			readln(v[i]);
		end;
	end;
	
var 													
	i: rng_anio;
begin												
	for i:= 1 to MAXanio do
		leerVecLugar(v[i]);
end;

Procedure RecVecAnios(v: vecAnios);								{Recorrer Vector Años}
	Procedure RecVecLugar(v: vecLugar; var temProm: real; var max: real);									
	var
		i: rng_lugar;
	begin
		temProm:= 0;
		for i:= 1 to MAXlugar do begin
			temProm:= temProm + v[i];
			if (v[i] > max) then
				max:= v[i];
		end;
		temProm:= ((temProm*100) / MAXlugar);
	end;
	
var
	i: rng_anio;
	prom, temperatura, maxProm, maxTemp: real;
	anioMaxProm, anioMaxTemp: rng_anio;
begin
	maxProm:= 0;
	maxTemp:= 0;
	for i:= 1 to MAXanio do begin
		RecVecLugar(v[i], prom, temperatura);
		if prom > maxProm then
			maxProm:= prom;
			anioMaxProm:= i;
		if maxTemp < temperatura then
		    maxTemp:= temperatura;
			anioMaxTemp:= i;
	end;
	writeln('El año con mayor promedio fue: ',anioMaxProm);
	writeln('El año con mayor temperatura fue: ',anioMaxTemp);
end;

VAR
	vec: vecAnios;
BEGIN 
	LeerVecAnios(vec);					
	RecVecAnios(vec);					
END.
