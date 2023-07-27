{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la
mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que,
dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

Procedure ImpVecA (v: vector; dimL: integer);										{a}
var
	i: integer;
begin
	for i:= 1 to dimL do
		writeln(v[i]);
end;
Procedure ImpVecB (v: vector; dimL: integer											{b}
var	
	i: integer;
begin
	for i:= dimL downto 1 do
		writeln(v[i]);
end;
Procedure ImpVecC (v: vector; dimL: integer);										{c}
var	
	i, mitad: integer;
begin
	mitad:= (dimL div 2)
	for i:= mitad downto 1 do
		writeln(v[i]);
	for i:= (mitad + 1) to dimL do
		writeln(v[i]);
end;
Procedure ImpVecD (v: vector; x, y: integer);											{d}
var
	i: integer;
begin
	if (x <= y) then
		for i:= x to y do
			writeln(v[i]);
	else
		for i:= y to x do
			writeln(v[i]);
end;