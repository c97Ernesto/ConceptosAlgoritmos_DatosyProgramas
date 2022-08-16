{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra para
el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.}
Program seis;
Const
	dimF = 100;
	
Type	
	indice = 0..dimF;
	rng_nros = 1..dimF;
	vecNros = array [rng_nros] of integer;
		
Procedure leerV (var v: vecNros; var dL: indice);
var
	num: integer;
begin
    dl:= 0;
	writeln('Ingrese un nro');
	readln(num);
	while (num <> 0) and (dl < dimF) do begin
		dl:= dl + 1;
		v[dl]:= num;
		writeln('Ingrese un nro');
		readln(num);
	end;
end;

Var
	vnros: vecNros;
	i, max, min: rng_nros;
	dimL: indice;
Begin
    max:= 1;
    min:= 1;
	leerV(vnros, dimL);
	for i:= 1 to dimL do  begin
		if vnros[i] > vnros[max] then
			max:= i
		else
			if vnros[i] < vnros[min] then
				min:= i
	end;
	writeln('El elem máx ',vnros[max],' q se encontraba en la pos ',max); 
    writeln('fue intercambiado con el elem mín ',vnros[min],' que se encontraba en la pos ',min);
End.