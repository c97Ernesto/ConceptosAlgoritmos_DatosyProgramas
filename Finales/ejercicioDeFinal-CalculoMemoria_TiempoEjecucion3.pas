{Teniendo en cuenta las referencias, calcule e indique la cantidad de memoria
estática, dinámica y el tiempo de ejecución. Muestre como se obtuvieron los datos.
Char		1 bytes
Integer		4 bytes
Real		8 bytes
Boolean		1 bytes
Sring		longitud + 1 bytes
Puntero		4 bytes
}

program ejercicioDeFinal;
type
	cadena30 = string[30];	
	categorias = 1..5;
	
	participante = record		{31 + 8 + 4 = 44 bytes}
		ape_nom: cadena30; 		{31 bytes}
		categ: categorias;		{4 bytes}
		tiempo: real;			{8 bytes}
	end;
	
	vector = array [1..20] of ^participante; {4*20 = 80 bytes}
	
var		{memoria estática = 80 + 4 + 4+ 31 = 119 bytes}
	p: vector;		{80 bytes}
	i: integer;		{4 bytes}
	c: categorias;		{4 bytes}
	ayn: cadena30;		{31 bytes}
	
begin	{memoria dinámica = 440 bytes - 264 bytes = 176 bytes}
	for i:= 1 to 10 do begin		//3*10 + 2 = 32ut
		new(p[i]);				{44*10 = 440 bytes}
		read(c);
		read(ayn);
		p[i]^.categ:= c;		//1ut * 10
		p[i]^.ape_nom´:= ayn;		//1ut * 10
		p[i]^.tiempo:= 0;		//1ut * 10
	end;	//32ut + 30ut = 60ut
	
	for i:= 10 downto 5 do	//3*5 + 2 = 17ut
		dispose(p[i]);			{44 * 6 = 264 bytes}
		
end; //Tiempo de ejecucion = 60ut + 17ut = 77ut}
