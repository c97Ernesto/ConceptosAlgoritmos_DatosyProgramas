{
10. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes
sociales. Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con
la siguiente información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics
y cantidad de comentarios de usuarios. Realizar un programa que lea y almacene esta información.
Una vez finalizada la lectura, el programa debe procesar los datos e informar:
− Título de la foto más vista (la que posee mayor cantidad de clics)
− Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
− Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}
PROGRAM ejer10;
CONST
    MAX_fotos = 200;

TYPE
    str20 = string[20];
    rng_fotos = 1..MAX_fotos;

    reg_foto = record
        titulo: str20;
        autor: str20;
        cantMg: integer;
        cantClicks: integer;
        cantComentarios: integer;
    end;

    vec_fotos = array [rng_fotos] of reg_foto;

{_______________________Cargar Fotos_______________________}
Procedure CargarFotos(var vFotos: vec_fotos);

    procedure leerRegistro(var r: reg_foto);
    begin
        write('Ingresar Título de foto: ');
        readln(r.titulo);
        write('Ingresar nombre de Autor: ');
        readln(r.autor);
        write('Ingresar cantidad de Me Gustas: ');
        readln(r.cantMg);
        write('Ingresar cantidad de Clicks: ');
        readln(r.cantClicks);
        write('Ingresar cantidad de Comentarios: ');
        readln(r.cantComentarios);
    end;

Var
    foto: reg_foto;
    i: rng_fotos;
    
Begin
    for i:= 1 to MAX_fotos do begin;
        leerRegistro(foto);
        vFotos[i]:= foto;
    end;
End;

{_______________________ProcesarVector_______________________}
Procedure ProcesarVector(vFotos: vec_fotos);
Const
    AUTOR = 'ArtVandelay';

Var
    i: rng_fotos;
    
    fotoMasVista: str20;
    fotoMasClicks: integer;
    
    mgDeAutor: integer;
    totalComentarios: integer;
    
Begin

    mgDeAutor:= 0;
    totalComentarios:= 0;
    fotoMasVista:= '';
    fotoMasClicks:= 0;

    for i:= 1 to MAX_fotos do begin
        if (vFotos[i].cantClicks > fotoMasClicks) then begin
            fotoMasClicks:= vFotos[i].cantClicks;
            fotoMasVista:= vFotos[i].titulo;
        end;
        
        if (vFotos[i].autor = AUTOR) then
            mgDeAutor:= mgDeAutor + 1;
        
        totalComentarios:= totalComentarios + vFotos[i].cantComentarios;
    end;
    
    writeln('La foto mas vista fue: ', fotoMasVista);
    writeln('La cantidad de Me gusta del autor ', AUTOR, ' fue de: ', mgDeAutor);
    writeln('El total de comentarios en la red social fue de: ', totalComentarios);
End;

{_______________________P.P_______________________}
VAR
    fotos: vec_fotos;
    
BEGIN

    CargarFotos(fotos);
    
    ProcesarVector(fotos);
    
END.


