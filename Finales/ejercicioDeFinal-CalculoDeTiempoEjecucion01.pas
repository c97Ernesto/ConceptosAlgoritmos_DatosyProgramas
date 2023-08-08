program calcularTiempoEjecucion;
type
    cadena43 = string[43]; 
    info = record   
        nombre: cadena43;
        nota: integer;
    end;
    
    lista = ^nodo;  
    nodo = record   
        datos: info;
        sig: lista;
    end;
    
    alumno = record    
        ape_nom: cadena43;
        promedio: real;
    end;
    vector = array [1..10] of ^alumno; 

var 
    v: vector;  
    a: alumno;  
    i, dimL: integer;   
    e: info;    
    aux: lista;     

begin   
    dimL:= 5;   {1ut}
    read(a.ape_nombre);
    i:= 0;  {1ut}
    while (i < 5) and (a.ape_nombre <> 'zzz') do begin  {c(n + 1ut)}
        {=> [3(5 + 1)]ut = 15ut + 3ut = 18ut}
        read(a.promedio);
        new(v[i]); 
        v[i]^:= a;  {1ut}
        i:= i + 1;  {2ut}
        read(ape.ape_nom);
    end;    {ut de while = 18ut + n(3)ut = 18ut + 15ut = 33ut}


end;    {t(alg) = (1 + 1 + 33)ut = 35ut}

