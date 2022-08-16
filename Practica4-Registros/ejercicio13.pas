{13. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 
3. lenticular; 4. irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde 
la Tierra. La Unión Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias 
que componen el Grupo Local. Realizar un programa que lea y almacene estos datos y, una vez 
finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) 
y el porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

Program Ejer13;
CONST
	MAX = 53;
TYPE
	str50 = string[50];
	rng_galaxias = 1..MAX;
	rng_tipo = 1..4;
	regGalaxia = record
		nombre: str50;
		tipo: rng_tipo;
		masa: real;
		pc: real;
	end;
	vecTipo = array [rng_tipo] of integer;
	vecGalaxia = array [rng_galaxias] of regGalaxia;
	
Procedure LeerVecGalaxiaVec (var v: vecGalaxia; var vT: vecTipo);		{InicializarVectorDeTipos, LeerRegistro,LlenarVectorDeTipos}
	Procedure IniVecTipo (var v: vecTipo);
	var
		i: rng_tipo;
	begin
		for i:= 1 to 4 do
			v[i]:= 0;
	end;
	Procedure leerRegGalaxia (var g: regGalaxia);
	begin
		with g do begin
			writeln('Nombre');
			readln(nombre);
			writeln('Numero de Tipo');
			readln(tipo);
			writeln('Masa');
			readln(masa);
			writeln('Parsec');
			readln(pc);
		end;
	end;
var
	i: rng_galaxias;
begin
	iniVecTipo(vT);
	for i:= 1 to MAX do begin
		leerRegGalaxia(v[i]);
	end;
end;
Procedure RecVecTipo(v: vecTipo);														{a}
var
	i: rng_tipo;
begin
	for i:= 1 to 4 do
		writeln('La cantidad de galaxias del tipo ',i,' es de ',v[i]); 
end;
Procedure RecVecGalaxia (v: vecGalaxia; var VT : vecTipo);										{b y c}
var
	i: rng_galaxias;
	totMasa, cantMasa: real;
	cantNoIrreg: integer;
begin
	cantMasa:= 0;
	cantNoIrreg:= 0;
	for i:= 1 to MAX do begin
        vT[v[i].tipo]:= vT[v[i].tipo] + 1;
		totMasa:= totMasa + v[i].masa;
		if ((v[i].nombre = 'Via Lactea') or (v[i].nombre = 'Andromeda') or (v[i].nombre = 'Triangulo')) then
			cantMasa:= cantMasa + v[i].masa;
		if (v[i].tipo <> 4) and (v[i].pc < 1000) then                                                      { totMasa _ 100%  }
			cantNoIrreg:= cantNoIrreg + 1;                                                                 { cantMasa _ x    }
	end;
	writeln('La cant de Galaxias no Irregulares es ',cantNoIrreg);
	writeln('La cant de Masa de las galaxias principales es de: ',cantMasa);    {no hace falta}
	writeln('El Porcentaje de las tres masas respecto a la masa de todas las galaxias es de: ', cantMasa*100/totMasa);
			
			
end;
VAR																					{P.P}
	vecT: vecTipo;
	vecG: vecGalaxia;
BEGIN																				
	LeerVecGalaxiaVec(vecG, vecT);
    RecVecGalaxia(vecG, vecT);
	RecVecTipo(vecT);

END.
	