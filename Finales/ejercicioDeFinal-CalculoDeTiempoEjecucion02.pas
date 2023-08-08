program ejercicio_CalculoDeTiempoEjecucion;
const
    dimF = 1000;
type
    rango = 1..dimF;
    cadena = string[30];
    empleado = record
        dni: integer;
        ape: cadena;
        nom: cadena;
        salario: real;
    end;

    vectorEmp = array [rango] of empleado;
    planta = record
        emps: ^vectorEmp;
        dimL: integer;
    end;

var
    p: planta;
    e: empleado;
    i: integer;

begin
    new (p.emps);
    p.dimL:= 0;     {1 ut}
    for i:= 1 to (dimF div 2) do begin  {1(div)ut + 3(n)ut + 2ut}
        {1ut + 3(500) + 2ut = 1ut + 1500ut + 2ut = 1503ut}
        read(e.dni); read(e.ape); read(e.nom); read(e.salario);
        e.salario:= e.salario * 2;  {2ut}
        p.emps^[i]:= e  {1ut}
        p.dimL:= p.dimL + 1;    {2ut}
    end;    {ut del for = 1503ut + 500(5)ut = 1503ut + 2500ut = 4003ut}

end.    {T(alg) = 4003ut + 1ut = 4004ut}    
