{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes
de consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de 
cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de 
minutos consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los 
datos de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando 
el módulo desarrollado en “a.”) y retorne la cantidad total de minutos y la cantidad total de MB 
a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}
Program EjerCuatro;
Const
	MAXCli = 9300;
	COSTMB = 1.35;
	COSTMin = 3.40;
Type
	rng_clientes = 1..MAXCli;
	Cliente = record
		codCli: integer;
		cantLineas: integer;
	end;
	Linea = record
		nroTel: integer;
		cantMin: integer;
		cantMB: real;
	end;
Procedure LeerCliente;
	Procedure aFacturar(c: cliente); {Se puede recibir directamente el registro cliente}
		Procedure leerLinea(var l: linea);           {TODO: retornar totales: min y mb}
		begin
			with l do begin
				writeln('Numero de Tel:');
				readln(nroTel);
				writeln('Cantidad de minutos:');
				readln(cantMin);
				writeln('Cantidad de MB:');
				readln(cantMB);
			end; 	
		end;
	var
	    i: integer;
	    minTotal, mbTotal: real;
        l : linea; {lo agregue como variable local}
	begin
	    minTotal:= 0;
	    mbTotal:= 0;
		for i:= 1 to c.cantLineas do begin
			leerLinea(l);
			minTotal:= (minTotal + l.cantMin);
			mbTotal:= (mbTotal + l.cantMB);
		end;		
		writeln('La facturacion de: ',c.codCli ,' es de: ',((minTotal*COSTMin) + (mbTotal*COSTMB))); {Hacerlo en el LeerCliente}
	end;
var
  c : cliente;
begin
	writeln('Codigo de Cliente');
	readln(c.codCli);
	writeln('Cantidad de Lineas a su nombre');
	readln(c.cantLineas);
	aFacturar(c);
end;
Var
	i: rng_clientes;
	cli: cliente;			
Begin
	for i:= 1 to MAXCli do begin
		LeerCliente;       {lo saco como parametro al cliente porque no lo uso en el programa ppal}
	end;
End.