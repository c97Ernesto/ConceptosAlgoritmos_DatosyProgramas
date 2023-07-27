Procedure BorrarPos (var v: vector; var dimL: integer; var ok: boolean; pos: posicion);					//Borrar 
{Borrar elemento de una posicion determinada}
var
	i: integer;
begin
	ok:= false;
	if (pos >= 1 and pos <= dimL) then begin
		ok:= true;
		for i:= pos + 1 to dimL do
			v[i-1]:= v[i];
		dimL:= dimL - 1;
	end;
end;