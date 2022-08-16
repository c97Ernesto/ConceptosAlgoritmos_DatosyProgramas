Procedure InsertarPos (var v: vector; dimL: integer; elemento, pos: integer; var ok: boolean);					//Insertar
{insertar en una posicion determinada}
begin
	ok:= false;
	if (dimL < dimF) and((pos >= 1) and (pos <= dimL)) then begin
		ok:= true;
		for i:= dimL downto pos do
			v[i+1]:= v[i];
		v[pos]:= elemento;
		dimL:= dimL + 1;
	end;		
end;