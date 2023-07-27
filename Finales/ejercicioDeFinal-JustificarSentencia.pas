{Dada la sig declaracion de tipo de datos y variables, justificar si 
es valida o no cada sentencia numerada}

program ejercicio_3;

type 
	cadena50 = string[50];
	cliente = record
		dni: cadena50;
		ape_nom: cadena50;
	end;
	
	clientes = ^nodo;
	nodo = record
		dato: cliente;
		sig: clientes;
	end;
var
	c:cliente;
	cli, cli_esp: clientes;
begin
{1}	read(c);		//F, solo podemos escribir los campos de cada registro
{2}	new(c);			//F, no podemos pedir espacio en memoria para una variable estatica
{3}	cli:= nil;		//V, estamos haciendo una asignacion nula a un puntero
{4}	new(cli);		//v, estamos reservando espacio para una variable dinamica
{5}	cli_esp:= cli;		//V, son dos variables puntero del mismo tipo, apuntando al mismo objeto
{6}	dispose(cli);		//V, liberamos la variable referenciada por cli
{7}	read(cli_esp^.dni);		//F, antes de acceder a dni, tenemos que acceder al campo datos del registro del puntero
{8}	write(cli_esp^.dni);	//F, antes de acceder a dni, tenemos que acceder al campo datos del registro del puntero
end.
