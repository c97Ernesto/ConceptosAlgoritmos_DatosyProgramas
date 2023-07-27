{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la 
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente 
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, 
Atom, Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj 
(medida en Ghz) y tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información 
de los microprocesadores se lee de forma consecutiva por marca de procesador y la lectura finaliza al 
ingresar un procesador con 0 cores (que no debe procesarse). Se pide implementar un programa que lea 
información de los microprocesadores de la empresa importadora e informe:
A_Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
B_Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
C_Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen 
velocidades de al menos 2 Ghz.}
PROGRAM Ejer6;
TYPE
	rngCores = 1..10;
	str20 = string[20];
	infoMicro = record
		marca: str20;
		linea: str20;
		nucleos: rngCores;
		clkGhz: real;
		Nm: integer;
	end;

//______________________________PROCEDIMIENTOS__________________________________________
Procedure Punto1(n: integer; m, l: str20);
begin
	if (n <= 22) then begin { a lo sumo 22} {falta and (tenga mas de dos cores)}
		writeln('Transitores de menos de 22'); 
		Writeln(m);
		writeln(l);
	end;
end;

Function Cumple3(nucleo: rngCores; marca: str20; Ghz: real): boolean;
begin
	Cumple3:= (nucleo > 1) and ((marca = 'Intel') or (marca = 'AMD')) and (Ghz >= 2);
end;

Procedure Maximos(c: integer; var m1, m2: integer; mark: str20; var mark1, mark2: str20);
begin
	if c > m1 then begin
		m2:= m1;
		mark2:= mark1;
		m1:= c;
		mark1:= mark;
	end
	else
		if c > m2 then begin
			m2:= c;
			mark2:= mark;
		end;
end;

Procedure LeerProcesador(var p: infoMicro);
begin
	with p do begin
		writeln('Nucleos');
		readln(nucleos);
		while nucleos <> 0 do begin
			writeln('Marca');
			readln(marca);
			writeln('Linea');
			readln(linea);
			writeln('Velocidad del reloj');
			readln(clkGhz);
			writeln('Tama�o de transistor');
			readln(nm);
		end;
	end;
end;

//____________________________________P.P____________________________________________
VAR
	mPro: infoMicro;
	cant, cantCores, max1, max2: integer;
	ant, marca1, marca2: str20;
BEGIN
	max1:= 0;
	max2:= 0;
	cantCores:= 0;
	LeerProcesador(mPro);
	while (mPro.nucleos <> 0) do begin
		ant:= mPro.marca;
		cant:= 0;
		while (mPro.nucleos <> 0) and (mPro.marca = ant) do begin  {poner la condicion de fin de la secuencia}
			Punto1(mPro.nm, ant, mPro.linea);
			if Cumple3(mPro.nucleos, ant, mPro.clkGhz) then
				cantCores:= cantCores + 1;
			if (mPro.nm = 14) then
				cant:= cant + 1;
			LeerProcesador(mPro);
		end;
		Maximos(cant, max1, max2, ant, marca1, marca2);
	end;	
    {falta informar maximos}
    {falta informar cant. punto 3}
END.