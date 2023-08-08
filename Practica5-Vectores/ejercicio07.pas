{
7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que
no debe procesarse) e informe:
    − la cantidad de ocurrencias de cada dígito procesado.
    − el dígito más leído
    − los dígitos que no tuvieron ocurrencias.
}

CONST
	MAX_enteros = 20;
	MAX_ocurrencias = 9;

TYPE
	rangoEnteros = 0..MAX_enteros;
	rangoOcurrencias = 0..MAX_ocurrencias;
	
	vec_integer = array [rangoEnteros] of integer;
	vec_ocurrencias = array [rangoOcurrencias] of integer;
	
{_______________________InicializarVectorEnteros_______________________}
Procedure InicializarVectorEnteros(var v: vec_integer);
Var
    i: rangoEnteros;
Begin
    for i:= 1 to MAX_enteros do
        v[i]:= 0;
End;
{_______________________InicializarVectorOcurrencias_______________________}
Procedure InicializarVectorOcurrencias(var v: vec_ocurrencias);
Var
    i: rangoEnteros;
Begin
    for i:= 0 to MAX_ocurrencias do
        v[i]:= 0;
End;

{_______________________CargarVectorEnteros_______________________}
Procedure CargarVectorEnteros(var v: vec_integer; var dimL: rangoEnteros);
Var
    num: integer;
Begin
    dimL:= 0;
    
    write('Ingresar número: ');
    readln(num);
    
    while (dimL < MAX_enteros) and (num <> -1) do begin
        dimL:= dimL + 1;
        v[dimL]:= num;
        
        write('Ingresar número: ');
        readln(num);
    end;
End;

{_______________________CargarVectorOcurrencias_______________________}
Procedure CargarVectorOcurrencias(vE: vec_integer; dimL: rangoEnteros; var vO: vec_ocurrencias);

    procedure descomponerEntero(var vO: vec_ocurrencias; n: integer);
    var
        resto: rangoOcurrencias;
    begin
        while (n <> 0) do begin
            resto:= n mod 10;
            vO[resto]:= vO[resto] + 1;
            writeln(vO[resto]);
            n:= n div 10;
        end;
    end;

Var
    i: rangoOcurrencias;

Begin

    for i:= 1 to dimL do
        descomponerEntero(vO, vE[i]);
    
End;

{_______________________Mostrar Vector Enteros_______________________}
Procedure MostrarVectorEnteros(v: vec_integer);
Var
    i: rangoEnteros;
Begin
    for i:= 1 to MAX_enteros do 
        writeln('Posición ', i, ': ',v[i]);
End;
{_______________________Mostrar Vector Ocurrencias_______________________}
Procedure MostrarVectorOcurrencias(v: vec_ocurrencias);
Var
    i: rangoOcurrencias;
Begin
    for i:= 0 to MAX_ocurrencias do 
        writeln('Posición ', i, ': ',v[i]);
End;

{_______________________P.P_______________________}
VAR
    vecEnteros: vec_integer;
    vecOcurrencias: vec_ocurrencias;
    dimL: rangoEnteros;
BEGIN
    InicializarVectorEnteros(vecEnteros);

    InicializarVectorOcurrencias(vecOcurrencias);
    
    CargarVectorEnteros(vecEnteros, dimL);
    MostrarVectorEnteros(vecEnteros);
    
    CargarVectorOcurrencias(vecEnteros, dimL, vecOcurrencias);
    MostrarVectorOcurrencias(vecOcurrencias);
END.
