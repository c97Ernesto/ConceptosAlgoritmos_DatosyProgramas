Function BuscarPosElem (x: integer; v: vector; dimL: indice): indice; = 0..dimF
{Busqueda lineal o secuencial (elementos sin orden)}
var
	pos: indice; 
	ok: boolean;
begin
	pos:= 1;
	ok:= false;
	while (pos <= dimL) and (not ok) do
		if (x = v[pos]) then
			ok:= true;
			else 
				pos:= pos + 1;
	if (exito = false) then 
		pos:= 0;
	BuscarPosElem:= pos;
end;