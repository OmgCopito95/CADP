{program ejercicio8partica2parte2;
const
cantidad=100;
type
tipos=string [30];

procedure leer (var precio:real; var cod:integer; var tipo:tipos);//leer datos
begin
writeln ('ingrese precio');
readln (precio);
writeln ('ingrese codigo');
readln (cod);
writeln ('ingrese tipo de producto');
readln (tipo);
end;//fin leer

//minimos
procedure minimos (cod:integer;precio:real; VAR min2, min1:real; var codmin1,codmin2:integer);
begin
if (precio < min1 ) then
		begin
			min2:=min1;
			codmin2:=codmin1;
			min1:=precio;
			codmin1:=cod;
		end
	else
		if (precio < min2 )then
		begin
			min2:=precio;
			codmin2:=cod;
			end;
end;//fin minimos

// proceso max
procedure maximo (c:integer;p:real;var max:real; var mc:integer);
begin
if (p > max ) then
	begin
          write()
	  mc:=c;
	  max:=p;
   end;
end;//fin max

// funcion de promedio
function promedio (totalp:real):real;
begin
	promedio:=totalp / cantidad;
end;//fin promedio

var{ var de programa principal }
i,codmin1,codmin2,maxcod,cod:integer;
tipo:tipos;
min2,min1,max,totalp,precio,prom:real;
begin { programa principal }
min2:=9999;
min1:=99999;
max:=-1;
totalp:=0;
for i:= 1 to cantidad do
	begin
	leer(precio,cod,tipo);
	minimos (cod,precio,min2,min1,codmin1,codmin2);
	if (tipo = 'pantalon')  then
		maximo (cod,precio,max,maxcod);
	totalp:=totalp + precio;
	end;
prom:=promedio (totalp);
writeln ('el codigo de los 2 prod mas barats son ', codmin1,' y ' , codmin2);
writeln ('el codigo del pantalon mas caro es ', maxcod);
writeln ('el precio promedio es $', prom:6:2);
end.
    }






program sdfsdf;

procedure digitos (num:integer; VAR diez:boolean);
var
	suma,cant:integer;
begin
	suma:=0;
	cant:=0;
	while (num <> 0) do begin
		cant:=cant+1;
		suma:= (num MOD 10) + suma;
		num := num DIV 10;
	end;
	writeln('la cantidad de digitos del numero es: ',cant);
	writeln('la suma de sus digitos es ',suma);
	if suma =10 then
		diez:=true;
end;

var num:integer; diez:boolean;
begin
diez:=false;
writeln('ingrese un numero');
readln(num);
while (diez=false) do begin
	digitos (num,diez);
        readln(num);
end;



end.





    {


   Program ejer9;
function esPar(d:integer):boolean
begin
        esPar:=(d mod 2= 0)
end;
Procedure DESCOMPONER (num: integer; VAR cant_dig,suma_dig: integer);
Var
  dig: integer;
Begin                                                              div 10 = 923479823
                                                        9234798234 mod 10 = 4
  WHILE ( num <> 0) do begin
     dig:= num MOD 10;  // guarda el digito de mas a la derecha   5
     if(esPar(dig))
        cuento
     //cant_dig:= cant_dig + 1;
     //suma_dig:= suma_dig + dig;
     num:= num DIV 10; // achica el numero que se esta descomponiendo
  end;
End;



Var
  num, cant_dig,suma_dig: integer;
Begin
  REPEAT
    suma_dig:= 0;
    cant_dig:= 0;
    writeln ('Ingrese un numero entero');
    readln(num);
    DESCOMPONER (num,cant_dig,suma_dig);

    writeln('La cantidad total de digitos leidos del numero ingresado es: ',cant_dig);
    writeln('La suma total de los digitos es de: ',suma_dig);
    writeln('     ');
  UNTIL (suma_dig = 10);
 readln();
End.





                  }



























