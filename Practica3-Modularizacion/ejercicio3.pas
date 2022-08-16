{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la 
provincia de Bs. As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente 
calculada por la UNESCO para el año 2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: 
CUE (código único de establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, 
localidad. Se pide implementar un programa que procese la información y determine:
o Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
o CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a. Un módulo para la lectura de la información de la escuela.
b. Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la 
cantidad de alumnos y la cantidad de docentes).}

Program EjerTres;
Const
    MaxEsc = 2400;
Type
    str50 = string[50];
    escPrimaria = record
        CUE: integer;
        nombre: str50;
        cantDocentes: integer;
        cantAlumnos: integer;
        localidad: str50;
    end;                                                  {agregue nombres como parametro}
Procedure Maximos(cue: integer; nom : str50; rel: real; var cue1, cue2: integer; var max1, max2: real; var nom1, nom2: str50);
begin
    if rel > max1 then begin
        max2:= max1;                        {falta guardar nombres}
        cue2:= cue1;
        max1:= rel;
        cue1:= cue;
     end
        else
         if rel > max2 then begin          {agregue if}
            max2:= rel;
            cue2:= cue;                    {faltaria nombre}
        end;
end;
Procedure LeerEsc(var e: escPrimaria);
begin
    with e do begin
        writeln('CUE:');
        readln(CUE);
        writeln('Nombre');
        readln(nombre);
        writeln('Cantidad de Docentes:');
        readln(cantDocentes);
        writeln('Cantidad de Alumnos:');
        readln(cantAlumnos);
        writeln('Localidad:');
        readln(localidad);
    end;
end;

Function relacion(d: integer; a: integer): real;
begin
    relacion:= (a / d);
end;

VAR
    escuela: escPrimaria;
    cue1, cue2, cantLP, i: integer;
    max1, max2: real;
    nom1, nom2 : str50; {agregue nombres maximos}
BEGIN
    max1:= 0;
    max2:= 0;
    for i:= 1 to MaxEsc do begin
        LeerEsc(escuela);                                                                 
        if (escuela.localidad = 'La Plata') and (relacion(escuela.cantDocentes, escuela.cantAlumnos) > 23.435) then
            cantLP:= cantLP + 1;
        maximos(escuela.CUE, escuela.nombre, relacion(escuela.cantDocentes, escuela.cantAlumnos), cue1, cue2, max1, max2, nom1, nom2);
    end;
    writeln('Las de La Plata son: ',cantLP);
    writeln('Las mejores relaciones alumno/docente son: ',cue1,' y ',cue2);
    {falta informar nom1 y nom2}
END.