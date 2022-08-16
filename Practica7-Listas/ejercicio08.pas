{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista queden
ordenados de manera ascendente (insertar ordenado).}

PROGRAM JugamosConListas;
TYPE
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end ;
var
	pri : lista;
	valor : integer;
procedure armarNodo( var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
end;

begin
	pri := nil;
	writeln(‘Ingrese un numero’);
	read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’);
		read(valor);
	end ;
. . . { imprimir lista }
end.

PROCEDURE InsertarElemento (var l: lista; v: integer);
var
	ant, aux, act: lista;
begin
	new(aux);
	aux^.num:= v;
	act:= l;
	ant:= l;
	while (act <> nil) and (act^.num < v) do begin
		ant:= act;
		act:= act^.sig ;
	end;
	if (ant = act) then 	//si quede en el principio
		l:= aux
	else
		ant^.sig:= aux;
	aux^.sig:= act;
end;

Procedure BorrarElemento (var l:lista; v: integer; var ok: boolean);
var
	ant, act: lista;
begin
	ok:= false;
	act:= l;
	while (act <> nil) and (act^.num <> v) do begin
		ant:= act;
		act:= act^.sig
	end;
	if (act <> NIL) then begin			//si estaba el elemento
		ok:= true;
		if (act = l) then 			//si estaba en la primera posicion
			l:= l^.sig;
			else
				ant^.sig:= act^.sig;
		end;
	end;
end;