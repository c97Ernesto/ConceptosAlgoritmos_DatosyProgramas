Procedure Agregar (var v: vector; var dimL: integer; elemento: integer; var ok: boolean);					//Agregar al Final
begin
	ok:= false;
	if dimL < dimF then begin {verifico espacio}
		ok:= true;
		dimL:= dimL + 1;	{actualizo la cantidad de alementos}
		v[dimL]:= elemento;
	end;
end;

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