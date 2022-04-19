//gianluca
program project1;
function NumPar(num:integer):integer;
var
max:integer;
begin
max:=-1;
if ((num mod 2)=0) then begin
  if (num>max) then
      NumPar:=num
  else
    NumPar:=0;
   end;
end;


procedure leer;
var
  num,maxPar:integer;
begin
  max:=-1;
  writeln('Introducir un numero');
  readln(num);
  while (num>=0) do begin

    if ((num mod 2)=0 and (num>max)) then
        max:=num;
    writeln('Introducir un numero');
    readln(num);

  end;
  writeln('El numero par mas alto leído es ', max);
end;
begin
leer();
end.







program alcance3;

function NumPar(num:integer):integer;
begin
if ((num mod 2)=0) then begin
  if (num>max) then
      NumPar:=num
  else
     NumPar:=0;
   end;
end;

procedure leer;
var
  num,maxPar:integer;
begin
  maxPar:=-1;
  writeln('Introducir un numero');
  readln(num);
  max:=-1;
  while (num>=0) do begin
    if (NumPar(num)<>0) then
       maxPar:=num;
    writeln('Introducir un numero');
    readln(num);
  end;
  writeln('El numero par mas alto leído es ', maxPar);
end;
begin
leer();
end.





    function calcularMaximo(num:integer; max:integer) : integer;
    begin
         if(num>max)and (num mod 2=0)then
            calcularMaximo:=num;
         else
            calcularMaximo:=max;
    end;



begin
   max:=-1;
   read(num)
   while(num<>0)do begin

       max:=calcularMaximo(num,max);

       read(num)

   end;
end.
















  // sergio
program ej1;

procedure leerymax;
var num,max:integer;
begin
	max:=-1;
	readln(num);
	while (num>0) do begin
		if (num>max) and then
			max :=num;
		readln(num);
	end;
	writeln('el numero maximo ingresado fue: ',max);
end;

begin
	leerymax;
end.


  //matias
program ejer6;

procedure pares;
begin
if ((numA mod 2) = 0) and (numA > elGrande) then
    elGrande:=numA;
end;

var
    numA, elGrande : integer;  //locales al programa principal
begin
repeat  //while
    writeln('Ingrese el numero: ');
    readln(numA);
    pares;
until (numA < 0);
writeln('El numero par mas grande ingresado fue: ',elGrande);
end.



//florencia
     PROGRAM ejercicio_6a;
procedure enteros;
VAR
  num, par, max: INTEGER;
begin
  par:=0;
  max:=-1;
  WriteLn('Ingrese un numero');
  ReadLn(num);
  while (num  > -1) do begin
    IF (num mod 2 = 0) THEN
      //par:= num;
      if (num >= max) then
        max:= num;
  WriteLn('Ingrese un numero');
  ReadLn(num);
  end;
    WriteLn('El numero par mas alto es ', max);
end;
begin
     enteros;
end;



program alcanceYFunciones;

var
   suma, cant : integer;

function calcularPromedio : real
var
   prom : real;
begin
     if (cant = 0) then
        calcularPromedio := -1
     else
        calcularPromedio := suma / cant;

     //calcularPromedio:=prom;
end;
var
   p:real;

begin { programa principal }
      readln(suma);
      readln(cant);
      p:= calcularPromedio;
      if (p <> -1) then begin
         writeln('El promedio es: ' , p)
      end;
      else
          writeln('Dividir por cero no parece ser una buena idea');
end.







  program alcanceYFunciones;
var
	suma,cant:integer;
function calcularPromedio:real;
	begin

	calcularPromedio:=suma/cant

	end;
begin { programa principal }
	readln(suma);
	readln(cant);
	writeln('El promedio es: ',calcularPromedio:6:2);

	{otra opcion es eliminar if/else en la funcion, dejando solo:
	calcularPromedio:=suma/cant
	en el programa principal se cambia el writeln(...) por:
	if (cant<>0) then
		writeln('El promedio es: ',calcularPromedio:6:2);
	else
		writeln(Dividir por 0 = malo)

	De esa manera, cuando se invoca la funcion en el programa principal con
	cant=0, el programa no imprime contenido extra/basura.}
end.


program anidamientos;
 var
letra : char;

//----------------------------------------------------
     function analizarLetra : boolean
           begin
                if (letra >= ‘a’) and (letra <= ‘z’) then
                   analizarLetra := true;
                else
                    if (letra >= ‘A’) and (letra <= ‘Z’) then
                       analizarletra := false;
           end; { fin de la funcion analizarLetra }



procedure leer;

begin
     readln(letra);
     if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
     else
         writeln(‘Se trata de una mayúscula’);
end; { fin del procedure leer}
//----------------------------------------------------





var
   ok : boolean;
begin { programa principal }
      leer;
      {ok := analizarLetra;
      if ok then
         writeln(‘Gracias, vuelva prontosss’);}
end.




program anidamientos;

function analizarLetra(letra:char) : boolean;
begin
	if (letra >= 'a') and (letra <= 'z') then
		analizarLetra := true
	else
		if (letra >= 'A') and (letra <= 'Z') then
			analizarletra := false
		else
			writeln('el caracter ingresado no corresponde a una minuscula o mayuscula');
end; { fin de la funcion analizarLetra }

procedure leer;
var
	letra:char;
begin
	readln(letra);
	if (analizarLetra(letra)) then
		writeln('Se trata de una minúscula')
	else
		writeln('Se trata de una mayúscula');
end; { fin del procedure leer}

begin { programa principal }
	leer;
end.

{no entendi la ultima parte del programa original, borre lo que considere innecesario para que el programa
funcionara}


  program anidamientos;
var
 letra : char;

 function analizarLetra : boolean;
 begin
 if (letra >= 'a') and (letra <= 'z') then
 analizarLetra := true
 else
 if (letra >= 'A') and (letra <= 'Z') then
 analizarletra := false;
 end; { fin de la funcion analizarLetra }
 procedure leer;//poceseso leer
 begin
 readln(letra);
 if (analizarLetra) then
 writeln('Se trata de una minúscula')
 else
 writeln('Se trata de una mayúscula');
 end; { fin del procedure leer}

var
 ok : boolean;
begin { programa principal }
 leer;
 ok := analizarLetra;
 if ok then
 writeln('Gracias, vuelva prontosss');
end.










      PARAMETROS POR REFERENCIA
                 - (es una flechita) es la direccion de memoria donde esta la variables
                 - NO SE USAN EN FUNCIONES, SOLAMENTE EN PROCEDIMIENTOS
                 - se usa cuando se quiere modificar el valor


      PARAMETROS POR VALOR
                -  es una copia del parametro
                - FUNCIONES
                - PROCEDIMIENTOS
                - se usa cuando se quiere usar el valor sin modificarlo
























