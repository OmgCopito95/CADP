program ejercicio14partica2parte2;
const
precio=320;
type
localidad=string [30];

procedure leer (var loc:localidad;var ha:integer; var zona:integer);
begin
writeln ('ingrese localidad');
readln (loc);
writeln ('Ingrese hectareas');
readln (ha);
writeln ('ingrese tipo de zona de siembra 1:muy fertil, 2:zona estandar, 3:zona arida');
readln (zona);
end;

function rendimiento (ha,zona:integer):real;
var
rend:real;
begin
if (zona = 1) then
	begin
		rend:=6*ha;
		rendimiento:=rend*precio;
	end
	else
		if (zona = 2) then
			begin 
				rend:=2.6*ha;
				rendimiento:=rend*precio;
			end
			else
				begin
				 rend:=1.4*ha;
				 rendimiento:=rend*precio;
	            end;                       	
end;

procedure maxrendidor (Re:real;loc:localidad;VAR max:real;VAR maxloc:localidad);
begin
if (re > max) then
	begin
		maxloc:=loc;
		max:=re;
	end;
end;

procedure minrendidor (Re:real;loc:localidad;VAR min:real;VAR minloc:localidad);
begin
if (re < min) then
	begin
		minloc:=loc;
		min:=re;
	end;
end;



function promedio (total:real;cant:integer):real;
begin
	promedio:=total/cant;
end;

var
mas10mil,ha,zona,cant:integer;
re,max,min,total:real;
minloc,maxloc,loc:localidad;


begin { programa principal }
mas10mil:=0;cant:=0;total:=0;
min:=99999999999999;
max:=-1;
repeat
    leer (loc,ha,zona);
    cant :=cant+1;
    Re:=rendimiento (ha,zona);
    total:=total + Re;
    if (loc = 'tres de febrero') and (Re > 10000)then
         mas10mil:=mas10mil + 1;  
    maxrendidor (re,loc,max,maxloc);
    minrendidor (re,loc,min,minloc);             
until (ha = 900) and (loc = 'saladillo');
writeln ('la cantidad de campos en Tres de Febrero con rendiemineto mayor a u$s 10000 son ', mas10mil);
writeln (maxloc,' es la localidad con mayor rendimiento');
writeln (minloc,' es la localidad con menor rendimiento');
writeln (promedio (total,cant):2:2,' es el rendimiento economico promedio');
end.









program ej1;

function suma (numA,numB:integer):integer;
begin
	suma:= numA+numB;
end;

function multi (numA,numB:integer):integer;
begin
	multi:= numA*numB;
end;

var
	i,numA,numB,totalS,totalM:integer;
begin
	totalS:=0;
	totalM:=1;
	For i:=1 to 10 do begin
		writeln('ingrese el primer numero');
		readln(NumA);
		writeln('ingrese el segundo numero');
		readln(numB);
		totalM:=totalM*multi(numA,NumB);
		totalS:=totalS+suma(numA,NumB);
	end;
	writeln('total de pares sumados: ',totalS);
	writeln('total de pares multiplicados: ',totalM);
end.




 procedure sumaYproducto(n1,n2:integer;var suma,prod:integer);
var j:integer;
begin
    suma:=0;
    prod:=1;
    for j:=n1 to n2 do begin
        suma:=suma+j;
        prod:=prod*j;
    end;
end;


  Program actividad2;
Procedure SUMA_PROD (numX,numY: integer; VAR suma, producto: integer);
Var
  indice: integer;
Begin
   suma:= 0;
   producto:= 1;
  If (numX > numY) then
    For indice:= numX downto numY do begin
       suma:= suma + indice;
       producto:= producto * indice;
    end
  ELSE
     If (numX < numY) then
       For indice:= numX to numY do begin
         suma:= suma + indice;
         producto:= producto * indice;
       end;
end;
VAR
  i,numX,numY,suma,producto: integer;
Begin

  For i:= 1 to 10 do begin
    suma:=0;
     writeln('ingrese el primer numero: ');
     readln(numX);
     writeln('ingrese el segundo numero: ');
     readln(numY);
     SUMA_PROD(numX,numY,suma,producto);
     writeln('La suma es de: ',suma);
     writeln('El producto es de: ',producto);
     writeln('    ');
  end;

  readln();
End.















program actividad3;
Type
  cod= 1 .. 200;
