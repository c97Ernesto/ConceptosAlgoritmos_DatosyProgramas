{Se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 5000).
De cada participante se tiene dni, nombre, apellido, categoría(1..5),  y fecha de inscripción.
Se pide implementar un programa que guarde en una estructura adecuada los participantes de 
aquellas categorías que posean a lo sumo 50 incriptos. Se sabe que cada participante se puede
anotar en una sola categoría.}

PROGRAM ejercicioFinal;

CONST
	MAXcategorias = 5;
	MAXparticipantes = 5000;
TYPE
	str20 = string[20];
	
	rng_categoria = 1..MAXcategorias;
	rng_participantes = 1..MAXparticipantes;
	
	reg_participante = record
		dni: integer;
		nombre: str20;
		apellido: str20;
		categoria: rng_categoria;
		fechaInscripcion: str20;
	end;
	
	vec_participantes = array [rng_participantes] of reg_participante;
	
	vec_categorias = array [rng_categoria] of integer;
	
	lista = ^nodo;
	nodo = record
		datos: reg_participante;
		sig: lista;
	end;
	
//_____________________________Cargar Participantes_____________________________
Procedure CargarParticipantesYCategorias(var vP: vec_participantes; var dL: rng_participantes; var vC: vec_categorias);
Begin

End;
//_____________________________Generar Lista_____________________________	
Procedure GenerarListaParticipantes(var l: lista; vP: vec_participantes; dimL: rng_participantes; vC: vec_categorias);
	procedure crearLista(var l: lista; reg: reg_participante);
	var
		nodo: lista;
	begin
		new(nodo);
		nodo^.datos:= reg;
		nodo^.sig:= l;
		l:= nodo;
	end;
	
Var
	i: rng_participantes;
	
Begin
	l:= nil;
	for i:= 1 to dimL do
		if (vC[vP[i].categoria] > 50) then		//si en la categoria del participante hay mas de 50 inscriptos...
			crearLista(l, vP[i])		//pasamos la lista y el registro i del vector participantes 
End;
	
//_____________________________P.P_____________________________
VAR
	vecParticipantes: vec_participantes;
	vecCategorias: vec_categorias;
	l: lista;
	dimL: rng_participantes;
BEGIN
	C	argarParticipantesYCategorias(vecParticipantes, dimL, vecCategorias); //se dispone
	GenerarListaParticipantes(l, vecParticipantes, dimL, vecCategorias);
END.
