{Dado un vector de valores enteros (con dimFisica de 100), implementar un módulo que
reciba dicho vector y devuelve otro vector que contenga solamente aquellos valores 
que se encuentren en posiciones impares del vector recibido.
Declare todos los tipos de datos necesarios.}
PROGRAM EjercicioDeFinal;
CONST
    dimF1 = 100;
    dimF2 = 50;
TYPE
    vec_Enteros1 = array [1..dimF1] of integer
    vec_Enteros2 = array [1..dimF2] of integer
    
Procedure AgregarAVector (v1: vec_Enteros1; var v2: vec_Enteros2);
Var
    i, j: integer;
Begin
    j:= 0
    for i:= 1 to dimF1 do begin
        if ((i mod 2) <> 0)
            j:= j + 1;
            v2[j]:= v1[i] ;
    end;
End;