{Teniendo en cuenta las referencias, calcule e indique la cantidad de memoria
estática, dinámica y el tiempo de ejecución. Muestre como se obtuvieron los datos.
Char		1b
Integer		4b
Real		8b
Boolean		1b
Sring		longitud + 1
Puntero		4b
}

program ejercicioDeFinal;
type
	cadena30 = string[30];	
	categorias = 1..5;
	
	participante = record		{31 + 8 + 4 = 44b}
		ape_nom: cadena30; 		{31b}
		categ: categorias;		{4b}
		tiempo: real;			{8b}
	end;
	
	vector = array [1..20]; of ^participante; {4*20 = 80b}
	
var		{memoria estática = 80 + 4 + 4+ 31 = 119b}
	p: vector;		{80b}
	i: integer;		{4b}
	c: categorias;		{4b}
	ayn: cadena30;		{31b}
	
begin	{memoria dinámica = 220b}
	for i:= 1 to 10 do begin		//3*10 + 2 = 32ut
		new(p[i]);				{44*10 = 440b}
		read(c);
		read(ayn);
		p[i]^.categ:= c;		//1ut * 10
		p[i]^.ape_nom´:= ayn;		//1ut * 10
		p[i]^.tiempo:= 0;		//1ut * 10
	end;	//32ut + 30ut = 60ut
	
	for i:= 10 downto 5 do	//3*5 + 2 = 17ut
		dispose(p[i]);			{440b / 2 = 220b}
		
end; //Tiempo de ejecucion = 60ut + 17ut = 77ut}