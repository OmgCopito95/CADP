program ejer;
procedure circulo(radio:real; var diametro, perimetro:real);
	var
		pi:real;
	begin
		pi:=3.14;
		diametro:=radio/2;
		perimetro:=2*pi*radio;
	end;

var
	radio, diametro, perimetro:real;
begin
	radio:=0;
	writeln('Ingrese el radio de un circulo');
	readln(radio);
	circulo(radio, diametro, perimetro);
	writeln('El radio es ',diametro:3:3,' y el perimetro es ',perimetro:3:3);
	readln();
	end.