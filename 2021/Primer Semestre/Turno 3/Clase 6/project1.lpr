{program alcance1;

var a,b: integer;

procedure uno;
begin
b := 3;
writeln(b); 3
end;

begin
a:= 1;
b:= 2;
uno;
writeln(b,'  ', a);  2     1
end.    2       1
        3       1
 }

{program impares;
var
   cant,a,i: integer;

procedure impar;
var
   a: integer;
begin
   read (a);
   if((a mod 2) <> 0)then
     write('Es impar');
end;

begin
   cant:=0;
   for i:= 1 to 10 do
      if (impar) then
         cant:=cant+1

end.


// 12 lucia
VAR
  carA,carB: char;
Begin
  writeln('Se ingresara el patron A$B# y $ y # SEGURO existe');

  writeln('Ingrese A: ');
   readln(carA);
   WHILE (carA <> '$') do begin
     If (NOT A(carA)) then
        writeln('NO se cumple A, por lo tanto no se cumple la secuencia A$B#')
     else
        writeln('Ingrese A: ');
        readln(carA);
  end;

  writeln('Ingrese B: ');
  readln(carB);
  WHILE (carB <> '#') do begin
  If (NOT B(carB)) then
     writeln('NO se cumple B, por lo tanto no se cumple la secuencia A$B#')
  else
   writeln('Ingrese B: ');
   readln(carB);
  end;
  readln();

End.
        }

program project1;

function esDoble (numA,numB:integer):boolean;
begin
	if numA*2 = numB then
		esdoble:=true
	else
		esdoble:=false;

        esDoble:=(numA*2 = numB)

end;

var
	numA,numB,cantDoble,cantLeido:integer;
begin
	cantDoble:=0;
	cantLeido:=0;
	writeln('ingrese el numero A');
	readln(numA);
	writeln('ingrese el numero B');
	readln(numB);
	while (numA <>0) and (numB<>0) do begin
		cantLeido:=cantLeido+1;
		if (esDoble(numA,NumB)) then
			cantDoble:=cantDoble+1;
		writeln('ingrese el numero A');
		readln(numA);
		writeln('ingrese el numero B');
		readln(numB);

	end;
	writeln('cantidad de pares leidos: ',cantLeido);
        writeln('cantidad de pares donde B es el doble de A: ',cantDoble);
end.












  program ej1;
 const
   cantP=5;
procedure minimos (precio:real; codigo:string; VAR codmin1:string; VAR codmin2:string; VAR min1:real;var min2:real);
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
end;
procedure pantCaro (precio:real; codigo:string; VAR codmax:string; VAR max:real);
begin
	if (precio > max) then begin
	  max:=precio;
	  codmax:=codigo;
	end;
end;
var
precio,max,min1,min2,precioTotal:real;
tipo,codmin1,codmin2,codmax,codigo:string;
i,cant:integer;
begin
	cant:=0;
	precioTotal:=0;
	min1:=19999;
	min2:=19999;
	max:=0;
	codmin1:='';
	codmin2:='';
	codmax:='';
	for i:=1 to cantP do begin
		writeln('ingrese el precio del producto');
		readln(precio);
		writeln('ingrese el codigo del producto');
		readln(codigo);
		writeln('ingrese el tipo del producto');
		readln(tipo);

		minimos (precio,codigo,codmin1,codmin2,min1,min2);
                if(tipo='pantalon')
		   pantCaro (precio,codigo,codmax,max);
		//cant:=cant+1;
		precioTotal:=precioTotal+precio;
	end;
	writeln('el codigo del producto mas barato es: ',codmin1,', Y el codigo del segundo mas barato es: ',codmin2);
	writeln('el codigo del pantalon mas caro es: ',codmax);
	writeln('el precio promedio de los productos es: 'precioTotal/cantP:2:2);
end.












