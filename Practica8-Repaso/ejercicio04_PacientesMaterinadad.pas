{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}
PROGRAM ejercicio4;
Const
	FIN = 'ZZZ';
	MAXsemanas = 42;
Type
	cadena50 = string[50];
	rng_semanas = 1..MAXsemanas;
	vec_Semanas = array [rng_semanas] of real;
	
	reg_Paciente = record
		nombre: cadena50;
		apellido: cadena50;
		vSemanas: vec_Semanas; 
		dimL: integer;
	end;
	
	lista_Pacientes = ^nodo;
	nodo = record
		datos: reg_Paciente;
		sig: lista_Pacientes;
	end;
	
//__________________________Generar Lista Pacientes__________________________	
Procedure GenerarLista(lP: lista_Pacientes);													//GENERAR LISTA

	procedure leerPaciente(var p: reg_Paciente);
		procedure leerVector(var v: vec_Semanas);
		var
			peso: real;
			i: integer;
		begin
			for i:= 1 to MAXsemanas do begin
				writeln('Ingrese peso de la semana: ',i);
				readln(peso);
				v[i]:= peso;
			end;
		end;
		
	begin
		with p do begin
			write('Ingrese nombre: ');
			readln(nombre);
			if (nombre <> FIN) then begin
				write('Ingrese apellido: ');
				readln(apellido);
				leerVector(vSemanas);
			end;
		end;
	end;
	
	procedure agregarAdelante(var l: lista_Pacientes; p: reg_Paciente);
	var
	    nodo: lista_Pacientes;
	begin
	    new(nodo);
	    nodo^.datos:= p;
	    nodo^.sig:= nil;
	    l:= nodo;
	end;
	
var
	paciente: reg_Paciente;
begin
	lP:= nil;
	leerPaciente(paciente);
	while (paciente.nombre <> FIN) do begin
		agregarAdelante(lP, paciente);
		leerPaciente(paciente);
	end;
end;

//__________________________Recorrer Lista__________________________	
Procedure RecorrerPacientes(lP: lista_Pacientes);

	Procedure recorrerVecSemanas(v: vec_Semanas; var totalPeso: real; var max: rng_semanas);
	var
		i: rng_semanas;
	begin
		totalPeso:= 0;
		max:= 1;
		
		for i:= 2 to MAXsemanas do begin
			totalPeso:= totalPeso + v[i];
			
			if (v[i] > v[max]) then
				max:= i;
		end;
	end;

Var
	totalPeso: real;
	maxSemana: rng_semanas;

Begin

	while(lP <> nil) do begin
		recorrerVecSemanas(lP^.datos.vSemanas, totalPeso, maxSemana);
		writeln('La semana que mas aumento de peso tuvo ', lP^.datos.nombre, ' es la semana ', maxSemana,'.');
		writeln('Y el aumento de peso Total en las semanas fue de: ', totalPeso);
		lP:= lP^.sig;
	end;
		
End;
//__________________________P.P__________________________	
VAR
	listaPacientes: lista_Pacientes;
BEGIN
	GenerarLista(listaPacientes);
	RecorrerPacientes(listaPacientes);
END.