{12. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. 
Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo. De 
cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero 
transportado y distancia recorrida por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La 
lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia 
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

Program Ejer12;
Const
    MAX = 200;
Type
    rng_viajes = 1..MAX;
    rng_dias = 1..31;
    InfoViaje = record    
        dia: rng_dias;
        monto: real;
        kms: real;
    end;
    vector = array [rng_viajes] of InfoViaje;

Procedure LeerVector (var v: vector; var dl: integer);
    Procedure leerInfoViaje(var r: InfoViaje);
    begin
        with r do begin
            writeln('Kilometros');
            readln(kms);
            if (kms <> 0) then begin
                writeln('Dia');
                readln(dia);
                writeln('Monto transportado');
                readln(monto);
            end;
        end;
    end;
var 
    reg: infoViaje;
begin
    dl:= 0;
    leerInfoViaje(reg);
    while (dl < 200) and (reg.kms <> 0) do begin
        dl:= dl + 1;
        v[dl]:= reg;
        leerInfoViaje(reg);
    end;
end;
Procedure PuntoB(v: vector; dl: integer);
var
    i, min: rng_viajes;
    proMonto: real;
begin
    proMonto:= 0;
    min:= 1;
    for i:= 1 to dl do begin
        proMonto:= proMonto + v[i].monto;
        if (v[min].monto > v[i].monto) then
            min:= i;
    end;
    writeln('El promedio total de los montos fue de: ', proMonto / dl);
    writeln('La distincia del dia en que se transporto menos dinero fue: ',v[min].kms,' del dia: ',v[min].dia);
end;
Procedure PuntoC (var v: vector; var dl: integer);
var
    i, j: rng_viajes;
begin
	i:= 0;
    while (i < dl) do begin
		if (v[i].kms = 100) then begin
			for j:= (i + 1) to dl do {no pasa nada en un for si es mayor}
				v[j-1]:= v[j];
			dl:= dl - 1;
		end;
		else
			i:= i + 1;
    end                                                   
end
VAR
    vec: vector;
    dl: integer;
BEGIN
    LeerVector(vec, dl);
    PuntoB(vec, dl);
    PuntoC(vec, dl);
END.