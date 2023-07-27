{ 2) Cual de las dos opciones consume menos memoria total (Memoria estatica + Memoria dinamica).
Dato	Memoria
Char	1 byte
Integer	6 byte
Real	8 byte
Boolean	1 byte
String	Long + 1 byte
Puntero	4 byte
}

program opcion_A;
type
    lista = ^nodo;		
    nodo = record
        dato:integer;
        sig:lista;
    end;
	
var		{MEMORIA ESTÁTICA = 14bytes}
	l,nue: lista;			{4 + 4 = 8bytes}
    i: integer;				{6bytes}
	
begin	{MEMORIA DINÁMICA = 60bytes}
    l:= Nil;		
    for i:= l to 6 do begin		
        new(nue);			{(6 + 4) * 6 = 60bytes}
        nue^.dato:= i;			{0}
        nue^.sig:= l;			{0}
        l:= nue;				{0}
    end;
end. 		//TOTAL DE MEMORIA UTILIZADA = 60 + 14 = 74bytes

program opcion_B;
type
    vector = array [1..10] of integer;
	
var		{MEMORIA ESTÁTICA = 72bytes}
    v:vector;			{10 * 6 = 60bytes}
    i,dimL:integer;			{6 + 6 = 12bytes}
	
begin	{MEMORIA DINÁMICA = 0bytes}
    dimL:=0;
    for i:=1 to 6 do begin
        dimL:=dimL + 1;
        v[i]:=i;
    end;
end.		//TOTAL DE MEMORIA UTILIZADA = 60 + 12 = 72bytes}