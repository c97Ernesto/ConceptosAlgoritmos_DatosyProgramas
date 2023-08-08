{
char        1 byte
Integer     6 bytes
Real        10 bytes
Boolean     1 byte
String      Longitud + 1 byte
Puntero     4 bytes
}
program calcularMemoria;
type
    cadena43 = string[43]; {44 bytes}
    info = record   {44 bytes + 6 bytes = 50 bytes }
        nombre: cadena43;
        nota: integer;
    end;
    
    lista = ^nodo;  {4bytes}
    nodo = record   {50 bytes + 4 bytes = 54 bytes}
        datos: info;
        sig: lista;
    end;
    
    alumno = record    {44 bytes + 10 bytes = 54 bytes}
        ape_nom: cadena43;
        promedio: real;
    end;
    vector = array [1..10] of ^alumno; {10 * 4 bytes = 40 bytes}

var {MEMORIA ESTÁTICA: const + var = 40 + 54 + 12 + 50 + 4 = 160 bytes}
    v: vector;  {40 bytes}
    a: alumno;  {54 bytes}
    i, dimL: integer;   {12 bytes}
    e: info;    {50 bytes}
    aux: lista;     {4 bytes}

begin   {MEMORIA DINÁMICA = 270 bytes}
    dimL:= 5
    read(a.ape_nombre);
    i:= 0;
    while (i < 5) and (a.ape_nombre <> 'zzz') do begin
        read(a.promedio);
        new(v[i]);  {5 iteracion * 54 bytes = 270 bytes }
        v[i]^:= a;
        i:= i + 1;
        read(ape.ape_nom);
    end;
end;





