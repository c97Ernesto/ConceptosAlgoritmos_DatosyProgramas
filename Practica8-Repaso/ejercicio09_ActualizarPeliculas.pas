{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por
las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello
se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se
lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La
lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por
código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos
pares que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).}

PROGRAM ejercicio09;
CONST
	MAXgeneros = 8;
	FIN = -1;
TYPE
	rng_genero = 1..MAXgeneros;
	
	str50 = string[50];
	
	reg_critica = record
		dniCritico: integer;
		apeNom: str50;
		codPelicula: integer;
		puntajeOtorgado: real;
	end;
	
	reg_pelicula = record
		codigo: integer;
		titulo: str50;
		genero: rng_genero;
		puntajePromedio: real;
	end;
	
	lista_peliculas = ^nodo;
	nodo = record
		datos: reg_pelicula;
		sig: lista_peliculas;
	end;

//__________________________Generar Lista__________________________
Procedure GenerarLista(var l: lista_peliculas);
Begin
End;
	
//__________________________Recorrer Lista__________________________
Procedure RecorrerLista(var l: lista_peliculas);
{a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello
se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se
lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La
lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por
código de película.
}
	procedure leerCritica(var r: reg_critica);
	begin
		with r do begin
			readln(codPelicula);
			if (codPelicula <> -1) then begin
				readln(dniCritico);
				readln(apeNom);
				readln(puntajeOtorgado);
			end;
		end;
	end;
	
	procedure actulizarListaPelis(l: lista_peliculas; puntaje: real; cod:integer);
	begin
		while (cod <> l^.datos.codigo) do 
			l:= l^.sig;
		l^.datos.puntajePromedio:= l^.datos.puntajePromedio + puntaje;
	end;

Var
	critica: reg_critica;
	codAct: integer;
	puntajeCritica: real;
Begin
	leerCritica(critica);
	while (critica.codPelicula <> FIN) do begin
		puntajeCritica:= 0;
		codAct:= critica.codPelicula;
		
		while (critica.codPelicula <> FIN) and (critica.codPelicula = codAct) do begin
			puntajeCritica:= puntajeCritica + critica.puntajeOtorgado;
			leerCritica(critica);
		end;
			
		actulizarListaPelis(l, puntajeCritica, codAct);
	end;
End;

//__________________________P.P__________________________
VAR
	peliculas: lista_peliculas;
BEGIN
	GenerarLista(peliculas);	//se dispone
	RecorrerLista(peliculas);
END.











