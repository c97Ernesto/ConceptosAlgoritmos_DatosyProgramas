{
char        1 byte
Integer     6 bytes
Real        8 bytes
Boolean     1 byte
String      Longitud + 1 byte
Puntero     4 bytes
}
program ejercicio_CalculoDeMemoria;
const
    dimF = 1000;    {6 bytes}
type
    rango = 1..dimF;
    cadena = string[30];    {31 bytes}

    empleado = record   {6 + 31 + 31 + 8 = 76 bytes}
        dni: integer;
        ape: cadena;
        nom: cadena;
        salario: real;
    end;
    vectorEmp = array [rango] of empleado;  {1000 * 76 = 76000 bytes}

    planta = record     {4 + 6 = 10 bytes}
        emps: ^vectorEmp;   
        dimL: integer;
    end;

var {MEMORIA ESTÁTICA: constantes + variables = (6) + (10 + 76 + 6) = 98 bytes}
    p: planta;  {10 bytes}
    e: empleado;    {76 bytes}
    i: integer;     {6 bytes}

begin   {MEMORIA DINÁMICA = 76000 bytes}
    new(p.emps);    {76000 bytes}
    p.dimL:= 0;
    for i:= 1 to (dimF div 2) do begin
        read(e.dni); read(e.ape); read(e.nom); read(e.salario);
        e.salario:= e.salario * 2;
        p.emps^[i]:= e
        p.dimL:= p.dimL + 1;
    end;
end.
