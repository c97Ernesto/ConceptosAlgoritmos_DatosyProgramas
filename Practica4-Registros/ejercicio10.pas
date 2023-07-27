{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo
(a lo sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) 
o cuando se completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un 
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y 
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}
program Ejer10;
Const
    MAX = 300;
Type
    indice = 0..MAX;
    vector = array [1..MAX] of real;

Procedure LeerSalario (var v: vector; var dl: indice);
var
    s: real;
begin
    dl:= 0;
    writeln('Salario');
    readln(s);
    while (s <> 0) and (dl < MAX) do begin
        dL:= dL + 1;
        v[dl]:= s;
        writeln('Salario');
        readln(s);
    end;
end;
Procedure Incremento (var v: vector; dl: indice; x: real);
var
    i: indice;
begin
    for i:= 1 to dl do 
        v[i]:= v[i] * x;
end;
Procedure Promedio (v: vector; dl: indice);
var
    i: indice;
    prom: real;
begin
    prom:= 0;
    for i:= 1 to dl do 
        prom:= prom + v[i];
    writeln('El promedio total de los salarios fue de: ',(prom * 100) / dl);
end;
Var
    v: vector;
    dimL: indice;
Begin
    LeerVector(v, dimL);
    Writeln('Ingrese incremento');
    Incremento(v, dimL, 1.15);
    Promedio(v, dimL);
End