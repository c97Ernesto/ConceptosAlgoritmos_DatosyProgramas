{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados 
en el programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, 
un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan 
del proyecto, el nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar 
más de un proyecto. La información se ingresa ordenada consecutivamente por localidad y, para cada 
localidad, por escuela. Realizar un programa que lea la información de los proyectos hasta que se ingrese 
el proyecto con código -1 (que no debe procesarse), e informe:
o Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
o Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
o Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de 
dígitos pares e impares.}

PROGRAM EjerOcho;							{falto 2}
TYPE
	str50 = string[50];
	reg_Docente = record
		DNI: integer;
		nombre: str50;
		apellido: str50;
		email: str50;
	end;
	
	reg_Proyecto = record
		cod: integer;
		titulo: str50;
		docente: reg_Docente;
		alumnos: integer;
		escuela: str50;
		localidad: str50;
	end;
//____________________________PROCEDIMIENTOS__________________________________________
//_____________________________Leer________________________________________
Procedure LeerProyecto(var p: reg_Proyecto);

    Procedure LeerDocente(var d: reg_Docente);
    begin
        with d do begin
            writeln('DNI docente');
            readln(DNI);
            writeln('Nombre Docente');
            readln(nombre);
            writeln('Apellido Docente');
            readln(apellido);
            writeln('Email Docente');
            readln(email);
        end;
    end;
    
Begin
    with p do begin
        writeln('Codigo de Proyecto');
        readln(cod);
        if cod <> -1 then begin
            writeln('Titulo de Proyecto');
            readln(titulo);
            leerDocente(docente);           {no se le mandaba el docente del proyecto}
            writeln('Cantidad de alumnos');
            readln(alumnos);
            writeln('Escuela');
            readln(escuela);
            writeln('Localidad');
            readln(localidad);
        end;
    end;
end;

//___________________________________________Localidad_________________________________________________
Procedure localidad(var p: reg_Proyecto; var totEsc: integer);   {tiene que recibir nom1,nom2,max1,max2 por referencia}

	Procedure escuela(locAnt: str50;var p: reg_Proyecto; var tEsc, cant, cantAlu : integer);      {agregue parametro localidad actual}
	
		function parEimpar(cod: integer): boolean;
		var
			par, impar: integer;
		begin
            par:= 0;   {faltaba inicializar}
            impar:= 0;
			while cod <> 0 do begin
				if (((cod mod 10) mod 2) = 0) then {MOD 2 = 0 para ver si es par}
					par:= par + 1
				else
					impar:= impar + 1;
				cod:= cod div 10;
			end;
			parEimpar:= (par = impar);	
		end;
		
	var									{escuela}
		escAnt: str50;
	begin
        cantAlu:= 0; {inicializar}
		escAnt:= p.escuela;
		while (p.escuela = escAnt) and (p.localidad = locAnt) and (p.cod <> -1) do begin    {controlar que sea la misma localidad tambien}
			cant:= cant + 1;
			tEsc:= tEsc + 1;
			if (locAnt = 'Daireaux') then     {localidad}
				if (parEimpar(p.cod)) then
					writeln('Titulo de proyecto con misma cant de par que impar de Daireaux',p.titulo);
			cantAlu:= cantAlu + p.alumnos;
			LeerProyecto(p);
		end;
	end;
	
var										{localidad}
	locAnt: str50;
	cantEsc: integer;
    cantAlu: integer;
begin
	locAnt:= p.localidad;
	cantEsc:= 0;
	while (p.localidad = locAnt) and (p.cod <> -1) do begin
		escuela(locAnt, p, totEsc, cantEsc, cantAlu);
        { calcular maximo }
    end;
	writeln('La cantidad de escuelas en: ',locAnt,' fue de: ',cantEsc);
end;

//____________________________________P.P____________________________________________
VAR                                                                                                         
	pro: reg_Proyecto;
	totalEsc: integer;
BEGIN
    totalEsc:= 0; {faltaba inicializar}
	LeerProyecto(pro);
	while (pro.cod <> -1) do begin 
		localidad(pro, totalEsc);
	end;
	writeln('El total de descuelas que presentaron proyectos fue de: ',totalEsc); 
END.
