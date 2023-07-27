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

PROGRAM ejercicio02_AseguradoraAutomotriz;
CONST
	FIN = 1122;
	MAXpoliza = 6;
	
TYPE
	
	rng_poliza = 1..MAXpoliza;
	reg_Cliente = record
		codCliente: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		codPoliza: rng_poliza;
		montoMensual: real;
	end;
	
	lista_Clientes = ^nodo;
	nodo = record
		datos: reg_Cliente;
		sig: lista_Clientes;
	end;

	vec_MontoSegunPoliza = array [rng_poliza] of real;

//__________________________Tabla que se dispone__________________________	
Procedure TablaMontoAdicional(var v: vec_MontoSegunPoliza);										{TABLA CARGADA}
begin
	{se dispone}
end;

//__________________________Generar Lista Clientes__________________________	
Procedure GenerarLista(var lClientes: lista_Clientes);

	procedure leerInfo(var r: reg_Cliente);
	begin
		with r do begin
			write('Ingresar Codigo Cliente: ');
			readln(codCliente);
			write('Dni: ');
			readln(dni);
			write('Apellido: ');
			readln(apellido);
			write('Nombre: ');
			readln(nombre);
			write('Codigo de Poliza: ');
			readln(codPoliza);
			write('montoMensual');
		end;
	end;
	
	procedure crearLista(var l: lista_Clientes; reg: reg_Cliente);
	begin
	
	end;
	
Var
	cliente: reg_Cliente;
Begin
    lClientes:= nil;
	repeat
		leerInfo(cliente);
		crearLista(lClientes, cliente);
	until cliente.codCliente = FIN;
End;

//__________________________Recorrer Lista y Mostrar en Pantalla__________________________
Procedure RecorrerLista(l: lista_Clientes; v: vec_MontoSegunPoliza);
	
	{a. Informar para cada cliente DNI, apellido, nombre y el monto completo que 
	paga mensualmente por su seguro automotriz (monto básico + monto adicional).}
	procedure mostrarDatos_A(cliente: reg_Cliente; v: vec_MontoSegunPoliza);
	begin
		with cliente do begin
			writeln('Dni: ', dni);
			writeln('Codigo Cliente: ', codCliente);
			writeln('Apellido: ', apellido);
			writeln('Nombre: ', nombre);
			writeln('Monto de Seguro Automotriz: ',montoMensual + v[codPoliza]);
		end;
	end;
	
	{b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos 
	dos dígitos 9.}
	procedure mostrarDatos_B(cliente: reg_Cliente);
		function masUnNueve(num: integer): boolean;
		var
		    cant, resto: integer;
		begin
		    cant:= 0;
			while ((num <> 0) and (cant > 1)) do begin
				resto:= num mod 10;
				
				if (resto = 9) then
					cant:= cant + 1
				else
					num:= num div 10;
			end;
			masUnNueve:= (cant > 1);
		end;
	begin
		if (masUnNueve(cliente.dni)) then begin
			writeln('Apellido: ', cliente.apellido);
			writeln('Nombre: ', cliente.nombre);
		end;
	end;

Begin
	while(l <> nil) do begin
		mostrarDatos_A(l^.datos, v);
		mostrarDatos_B(l^.datos);
	end;	
End;

//__________________________Eliminar Cliente Existente__________________________
{c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de
la estructura.}
Procedure EliminarCliente(var lC: lista_Clientes; num: integer);
Var
	ant, act: lista_Clientes;
Begin
	act:= lC;
	while (act^.datos.dni <> num) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = lC) then
		lC:= lC^.sig
	else
		ant^.sig:= act^.sig;
	dispose(act);
End;

//__________________________P.P__________________________
VAR
	vecMontoSegunPoliza: vec_MontoSegunPoliza;
	listaClientes: lista_Clientes;
	dni: integer;
	
BEGIN
	TablaMontoAdicional(vecMontoSegunPoliza);
	GenerarLista(listaClientes);
	RecorrerLista(listaClientes, vecMontoSegunPoliza);
	
	write('Ingresar dni de cliente a eliminar: ');
	readln(dni);
	EliminarCliente(listaClientes, dni);
END.