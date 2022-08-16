{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada : recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso
contrario.
b. Eliminar : recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista
podría no estar ordenada.}
PROCEDURE BorrarElemento (var l:lista; v: integer; var ok: boolean);
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
{c. Sublista : recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los
elementos de la lista L mayores que A y menores que B.}

{d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
ascendente.}

{e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera
descendente.}