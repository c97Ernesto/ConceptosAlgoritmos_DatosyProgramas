{PARCIAL: Un centro de estetica ofrece 12 planes para sus clientes: ozonoterapia, cama solar, spa, depilacion, tratamiento anti arrugas, etc. El centro dispone de una estructura con informacion de cada plan: codigo de plan(1..12), costo total y cantidad de seciones.
Realizar un programa que lea informacion de los clientes del centro de estetica. De cada cliente se lee su nombre, dni, ciudad de origen, codigo de plan contratado, y si ya finalizo el tratamiento. La informacion de los clientes finaliza al ingresar el cliente  "Mirtha Legrand" con dni 2.320.718, el cual debe procesarse.
Una vez leiday almacenada la informacion, procesar los datos e informar:
1_La cantidad de cliente de La Plata, Berisso o Ensenada que estan realizando actualmente el tratamiento.
2_La ganancia total del centro de estetica (tratamientos finalizados y no finalizados).}

PROGRAM Parcial;
Const
	MAX = 12;
Type
	cadena50: string[50];
	cantPlanes = 1..MAX;
	plan = record
		codPlan: cantPlanes;
		costoPlan: real;
		cantSeciones: integer;
	end;
	vectorPlanes = array [cantPlanes] of plan
	cliente = record
		nombre: cadena50;
		dni: integer;
		ciudadOrigen: cadena50;
		codPlan: cantPlanes;
		finTratamiento: boolean;
	end;
	lista = ^nodo;
	nodo = record
		datos: cliente;
		sig: lista;
	end;

Procedure GenerarLista (var l: lista);														//Generar y almacenar informacion
	procedure almacenarInfo (var p: cliente);
	var
		b: cadena50;
	begin
		cantCiudad:= 0;
		with p do begin
			read(nombre);
			read(dni);
			read(codPlanContratado);
			read(ciudadOrigen);
			read(b);
			if (b = 'Si') then
				finTratamiento:= true;
			finTratamiento:= false;
		end;
	end;
	procedure crearNodo (var l: lista; p: cliente);
	var
		act, nodo: lista;
	begin
		new(nodo);
		nodo^.datos:= p;
		nodo^.sig:= nil
		if l <> nil then
			act:= l;
			while (act <> nil) do begin
				act:= act^.sig;
			act^.sig:= nodo;
			else
			l:= nodo;
		end;
	end;
var
	p: cliente;
begin
	repeat
		almacenarInfo(p);
		crearNodo(l, p);
	until (p.nombre = 'Mirtha Legrand') and (p.dni = 2320718);
end;

Procedure RecorrerLista (l: lista; vector: vectorPlanes);									//Punto AyB
	function  montoPersona(cod: cantPlanes; b: boolean; v: vectorPlanes); real;
	begin
		if b then
			montoPersona:= (v[cod].cantSeciones * v[cod].costoPlan);
	end;
var
	cantP: integer;
	total: real;
	
begin
	while (l <> nil) do begin
		if l^.datos.ciudadOrigen = ('La Plata' or 'Berisso' or 'Ensenada') then
			cantP:= cantP + 1
		total:= total + montoPersona(l^.datos.codPlan, l^.datos.finTratamiento, vector);
	end;
	writeln('La cantidad de personas de... es de: ',cantP);
	writeln('La ganancia total del centro de estetica es de: ',total);
end;
	
var
	L: lista;
	vPlanes: vectorPlanes;
begin
	CargarVector(vPlanes);{se dispone}
	GenerarLista(L);
	RecorrerLista(L, vPlanes);
end.