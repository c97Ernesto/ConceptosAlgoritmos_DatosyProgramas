{Se dispone de la info de los productos de un supermercado. De cada producto
se tiene código, nombre, rubro(1..20) y precio. Se pide implementar un 
programa que guarde en una estructura de datos adecuada los productos de
los rubros que tengan 10 productos.}
PROGRAM ejercicioDeFinal;
CONST
	MAXrubros = 20;
	
TYPE
	str20 = string[20];
	rng_rubros = 1..MAXrubros;
	
	reg_producto = record
		codigo: integer;
		nombre: str20;
		rubro: rng_rubros;
	end;
	
	lista_productos = ^nodo;		//se dispone
	nodo = record
		datos: reg_producto;
		sig: lista_productos;
	end;
	
	lista_cantProd10 = ^nodo1;
	nodo1 = record
		datos1: reg_producto;
		sig1: lista_cantProd10;
	end;
	
	vec_rubros = array [rng_rubros] of integer;

//_____________________________Inicializar Vector_____________________________
Procedure IniVecRubros(var v: vec_rubros);
Var
	i: rng_rubros;
Begin
	for i:= 1 to MAXrubros do
		v[i]:= 0;
End;
//_____________________________Generar Lista y Vector_____________________________
Procedure GenerarListaProductos(var l: lista_productos; var v: vec_rubros);
Begin

End;
//_____________________________Generar Nueva Lista_____________________________
Procedure GenerarListaNueva(lP: lista_productos; var lNueva: lista_cantProd10; vR: vec_rubros);

	Procedure crearLista(var l: lista_cantProd10; r: reg_producto);
	Var
		nodo: lista_cantProd10;
	Begin
		new(nodo);
		nodo^.datos1:= r;
		nodo^.sig1:= l;
		l:= nodo;
	End;
	
Begin
	lNueva:= nil;
	while (lP <> nil) do begin
		if (vR[lP^.datos.rubro] = 10) then
			crearLista(lNueva, lP^.datos);
			
		lP:= lP^.sig;
	end;
End;
	
//_____________________________P.P_____________________________
VAR
	lProd: lista_productos;
	lCantProd10: lista_cantProd10;
	vecRubros: vec_rubros;
	
BEGIN
	IniVecRubros(vecRubros);
	GenerarListaProductos(lProd, vecRubros);	//se dispone
	GenerarListaNueva(lProd, lCantProd10, vecRubros);
END.