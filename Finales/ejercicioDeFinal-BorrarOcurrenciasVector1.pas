{Dado un vector de a lo sumo 500 elementos ordenado de menos a meyor, implementar
un módulo que reciba dicho vector y un valor entero, y elimine del vector todas 
las ocurrencias del valor recibido. El valor revibido puede no existir en el 
vector. Declare todos los tipos de datos necesarios.}
Procedure EjerDeFinal_BorrarOcurrencias;
CONST 
	dimF = 500;
TYPE
	rng_vector = 0..dimF;
	vector = array [rng_vector] of integer;

Procedure EliminarOcurrencias(var v: vector; var dimL: rng_vector; var ok: boolean; x: integer);
Var
	i, j: rng_vector;
Begin
	ok:= false;
	i:= 0;
	while ((i < dimL) and (v[i] <= x)) do begin
        i:= i + 1;
		if (x = v[i]) then begin
			ok:= true;
			for j:= i + 1 to dimL do
				v[j - 1]:= v[j];
			dimL:= dimL - 1;
		end
	end;
End;
