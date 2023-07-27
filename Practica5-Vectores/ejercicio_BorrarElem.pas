Procedure BorrarElem (var v: vector; var dimL: indice; elem: integer; var ok: boolean);				//Borrar Elemento
var
	pos: indice
begin
	ok:= false;
	pos:= BuscarPosElem(elem, v, dimL);
	if pos <> 0 then begin
		for i:= 1 to dimL do 
			v[i-1]:= v[i];
		dimL:= dimL - 1;
	ok:= true;
	end;
end;