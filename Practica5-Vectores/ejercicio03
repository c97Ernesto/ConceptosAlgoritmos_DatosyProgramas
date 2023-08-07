{
3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
	a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.
	b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.
	c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera
	posición, y desde la mitad más uno hacia la última posición.
	d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el
	vector desde la posición X hasta la Y. Asuma que tanto X como Y son menores o igual a
	la dimensión lógica. Y considere que, dependiendo de los valores de X e Y, podría ser
	necesario recorrer hacia adelante o hacia atrás.
	e. Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a,
	b y c.
}
CONST
	dimF = 255;

TYPE
	rango = 1..dimF;
	vec_integer = array [rango] of integer;
	
{_______________________Cargar_______________________}
Procedure Cargar(var v: vec_integer; var dimL: rango);
Var
    i: rango;
Begin
    dimL:= 100;
    for i:= 1 to dimF do
        v[i]:= random(20);
        
End;
	
{a. Realizar un módulo que imprima el vector desde la primera posición hasta la última.}
Procedure a_Imprimir(v: vec_integer; dimL: rango);
Var
    i: rango;
Begin
    for i:= 1 to dimL do
        writeln('Posición ', i, ': ',v[i]);
End;

{b. Realizar un módulo que imprima el vector desde la última posición hasta la primera.}
Procedure b_Imprimir(v: vec_integer; dimL: rango);
Var
    i: rango;
Begin
    for i:= dimL downto 1 do
        writeln('Posición ', i, ': ', v[i]);
End;

{c. Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera
posición, y desde la mitad más uno hacia la última posición.}
Procedure c_Imprimir(v: vec_integer; var dimL: rango);
Var
    i, mitad: rango;
Begin
    mitad:= dimL div 2;
    
    for i:= mitad downto 1 do
        writeln('Posición ', i, ': ', v[i]);
        
    for i:= (mitad + 1) to dimL do
        writeln('Posición ', i, ': ', v[i]);
    
End;

{d. Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el
vector desde la posición X hasta la Y. Asuma que tanto X como Y son menores o igual a
la dimensión lógica. Y considere que, dependiendo de los valores de X e Y, podría ser
necesario recorrer hacia adelante o hacia atrás.}
Procedure d_Imprimir(v: vec_integer; dimL: rango; posX, posY: rango);
Var
    i, mitad: rango;
Begin

    if (posX <= posY) then
        for i:= posX to posY do
            writeln('Posición ', i, ': ', v[i])
    else
        for i:= posX downto posY do
            writeln('Posición ', i, ': ', v[i]);
            
End;

{_______________________P.P_______________________}
VAR
    vectorEnteros: vec_integer;
    dimensionLogica, posicionX, posicionY: rango;
BEGIN
    Cargar(vectorEnteros, dimensionLogica);
    writeln('Dimensión lógica = ', dimensionLogica);
    
    writeln('Item a');
    a_Imprimir(vectorEnteros, dimensionLogica);
    writeln('Item b');
    b_Imprimir(vectorEnteros, dimensionLogica);
    writeln('Item c');
    c_Imprimir(vectorEnteros, dimensionLogica);
    
    writeln('Item d');
    posicionX:= random(dimensionLogica);
    writeln('Posición X = ', posicionX);
    posicionY:= random(dimensionLogica);
    writeln('Posición Y = ', posicionY);
    d_Imprimir(vectorEnteros, dimensionLogica, posicionX, posicionY);
END.

