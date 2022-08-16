{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en 
las redes sociales. Para ello, para cada una de las 200 fotos publicadas en su página de 
Facebook, cuenta con la siguiente información: título de la foto, el autor de la foto, 
cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. Realizar 
un programa que lea y almacene esta información. Una vez finalizada la lectura, el 
programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

Program Ejer11;
Const
	MAX = 200;
Type
	indice = 1..MAX;
	str50 = string[50];
	regFoto = record
		titulo: str50;
		autor:	str50;
		mg: integer;
		clicks: integer;
		comentarios: integer;
	end;
	vector = array [indice] of regFoto;
Procedure LeerVec (var v: vector);
	Procedure LeerReg (var f: regFoto);
	begin
		with f do begin
			writeln('Titulo');
			readln(titulo);
			writeln('Autor');
			readln(autor);
			writeln('Me gusta');
			readln(mg);
			writeln('Clicks');
			readln(clicks);
			writeln('Comentarios');
			readln(comentarios);
		end;
	end;
var
	i: indice;
begin
	for i:= 1 to MAX do
		leerReg(v[i]);	
end;
Procedure Recorrer (v: vector); {no se modifica}
var
    i: indice;
    titulo: str50;
    max, cantMg: integer;
begin
    cantMg:= 0;
    max:= 1;
    for i:= 1 to MAX do begin
        if (v[max].clicks > v[i].clicks) then
            max:= i;
    
        if (v[i].autor = 'Art Vandelay') then
            cantMg:= cantMg + v[i].mg;
        Writeln('La cantidad de comentarios fue de: ',v[i].comentarios);
    end;
    
    writeln(v[max].titulo);
end;
Var
	vec: vector;
Begin
	LeerVec(vec);
	Recorrer(vec);
End.