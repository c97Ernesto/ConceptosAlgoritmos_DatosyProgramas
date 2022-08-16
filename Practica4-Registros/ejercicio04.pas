{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el
valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde
se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

function buscarPosElem (x: integer; v: vecAlumnos; dl: indice): integer;
var
	pos: indice;;
	ok: boolean;
begin
	pos:= 1;
	ok:= false;
	while (i <= dl) and (not ok) do
		if (x = v[pos]) then
			ok:= true
		else
			pos:= pos + 1;
	if (ok = false) then
		pos:= -1;
	buscarPosElem:= pos;
end;

Procedure intercambio (var v: vector; , x, y: integer);
var
	aux: integer;
begin
	aux:= v[x];
	v[x]:= v[y];
	v[y]:= aux;
end;

Function sumaVector (v: vector): integer;
var
	i: integer;
	total: integer;
begin
	total:= 0;
	for i:= 1 to dimF do
		total:= total + v[i];
	sumaVector:= total;
end;

Function promedio (v: vector; dimF: integer): real;
var
	i: integer;
begin
	promedio:= (sumaVector(v) / dimF);
end;

Function maximo (v: vector; dimF: integer): integer;
var
	i, max: integer;
begin
	max:= 1;
	for i:= 2 to dimF do
		if (v[i] > v[max]) then
			max:= i;
	maximo:= max;
end;

Function minimo (v: vector; dimF: integer): integer;
var
	i, min: integer;
begin
	min:= 1;
	for i:= 1 to dimF do
		if (v[i] < v[min]) then
			min:= i;
	minimo:= min;
end;