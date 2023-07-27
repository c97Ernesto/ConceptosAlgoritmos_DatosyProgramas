{Dado un vector de a lo sumo 500 elementos y una lista con valores enteros, 
implementar un módulo que reciba la lista y el vector, y 
agregue al vector los elementos que cumplan la condición que sean divisibles
por 3. El módulo debe retornar el vector modificado.
Declare los tipos de datos necesarios.}
PROGRAM ejercicioDeFinal_AgregarDeListaAVector;
CONST
	dimF = 500;
	
TYPE
	
	vec_Enteros = array [1..dimF] of integer
	
	lista = ^nodo
	nodo = record
		num: integer;
		sig: lista;
	end;	
	
Procedure AgregarAlVec(var v: vec_Enteros; var dimL: integer; l: lista);
begin
	dimL:= 0;
	while ((l <> nil) and (dimL <= dimF)) do 
		if ((l^.num mod 3) = 0) then begin
			dimL:= dimL + 1;
			v[dimL]:= l^.num;
		end;
		l:= l^.sig;
end;
