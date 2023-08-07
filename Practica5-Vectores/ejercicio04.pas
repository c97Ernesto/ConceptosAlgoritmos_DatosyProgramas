{
4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
	a. posicion : dado un número X y el vector de números, retorna la posición del número X
	en dicho vector, o el valor -1 en caso de no encontrarse.
	b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna
	el mismo vector donde se intercambiaron los valores de las posiciones x e y.
	c. sumaVector: retorna la suma de todos los elementos del vector.
	d. promedio: devuelve el valor promedio de los elementos del vector.
	e. elementoMaximo: retorna la posición del mayor elemento del vector
	f. elementoMinimo: retorna la posicion del menor elemento del vector
}

CONST
	dimF = 10;

TYPE
	rango = 1..dimF;
	vec_integer = array [rango] of integer;

{_______________________Cargar_______________________}
Procedure Cargar(var v: vec_integer);
Var
    i: rango;
Begin
    for i:= 1 to dimF do
        v[i]:= random(20);
        
End;

{a. posicion : dado un número X y el vector de números, retorna la posición del número X
en dicho vector, o el valor -1 en caso de no encontrarse.}
Function posicion(v: vec_integer; x: integer): integer;
Var
    i: rango;
    
Begin
    i:= 1;
    
    while ((i < dimF) and (v[i] <> x)) do begin
        i:= i + 1;
    end;
    
    if(v[i] = x) then 
        posicion:= i
    else
        posicion:= -1;
    
End;

{b. intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna
el mismo vector donde se intercambiaron los valores de las posiciones x e y.}
Procedure intercambio(var v: vec_integer; x, y: rango);
Var
    z: integer;
Begin
    z:= v[x];
    v[x]:= v[y];
    v[y]:= z;
end;

{c. sumaVector: retorna la suma de todos los elementos del vector.}
Function sumaVector(v: vec_integer): integer;
Var
    i: rango;
    suma: integer;
    
Begin
    suma:= 0;
    
    for i:= 1 to dimF do
        suma:= suma + v[i];
        
    sumaVector:= suma;
End;

{d. promedio: devuelve el valor promedio de los elementos del vector.}
Function promedio(v: vec_integer): integer;
Var
    i: rango;
    suma: integer;
    
Begin
    suma:= 0;
    
    for i:= 1 to dimF do
        suma:= suma + v[i];
        
    promedio:= (suma div dimF);
End;

{e. elementoMaximo: retorna la posición del mayor elemento del vector}
Function elementoMaximo(v: vec_integer): rango;
Var
    i: rango;
    max: rango;
    
Begin
    max:= 1;
    
    for i:= 2 to dimF do        //si dimF < 2 -> no entra
        if (v[i] > v[max]) then
            max:= i;
        
    elementoMaximo:= max;
End;

{f. elementoMinimo: retorna la posicion del menor elemento del vector}
Function elementoMinimo(v: vec_integer): rango;
Var
    i: rango;
    min: rango;
    
Begin
    min:= 1;
    
    for i:= 2 to dimF do        //si dimF < 2 -> no entra
        if (v[i] < v[min]) then
            min:= i;
        
    elementoMinimo:= min;
End;

{P__________________________Imprimir__________________________}
Procedure a_Imprimir(v: vec_integer);
Var
    i: rango;
Begin
    for i:= 1 to dimF do
        writeln('Posición ', i, ': ',v[i]);
End;

{P__________________________P.P__________________________}
VAR
    vectorInteger: vec_integer;
    posX, posY: rango;
    n: integer;
BEGIN
    Cargar(vectorInteger);
    a_Imprimir(vectorInteger);
    
    n:= vectorInteger[7];
    writeln('Posición del elemento ', n, ' en el vector: ', posicion(vectorInteger, n));
    
    posX:= 3;
    posY:= 5;
    intercambio(vectorInteger, posX, posY);
    
    writeln('El elemento Máximo se encuentra en la posición: ', elementoMaximo(vectorInteger));
    writeln('El elemento Mínimo se encuentra en la posición: ', elementoMinimo(vectorInteger));
    writeln('Suma de los elementos del vector: ', sumaVector(vectorInteger));
    writeln('Promedio de los elementos del vector: ', promedio(vectorInteger));
    
END.
