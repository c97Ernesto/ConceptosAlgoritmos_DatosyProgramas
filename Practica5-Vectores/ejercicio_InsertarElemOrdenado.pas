procedure InsertarElemOrd (var v: vector; var dimL: indice; elem: TipoElem; var ok);
var
	pos: indice;
begin
	ok:= false;
	if dimL < dimF then begin
		pos:= BuscarPosElem(elem, v, dimL);
		for i:= dimL downto pos do
			v[i+1]:= v[i];
		v[pos]:= elem;
		dimL:= dimL + 1;
	end;
end;