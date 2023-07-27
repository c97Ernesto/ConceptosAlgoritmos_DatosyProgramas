{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto se
lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código -1, que no
debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

PROGRAM Ejer5;
TYPE
    str50 = string[50];

    Producto = record
        cod: integer;
        descripcion: str50;
        stockAct: integer;
        stockMin: integer;
        precio: real;
    end;

    lista = ^nodo;
    nodo = record
        datos: Producto;
        sig: lista;
    end;

//____________________________________Generar Lista_____________________________________________
Procedure GenerarLista (var l: lista);

    procedure ingresarDatos (var p: Producto);
    begin
        with p do begin
            writeln('Codigo');
            readln(cod);
            writeln('Descripcion');
            readln(descripcion);
            writeln('Stock Actual');
            readln(stockAct);
            writeln('Stock Minimo');
            readln(stockMin);
            writeln('Precio');
            readln(precio);
        end;
    end;

    procedure cargarLista (var l: lista; p: Producto);
    var
        aux: lista;
    begin
        new(aux);
        aux^.datos:= p;
        aux^.sig:= l;
        l:= aux;
    end;

Var
    prod: Producto;
Begin
    ingresarDatos(prod);
    while (prod.cod <> -1) do begin
        cargarLista(l, prod);
        ingresarDatos(prod);
    end;
End;

//____________________________________Recorrer Lista_____________________________________________

Procedure RecorrerLista (l: lista);

    function cantPar (c: integer): integer;
    var
        par: integer;
    begin
        par:= 0;
        while c <> 0 do begin
            if ((c mod 2) = 0) then
                par:= par + 1;
            c:= c div 10;
        end;
        cantPar:= par;
    end;

    procedure Minimos(precio: real; cod: integer; var min1, min2: real; var cod1, cod2: integer);
    begin
        if (precio < min1) then begin
            min2:= min1;
            cod2:= cod1;
            min1:= precio;
            cod1:= cod;
          end
          else
                if (precio < min2) then begin
                    min2:= precio;
                    cod2:= cod;
                end;
    end;

Var
    min1, min2: real;
    stock, cod1, cod2: integer;
    cantElem:integer;
Begin
    cantElem:= 0;
    stock:= 0;
    min1:= 999;
    min2:= 999;

    while (l <> nil) do begin
        cantElem:= cantElem + 1;

        if (l^.datos.stockAct < l^.datos.stockMin) then
            stock:= stock + 1;

        if (cantPar(l^.datos.cod) > 2) then
            writeln(l^.datos.descripcion);

        Minimos(l^.datos.precio, l^.datos.cod, min1, min2, cod1, cod2);
        l:= l^.sig;
    end;

    Writeln('Los dos productos mas economicos son: ',cod1,' y ',cod2);
    writeln('El porcentaje de productos con stock por debajo del minimo es: ',((stock*100) / cantElem));
End;

//____________________________________P . P_____________________________________________

VAR
    L: lista;
BEGIN
    L:= nil;
    GenerarLista(L);
    RecorrerLista(L);
END.