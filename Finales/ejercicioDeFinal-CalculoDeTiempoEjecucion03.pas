
program calculoDeTiempoEjecucion;
type
	cadena30 = string[30];	
	categorias = 1..5;
	
	participante = record		
		ape_nom: cadena30; 		
		categ: categorias;		
		tiempo: real;			
	end;
	
	vector = array [1..20] of ^participante; 
	
var		
	p: vector;		
	i: integer;		
	c: categorias;		
	ayn: cadena30;		
	
begin	
	for i:= 1 to 10 do begin    {[3(n) + 2]ut => [3(10) + 2]ut}
        {=> 30 + 2 = 32ut}
		new(p[i]);				
		read(c);
		read(ayn);
		p[i]^.categ:= c;    {1ut}
		p[i]^.ape_nom´:= ayn;   {1ut}
		p[i]^.tiempo:= 0;   {1ut}
	end;	{32ut + n(3)ut = 32ut + 3*10ut = 62ut }
	
	for i:= 10 downto 5 do  {[3(n) + 2]ut => 3(6)ut + 2ut}
		dispose(p[i]);
    {=> 18ut + 2ut = 20ut}
		
end; {Tiempo de ejecucion: for 1 = 62ut + for 2 = 20ut => total 82ut}
