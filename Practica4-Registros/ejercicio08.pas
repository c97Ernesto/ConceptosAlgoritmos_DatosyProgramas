{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad 
de Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, 
apellido, nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

Program Ejer8;
Const
	MAXal = 400
Type
	rng_al = 1..MAXal
	vecAlumnos = array [rng_al] of Alumnos
	Alumnos = record
		nroIns: integer;
		DNI: integer;
		apellido: str50;
		nombre: str50;
		anio: integer;
	end;
Procedure LeerVec(var v: vecAlumnos);
	Procedure leerReg(var a: Alumnos);
	begin
		with a do begin
			Writeln('Numero de Inscripcion');
			readln(nroIns);
			writeln('DNI');
			readln(DNI);
			writeln('Apellido');
			readln(apellido);
			writeln('Nombre');
			readln(nombre);
			writeln('Año de nacimiento');
			readln(anio);
		end;
	end;
var
	i: rng_al;
begin
	for i:= 1 to MAXal do begin
		leerReg(v[i]);
	end;
end;
Var
Begin

End;