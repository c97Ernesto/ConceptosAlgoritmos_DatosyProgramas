procedure BusquedaBin (var v: vector; var j: indice; dimL: indice; x: TipoElem);
var
	pri, ult, medio: indice;
begin
	j:= 0;
	pri:= 1;
	ult:= dimL;
	medio:= (pri + ult) div 2;
	while (pri <= ult) and (x <> v[medio]) do begin
		if (x < v[medio]) then
			ult:= medio - 1;
			else
				pri:= medio + 1;
		medio:= (pri + ult) div 2;
		end;
		if pri <= ult then 
			j:= medio;
			else 
				j:= 0;
	end;
end;