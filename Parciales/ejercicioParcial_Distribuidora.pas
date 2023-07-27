{PARCIAL 2}
program parcialDistribuidora
const
	max_pagos = 4;
type
	formas_pagos = 1..max_pagos;
	vector_pagos = array [formas_pagos] of integer
	str50 = string[50];
	pedido = record
		pais: str50;
		costo: real;
		fpago: formas_pagos
	end;
	lista = ^nodo;
	nodo = record
		datos: pedido;
		sig: lista;
	end;

Procedure recorrerLista(l: lista; var v: vector_pagos);												//Inciso 1y2
var
	cosTotal:= 0;
	actStr:= str50;
begin
	while l <> nil do begin
		actStr:= l^.datos.pais;
		cosTotal:= 0;
		while (l <> nil) and (l^.datos.pais = actStr) do begin
			cosTotal:= cosTotal + l^.datos.costo;
			v[fpago]:= v[fpago] + 1;
			l:= l^.sig;
		end;
		writeln('El costo total del pedido de ',actStr,' es de ',cosTotal);
	end;
end;
Function recorrerVector(v: vector_pagos): formas_pagos;
var
	i, fp: formas_pagos;
	max: real;
begin
	max:= -1;
	for i:= 1 to max_pagos do begin
		if v[i] > max then begin
			max:= v[i];
			fp:= i;
		end;
	end;
	recorrerVector:= fp;
end;

var
	L:lista;
	vector: vector_pagos;
begin
	GenerarLista(L);{Se dispone}
	InicializarVector(vector);
	recorrerLista(L, vector);
	writeln('La forma de pago mas utilizada fue: ',recorrerVector(v));
end.
