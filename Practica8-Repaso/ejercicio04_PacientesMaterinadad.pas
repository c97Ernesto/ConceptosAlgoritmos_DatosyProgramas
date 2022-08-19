{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

PROGRAM ejercicio4;
Const
	dimF = 42;
Type
	cadena50 = string[50];
	semanas = 1..dimF;
	vector = array [semanas] of real;
	paciente = record
		nombre: cadena50;
		apellido: cadena50;
		vecSemanas: vector; 
		dimL: integer;
	end;
	lista = ^nodo;
	nodo = record
		datos: paciente;
		sig: lista;
	end;
Procedure GenerarLista(l: lista);													//GENERAR LISTA
	procedure leerPaciente(var p: paciente);
		procedure leerVector(var v: vector; dim: semanas);
		var
			peso: real;
			i: integer;
		begin
			for i:= 1 to dim do begin
				writeln('Ingrese peso de la semana: ',i);
				readln(peso);
				v[i]:= peso;
			end;
		end;
	begin
		with p do begin
			writeln('Ingrese nombre: ');
			read(nombre);
			writeln('Ingrese apellido: ');
			read(apellido);
			writeln('Ingrese cantidad de semanas de embarazo: ');
			read(dimL);
			while dimL > dimF do begin
				writeln('El valor excede la cantidad de semanas.');
				read(dimL);
			end;
			leerVector(vecSemanas, dimL);
		end;
	end;
	procedure agregarAdelante(var l: lista; p: paciente);
	var
	    nodo: lista;
	begin
	    new(nodo);
	    nodo^.datos:= p;
	    nodo^.sig:= nil;
	    L:= nodo;
	end;
var
	p: paciente;
begin
	leerPaciente(p);
	while (p.nombre <> '') do begin
		agregarAdelante(l, p);
		leerPaciente(p);
	end;
end;

Procedure Item_AyB (l: lista);															//Item_A
	procedure recorrerVector(v: vector; var s: integer; var t: real);
	var
		i: semanas;
		p: real;
	begin
		p:= -1;
		s:= 0;
		t:= 0;
		for i:= 1 to dimL do begin
			t:=v[i];
			if v[i] > p then begin
				p:= v[i];
				s:= i;
			end;
		end;
	end;
var
	sem: semanas;
	tot: real;
begin
	while (l <> nil) do begin
		writeln('Nombre: ',l^.datos.nombre);
		writeln('Apellido :',l^.datos.apellido);
		recorrerVector(l^.datos.vecSemanas, sem, tot);
		writeln('La semana de mayor aumento de peso fue: ',sem);
		writeln('El aumento total de peso fue: ',tot);
		l:= l^.sig;
	end;
end;

var																					//PROGRAMA PRINCIPAL
	L: lista;
begin
	L:= nil;
	GenerarLista(L);
	Item_AyB(L);
end;