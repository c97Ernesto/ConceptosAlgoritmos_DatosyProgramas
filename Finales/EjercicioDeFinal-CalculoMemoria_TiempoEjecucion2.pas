{Teniendo en cuenta la siguiente tabla, calcule e indique la cantidad de memoria estática
y dinámica que utiliza el siguiente programa y su tiempo de ejecución.
Char			1
Integer			6
Real			8
Boolean 		1
String		long + 1
Puntero			4
}
PROGRAM ejerDeFinal;
TYPE
	cadena25 = string[25];	{26b}
	
	empleado = record	{26 + 6 + 8 = 40b}
		dirCorreo: cadena25; edad: integer; sueldo: real;
	end;	
	
	vector = array [1..100] of empleado; {40 * 100 = 4000b}
	
	datos = ^vector;	{4b}
	
VAR		{4000 + 4 + 49 + 6 + 8 = 4067b de Mem Estática}
	v: vector; d: datos; e: empleado; i: integer; suma: real;
	
BEGIN	{4000b de Mem Dinámica}
	new(d);		{4000b} 	// 1ut
	for i:= 1 to 100 do begin	// 3*100 + 2 = 302ut
		read(e.dirCorreo, e.edad, e.sueldo);
		d^.[i]:= e;	// 1*100 = 100ut
	end;
	d^.[4].sueldo:= d^.[4].sueldo + 100; // 2ut
END.	//Tiempo de Ejecucion: 1 + 302 + 100 + 2 = 405ut