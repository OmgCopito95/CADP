program ejer;
const
  pi=3.14
procedure circulo(radio:real; var diametro, perimetro:real);
	begin
		diametro:=radio*2;
		perimetro:=2*pi*radio;
	end;

procedure diametro_menor(nombre:string; distancia, diametro:real);
	begin
		if (diametro <= 12700) and (diametro >= 6780) then begin
			write('El Nombre y distancia del planeta que posee un diametro menor o igual que el');
			writeln(' de la Tierra y mayor o igual que el de Marte es ',nombre,' a ', diametro:5:3,' KM');
		end;	
	end;

procedure perimetro_jupiter(perimetro:real; var cant:integer);{no lo hice funcion porque si no, tenia que hacer otro codigo que me guarde las funciones}
	begin
		if (perimetro > 439264) then
			cant:=cant+1;
	end;	

var
	radio, diametro, perimetro, distancia:real;
	nombre:string[20];
	cant:integer;
begin
	cant:=0;
	radio:=0;
	writeln('Ingrese el radio, el nombre y la distancia de los planetas');
	readln(radio);
	while (radio <> 0) do begin
		readln(nombre);
		readln(distancia);
		circulo(radio, diametro, perimetro);
		perimetro_jupiter(perimetro, cant);
		diametro_menor(nombre, distancia, diametro);
		writeln('Ingrese el radio, el nombre y la distancia de los planetas');
		readln(radio)
	end;
	writeln('La Cantidad de planetas con un perimetro superior al del planeta Jupiter es ',cant);
	readln();
end.
