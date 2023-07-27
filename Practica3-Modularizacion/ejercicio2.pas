{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de 
casamientos durante el año 2017. Para ello, cuenta con información de las fechas de todos los 
casamientos realizados durante ese año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido en “a.”.
c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2017. La lectura finaliza al ingresar 
el año 2018, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de 
verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. 
Nota: utilizar el módulo realizado en “b.” para la lectura de fecha.}

Program EjerDos;    
type
  rango_dias = 1..31;
  rango_meses = 1..12;
  rango_anios = 2017..2018;
  
  fecha = record
        dia: rango_dias;
        mes: rango_meses;
        anio: rango_anios;
    end;   
	
Procedure LeerFecha(var f: fecha);
begin
    with f do begin
        writeln('Ingrese anio');
        readln(anio);
        if anio <> 2018 then begin
            writeln('Ingrese mes');
            readln(mes);
            writeln('Ingrese dia');
            readln(dia);
        end;
    end;
end;

Var
    f: fecha;
    cantVerano, cant10dias : integer; {faltaban declarar}
Begin
    cantVerano:= 0;
    LeerFecha(f);
    while (anio <> 2018) do begin
        mesActual:= f.mes
        cant10dias:= 0
        while (f.mes = mesActual) do begin       {este while no hace falta}
            if f.mes <= 3 then
                cantVerano:= cantVerano + 1;
            if f.dia <= 10 then
                cant10dias:= cant10dias + 1;
            LeerFecha(f);
        end;
        writeln('La cantidad en los primeros 10 dias del mes ',mesActual,' fue de: ',cant10dias);
    end;
    writeln('La cantidad de casamientos realizados en los meses de verano fue de: ',cantVerano);
End
