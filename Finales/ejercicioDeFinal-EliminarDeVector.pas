{
* Un comercio dispone de una estructura de datos con las ventas (como máximo 500 ventas) realizadas
* durante el mes de enero. De cada venta se conoce el número de venta, monto total y una lista de los
* productos vendidos (de cada producto se tiene código y cantidad). Se pide implementar un programa
* que elimine de la estructura de datos todas las ventas cuya lista de productos contengan 
* exáctamente 5 productos.
* }
CONST
	dimF = 500;
	
TYPE
	rng_ventas = [1..dimF];

	reg_venta = record;
		nroVenta: integer;
		montoTotal: real;
		productos: lista_productos;
	end;
	vec_ventas = array [rng_ventas] of reg_venta;
	
	reg_productos = record;
		codido: integer;
		cantidad: integer;
	end;
	lista_productos = ^nodo;
	nodo = record;
		datos: reg_productos;
		sig: lista_productos;
	end;

{____________________________CargarVentas____________________________}
Procedure CargarVentas(var v: vec_ventas; var dimL: rng_venas);
Begin
End;

{____________________________EliminarVentas____________________________}
Procedure EliminarVentas(var v: vec_ventas; var dimL: rng_ventas);

	procedure cantProductos(l: lista_productos): integer;
	var
		cant: integer;
	begin
		while (l <> nil) and (cant < 6) then begin
			cant:= cant + l^.datos.cantidad;
			l:= l^.sig;
		end;
		cantProductos:= cant;
	end;

	procedure eliminarDeVector(var v: vec_ventas; var dimL: rng_ventas; pos: rng_ventas);
	begin
		for i:= pos to dimL-1 do
			v[i]:= v[i+1];
	end;
	
Var
	i: rng_vector
Begin
	i:= 1;
	while (i <= dimL) do begin
		if (cantProductos(v[i].productos) = 5)) then
			eliminarDevector(v, dimL, i);
			//eliminamos la posición del vector y decrementamos la dimL, si decrementamos
			//la dimL no avanzamos en el while ya que nos saltearíamos el elemento que pisó
			//el elemento eliminado.
		else
			i:= i + 1;
	end;
End;

{____________________________P.P____________________________}
VAR
	ventas: vec_ventas;
	dimL: rng_ventas;
	
BEGIN
	CargarVentas(ventas, dimL);
	EliminarVentas(ventas, dimL);
END.
	
