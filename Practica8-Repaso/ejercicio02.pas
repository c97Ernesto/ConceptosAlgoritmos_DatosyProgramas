{2. Implementar un programa que lea y almacene información de clientes de una empresa
aseguradora automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código
de póliza contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando
llega el cliente con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que
el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que
tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga
mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de
la estructura.}

PROGRAM	ejercicio2;
Const
    MAXPoliza = 6;
Type
    cadena50 = string[50];
    codigo = 1..MAXPoliza;
    tablaCodigos = array [codigo] of real;
    Cliente = record
        codCliente: integer;
        DNI: integer;
        apellido:  cadena50;
        nombre: cadena50;
        codPoliza: codigo;
        montoMensual: real;
    end;
    lista = ^nodo;
    nodo = record
        datos: Cliente;
        sig: lista;
    end;
Procedure TablaMontoAdicional(var v: tablaCodigos);										{TABLA CARGADA}
begin
	{se dispone}
end;
Procedure GenerarLista (var l:lista);												{GENERAR LISTA}	
	Procedure ingresarDatos(var d: Cliente);
	begin
		with d do begin
			write('Ingrese Codigo de Cliente: ');
			readln(codCliente);
			write('Ingrese DNI: ');
			readln(DNI);
			write('Ingrese Apellido: ');
			readln(apellido);
			write('Ingrese nombre: ');
			readln(nombre);
			write('Ingrese monto basico que abona mensualmente: ');
			readln(montoMensual);
			writeln('Ingrese Codigo de Poliza');
			readln(codPoliza);
		end;
	end;
	Procedure cargarLista (var l: lista; d: Cliente); 
	var
		aux: lista;
	begin
		new(aux);
		aux^.datos:= d;
		aux^.sig:= l;
		l:= aux;
	end;
var
	c: Cliente;
begin
	repeat
		ingresarDatos(c);
		cargarLista(l, c);
	until  c.codCliente = 1122; 
end;

Procedure Informar_A(l: lista; v: tablaCodigos); 										{ITEM A}
var
	monTotal: real;
begin
	while l <> nil do begin
		monTotal:= 0;
		Writeln('Nombre: ',l^.datos.nombre);
		writeln('Apellido: ',l^.datos.apellido);
		writeln('DNI: ',l^.datos.DNI);
		monTotal:= l^.datos.montoMensual + v[l^.datos.codPoliza];
		writeln('Monto total a pagar: ', monTotal);
	end;
end;
Procedure Informar_B(l: lista);														{ITEM B}
	Function dosNueve(num: integer): boolean;
	var
		cant, resto: integer;
	begin
		dosNueve:= false;
		cant:= 0;
		while (num <> 0) and (cant >= 2) do begin
			resto:= num mod 10;
			if resto = 9 then
				cant:= cant + 1
			else 
				num:= num div 10;
		end;
		if cant >= 2 then
			dosNueve:= true;
	end;
	
begin
	while l <> nil do begin
		if dosNueve(l^.datos.DNI) then begin
			writeln(l^.datos.nombre);
			writeln(l^.datos.apellido);
			writeln(l^.datos.DNI);
		end;
		l:= l^.sig;
	end;
end;
Procedure Eliminar_C (var l: lista);													{ITEM C}	
    Procedure borrarElem (var l: lista; n: integer; var exito: boolean);
    var
        act, ant: lista;
    begin
        exito:= false;
        act:= l;
        while (l <> nil) and (act^.datos.codCliente <> n) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (act <> nil) then
            exito:= true;
            if act = l then     //si es el primero..
                l:=l^.sig
            else            //si esta en medio
                ant^.sig:= act^.sig;
            dispose(act);
    end;
var
    cod: integer;
    si: boolean;
begin
    write('Ingrese codigo de CLilente a eliminar: ');
    readln(cod);
    borrarElem(l, cod, si);
    if si then
        write('El Cliente con codigo ',cod,' fue borrado')
    else
        write('No existe ese Cliente');
end;
    
var             																{PROG PRINC}
    L: lista;
    vector: tablaCodigos;
begin
	L:= nil;
	TablaMontoAdicional(vector);
	GenerarLista(L);
	Informar_A(L, vector);
	Informar_B(L);
	Eliminar_C(L);
end.
