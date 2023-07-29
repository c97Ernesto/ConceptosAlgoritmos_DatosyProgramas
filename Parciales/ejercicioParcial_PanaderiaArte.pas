{
Una panadería artesanal de La Plata vende productos de elaboración propia. La panadería agrupa 
sus productos en 26 categorías (ej: 1.Pan, 2.Meadialunas, 3.Masas finas, etc.). Para cada categoría
se conoce su nombre y precio por kilo del producto.
La panadería dispone de información de todas las compras realizadas el último año. De cada compra
se conoce: dni de cliente, categiría del producto (entre 1 y 26) y la cantidad de kilos comprados.
La información se encuentra ordenada por dni de cliente.
    a)Realizar un módulo que retorne la información de las categorías en una estructura de datos 
    adecuada. La información se lee por teclado sin ningún orden. De cada categoría se lee el 
    nombre, el código (1 a 26) y el precio por kilo.
    b)Realizar un módulo que reciba la información de todas las compras, la información de las 
    categorías y retorne:
        1.Dni de cliente que más compras realizó.
        2.Monto total recaudado por cada categoría.
        3.Cantidad total de compras de clientes con dni compuesto, por al menos, 3 dígitos pares.
}
    
PROGRAM ejerParcial;
CONST
    MAX_categorias = 26
    
TYPE
    rng_categorias = [1..MAX_categorias];
    str50 = string[50];

    {agrupa sus productos en 26 categorías (ej: 1.Pan, 2.Meadialunas, 3.Masas finas, 
    etc.). Para cada categoría se conoce su nombre y precio por kilo del producto.}
    reg_categoria = record
        nombre: str50;
        precio: real;
    end;
    vec_categorias = array [rng_categorias] of reg_categoria;
    
    {dispone de información de todas las compras realizadas el último año. De cada 
    compra se conoce: dni de cliente, categiría del producto (entre 1 y 26) y la cantidad 
    de kilos comprados. La información se encuentra ordenada por dni de cliente.}
    reg_compra = record
        dniCliente: integer;
        catProducto: rng_categorias;
        cantKilos: real;
    end;
    lista_compras = ^nodo;
    nodo = record
        datos: reg_compra;
        sig: lista_compras;
    end; 

    {2.Monto total recaudado por cada categoría.}
    vec_monto_categorias = array [rng_categorias] of real;    

{__________________________________CargarVectorCategorias__________________________________}
{a) Realizar un módulo que retorne la información de las categorías en una estructura de datos 
adecuada. La información se lee por teclado sin ningún orden. De cada categoría se lee el 
nombre, el código (1 a 26) y el precio por kilo.}
Procedure CargarCategorias(var vector: vec_categorias);

    procedure leerCategoria(var r: reg_categoria; var n: rng_categoria);
    begin
        write('Ingresar nombre: ');
        readln(r.nombre);
        write('Ingresar código: ');
        readln(n);
        write('Ingresar precio por kilo: ');
        readln(r.precio);
    end;

Var
    i, codigo: rng_categoria;
    categoria: reg_categoria;
Begin
    for i:= 1 to MAX_categorias do begin
        leerCategoria(categoria, codigo)
        vector[codigo]:= categoria;
    end;
End;
{__________________________________Procesar Compras__________________________________}
Procedure ProcesarCompras(l: lista_compras; vecCat: vec_categorias; var vecMontosCat: vec_montos_categorias; var maxDni: integer; var paresDniCompras: integer);

    procedure inicializarVectorMontos(var v: vec_montos_categorias);
    var
        i: rng_categorias;
    begin
        for i:= 1 to MAX_categorias do
            v[i]:= 0;
    end;

    function tieneDniConAlMenos3DigPares(num: integer): boolean;
    var
        cant: integer;        
    begin
        cant:= 0;
        while (n <> 0) do begin
            if ((n mod 10) = 0) then
                cant:= cant + 1;
            n:= n div 10; 
        end;
        tieneDniConAlMenos3DigPares:= (cant > 3);
    end;

Var
    maxComprasCliente, dniActual: integer;    

Begin
    inicializarVectorMontos(vecMontosCat);
    maxComprasCliente:= -1;
    maxDni:= -1;
    dniActual:= -1;
    
    while (l <> nil) do begin
        dniActual:= l^.datos.dniCliente
        cantComprasCliente:= 0;
        
        while (l <> nil) and (l^.datos.dniCliente = dniActual) do begin
            cantComprasCliente:= cantComprasCliente + 1;

            montosCat[l^.datos.catProducto]:= montosCat[l^.datos.catProducto] + (vecCat[l^.datos.catProducto].precio * l^.datos.cantKilos);

            if ((tieneDniConAlMenos3DigPares(dniActual)) then
                paresDniCompras:= paresDniCompras + 1;
            
            l:= l^.sig;
        end:
        
        if (cantComprasCliente > maxComprasCliente) then begin
            maxComprasCliente:= cantComprasCliente;
            maxDni:= dniActual;
        end;
            
        
 
End;

{__________________________________P.P__________________________________}
VAR
    L: lista_compras;
    vecCategorias: vec_categorias;
    dniCliente: integer;
    vecMontos: vec_montos_categorias;
    totalComprasConDniParAlMenos3: integer;

BEGIN
    CargarCompras(L);   //se dispone
    CargarCategorias(vecCategorias);
    ProcesarCompras(L, vecCategorias, dniCliente, vecMontos);
END.



