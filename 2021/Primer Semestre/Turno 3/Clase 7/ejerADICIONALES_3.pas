program ejer;
procedure minimos(codigo:integer; precio:real; var precio_min1, precio_min2:real; var codigo_1, codigo_2:integer);
	begin
		if (precio < precio_min1) then begin
			precio_min2:=precio_min1;
			codigo_2:=codigo_1;
			precio_min1:=precio;
			codigo_1:=codigo;
		end
		else if (precio < precio_min2) then	begin
			precio_min2:=precio;	
			codigo_2:=codigo;
		end;	
	end;

procedure codigo_par(codigo:integer; precio:real; var cantidad:integer);

	begin
		if (precio > 16) and (codigo mod 2 = 0) then
			cantidad:=cantidad+1;
	end;

var
	precio_min1, precio_min2, precio:real;
	i:integer;
	codigo, codigo_1, codigo_2, cantidad:integer;
begin
	cantidad:=0;
	i:=0;
	precio_min1:=9999;
	precio_min2:=9999;
	codigo_1:=0;
	codigo_2:=0;
	for i:=1 to 4 do begin
		writeln('Ingrese un codigo (entre 1 a 200) y precio');
		readln(codigo);
		if (codigo >=1) and (codigo <=200) then
			readln(precio)
		else begin
			writeln('No ingreso un codigo entre 1 a 200, ingreselo de nuevo');
			readln(codigo);
			readln(precio);
		end;
	minimos(codigo, precio, precio_min1, precio_min2, codigo_1, codigo_2);
	codigo_par(codigo, precio, cantidad);
	end;
	writeln('Los codigos de los dos productos mas baratos es ', codigo_1,' y ', codigo_2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es ',cantidad);
	readln();
end.






 program ej1;
procedure maximos (codigo:integer; precio:real; VAR min1,min2:real;VAR codmin1,codmin2:integer);
begin
	if precio < min1 then begin
		min2:=min1;
		codmin2:=codmin1;
		min1:=precio;
		codmin1:=codigo;
	end
	else
		if precio < min2 then begin
			min2:=precio;
			codmin2:=codigo;
end;

function productosCondicion (codigo:integer;precio:real):boolean;
begin
	productosCondicion:=(codigo mod 2) and (precio < 16);
end;
var
	i,codigo:integer;precio,max1,max2:real
begin
	min1:=9999;
	codmin1:=0;
	min2:=9999;
	codmin2:=0;
	cant:=0;
	for i:=1 to 200 do begin
		writeln('ingrese precio del producto codigo: ',i)
		readln(precio);
		maximos (i,precio,min1,min2,codmin1,codmin2);
		if productosCondicion (i,precio) then
			cant:=cant+1;
	end;
	writeln ('codigos de los dos productos mas baratos: ',codmin1,' y ',codmin2);
	writeln ('cantidad de productos que cumplen la condicion: ',cant);
end.





program ej1;
procedure diametroPerimetro (radio:real; VAR diametro,perimetro:real);
begin
	diametro:=radio*2;
	perimetro:= 3.14*diametro;
end;
procedure leer (VAR radio:real; VAR nombre:string; VAR distancia:real);
begin
	writeln('ingrese el radio del planeta');
	readln(radio);
	if radio <> 0 then begin
	writeln('ingrese el nombre del planeta');
	readln(nombre);
	writeln('ingrese la distancia a la tierra');
	readln(distancia);
	end;
end;
var
	radio,distancia,diametro,perimetro:real;cantJup:integer;nombre:string;
begin
	cantJup:=0;
	leer (radio,nombre,distancia);
	while (radio <> 0) do begin
		diametro:=0;
		Perimetro:=0;
		diametroPerimetro(radio,diametro,perimetro);
		if (diametro <= 12.7) and (diametro >= 6.780) then begin
			writeln('planeta con diámetro menor o igual que el de la Tierra y mayor o igual que el de Marte');
			writeln('nombre del planeta: ',nombre);
			writeln('distancia a la tierra: ',distancia);
		end
		if perimetro > 439.264 then
			cantJup:=cantJup+1;
		leer (radio,nombre,distancia);
	end;
	writeln('cantidad de planetas mas grandes que jupiter: ',cantJup);
end.


















































