Procedure Agregar (var v: vector; var dimL: integer; elemento: integer; var ok: boolean);					//Agregar al Final
begin
	ok:= false;
	if dimL < dimF then begin {verifico espacio}
		ok:= true;
		dimL:= dimL + 1;	{actualizo la cantidad de alementos}
		v[dimL]:= elemento;
	end;
end;
