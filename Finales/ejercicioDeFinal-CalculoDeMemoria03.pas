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
	
	participante = record		{31 + 8 + 4 = 43 bytes}
		ape_nom: cadena30; 		{31 bytes}
		categ: categorias;		{4 bytes}
		tiempo: real;			{8 bytes}
	end;
	
	vector = array [1..20] of ^participante; {4*20 = 80 bytes}
	
var		{MEMORIA ESTÁTICA: const + var = (0) + (80 + 4 + 4+ 31) = 119 bytes}
	p: vector;		{80 bytes}
	i: integer;		{4 bytes}
	c: categorias;		{4 bytes}
	ayn: cadena30;		{31 bytes}
	
begin	{MEMORIA DINÁMICA = 440 bytes - 264 bytes = 172 bytes}
	for i:= 1 to 10 do begin	
		new(p[i]);				{43*10 = 430 bytes}
		read(c);
		read(ayn);
		p[i]^.categ:= c;		
		p[i]^.ape_nom´:= ayn;	
		p[i]^.tiempo:= 0;		
	end;	
	
	for i:= 10 downto 5 do	
		dispose(p[i]);			{43 * 6 = 258 bytes}
		
end; 
