{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).}

Procedure crearNodoOrd( var L: lista; v: integer);
Var
	nodo, aux : lista;
Begin
	new(nodo);			//creamos nodo
	nodo^.num:= v;			//asignamos al nodo el valor
	nodo.sig:= nil;				//hacemos que ese nodo sea el último
	if (L <> nil) then begin		//si la lista no esta vacía
		aux:= L;
		while (aux^.sig <> nil) do		//mientras no lleguemos al final de la lista
			aux:= aux^.sig;				//pasamos al siguiente, hasta llegar al ultimo
		aux^.sig:= nodo;			//enlazo el último nodo con el nuevo
	end
	else
		L:= nodo			//si la lista está vacía le asignamos el nuevo nodo
End;

{b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

Procedure armarNodo( var L: lista; v: integer; U: lista);
Var
	nodo: lista;
Begin
	new(nodo);			//creamos nodo
	nodo^.num:= v;			//asignamos al nodo el valor
	nodo.sig:= nil;				//hacemos que ese nodo sea el ultimo
	if (L <> nil) then
		U^.sig:= nodo;			//en el campo sig del último nodo de la lista, lo enlazo con el último
	else
		L:= nodo;			//si la lista estaba vacía, le asigno el primer nodo
	U:= nodo;				//actualizo como último nodo al que acabo de crear
End;