Procedure leer (VAR codigo: cod; VAR precio:real);
Begin
     writeln ('Ingrese un CODIGO:');
     readln( codigo);
     writeln('Ingrese un PRECIO:');
     readln(precio);
end;
Procedure MINIMOS (VAR precio_min1,precio_min2: real; VAR cod_min1,cod_min2: cod; precio: real; codigo:cod);
Begin
    IF (precio < precio_min1) then begin
        precio_min2:= precio_min1;
        precio_min1:= precio;
        cod_min2:= cod_min1;
        cod_min1:= codigo;
     end
    ELSE
       IF (precio < precio_min2) then begin
         precio_min2:= precio;
         cod_min2:= codigo;
     end;
end;
FUNCTION PAR(precio: real; codigo:cod): boolean;
Begin
     IF (precio > 16) AND ((codigo MOD 2)=0) then
        PAR:= true
     ELSE
       PAR:= false;


     PAR:=(precio > 16) AND ((codigo MOD 2)=0);
end;
Var
  codigo, cod_min1,cod_min2: cod;
  precio,precio_min1,precio_min2: real;
  cant_16,indice: integer;



Begin
  precio_min1:= 9999;
  precio_min2:= 9999;
  cant_16:= 0;
  FOR indice:= 1 to 5 do begin
     leer (codigo,precio);
     MINIMOS (precio_min1,precio_min2,cod_min1,cod_min2,precio,codigo);
     If (PAR(precio,codigo)) then
         cant_16:= cant_16 + 1;
     writeln('          ');
   end;
   writeln('El CODIGO del producto MAS BARATO es: ',cod_min1,' y del SEGUNDO MAS BARATO es: ',cod_min2);
   writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ',cant_16);
   readln();
End.









  program Hello;
type
    rango=1..200;
procedure masBarato (precio:real; codigo:rango; var min1,min2:real; var codbarato1,codbarato2:rango);
begin
    if (precio < min1) then begin
            min2:=min1;
            codbarato2:=codbarato1;
            min1:=precio;
            codbarato1:=codigo;
        end
        else if (precio < min2) then begin
            min2:=precio;
            codbarato2:=codigo;
        end;
end;
var
    i,cantidad16: integer;
    codigo, codbarato1, codbarato2: rango;
    precio,min1,min2: real;
begin
    min1:=999;
    min2:=999;
    cantidad16:=0;
    for i:=1 to 6 do begin// use 6 para probar
        writeln ('CÓDIGO:');
        readln(codigo);
        writeln ('PRECIO:');
        readln(precio);
        masBarato(precio,codigo,min1,min2,codbarato1,codbarato2);
        if ((precio > 16) and ((codigo mod 2) = 0)) then //podria hacer una función pero no vale la pena por dos lineas...
            cantidad16:=cantidad16 + 1;
    end;
   writeln ('Los códigos de los dos productos más baratos: ', codbarato1, 'y ', codbarato2);
    writeln ('La cantidad de productos de más de 16 pesos con código par es: ',cantidad16);
end.




program ejercio6practica1parte2;
const
cant=200;
type
codigo=1..200;
procedure leer (VAR cod:codigo; VAR precio:real);
      begin
        writeln ('Ingrese el codigo del producto');
        readln(cod);
        writeln ('Ingrese el precio');
        readln(precio);
     end;
procedure minimo (precio:real;cod:codigo; VAR min1,min2:real;VAR codmin1,codmin2:codigo) ;
      begin
        if (precio < min1 ) then
            begin // min1
                min2:=min1;
                codmin2:=codmin1;
                min1:=precio;
                codmin1:=cod;
            end
        else
          if (precio < min2) then // min2
                    begin
                        min2:=precio;
                        codmin2:=cod;
                    end;
      end;
var
codmin1,codmin2,cod:codigo;
min1,min2,precio:real;
cant16,i:integer;
begin
min1:=9999;
min2:=9999;
cant16:=0;
For i := 1 to cant do
    begin
        leer (cod,precio);
        minimo (precio,cod,min1,min2,codmin1,codmin2);
        if (precio > 16) and ((cod MOD 2=0)) then
                        cant16:=cant16 + 1
    end;
writeln('los codigos de los productos mas baratos son ',codmin1, ' y ', codmin2 );
writeln ('la cantidad de productos de mas 16$ con codigo par es ',cant16 );
end.



























