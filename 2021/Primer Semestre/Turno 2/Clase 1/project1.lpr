{program Project1;

begin
end.



tipo de datos
      integer
      real
      boolean
      char

estructuras de control

CUANTAS VECES SE EJECUTAN
   if -> 0, 1 vez, Corta cuando la condicion es falsa
   while -> 0, 1, mas veces. Corta cuando la condicion es falsa
   repeat until -> al menos 1
   for -> numero fijo de veces


       repeat
             read(num);
       until (num=1); -> corta cuando la condicion es verdadera


CUANDO SE USAN?
  "se leen datos hasta que aparezca el 10 y NO DEBE PROCESARSE"
   - WHILE

     num:=6;
     while(num<> 10)do begin
       writeln(num)
       read(num)
     end;

   "se leen datos hasta que aparezca el 10 y  DEBE PROCESARSE"
     num:=10;
     repeat
           writeln(num);
           read(num);
     until(num=10);




program ejercicio1;

var
  num1,num2: integer;

begin
  read(num1);    //lee desde teclado
  read(num2);

  if(num1 > num2)then
     write('el numero',num1,'es el mayor')
  else
    if(num2 > num1)then begin
       writeln('hola');
       read(num);
       write('el numero',num2,'es el mayor')
    end
    else
       writeln('son iguales');
end.
 }


{
 {3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}
program Hello;
var
    num1,num2,num3:integer;
begin
  writeln ('Ingrese el primer valor:');
  readln(num1);
  writeln ('Ingrese el segundo valor:');
  readln(num2);
  writeln ('Ingrese el tercer valor:');
  readln(num3);

    If (num3 > num2) then
      if (num3>num1) then
        if (num1>num2) then
            writeln ('el orden es:', num3,' ',num1,' ',num2)
        else writeln('el orden es:',num3,' ',num2,' ', num1)
      else if (num1>num2)then
        writeln('el orden es:',num1,' ',num3,' ', num2)
    else
      if (num3>num1)then
            if (num2>num1) then
               writeln ('el orden es:', num2,' ',num3,' ',num1)
            else
            if(num1>num2) then
                writeln ('el orden es:', num1,' ',num2,' ', num3);
            //else
              //writeln ('el orden es:', num2,' ',num1,' ', num3)
  readln();
end.
}
 {
 program practica1_3;

var
  num1,num2,num3:integer;

begin
  writeln('escriba 3 numeros');
  read(num1,num2,num3);

  if(( num3 < num2) and (num3<num1)) then
      if( num2<num1) then
          writeln(' ',num1,' ',num2,' ',num3)
      else
         writeln(' ',num2,' ',num1,' ',num3)
  else
    if(( num1 < num2) and (num1<num3)) then
      if( num2<num3) then
          writeln(' ',num3,' ',num2,' ',num1)
       else
       write (' ',num2,' ',num3,' ',num1)

      else
          if(( num2 < num1) and (num2<num3)) then
      if( num1<num3) then
          writeln(' ',num3,' ',num1,' ',num2)
       else
        write (' ',num1,' ',num3,' ',num2);
 readln;
 readln;
end.

                  }



{
                   F                F  = F
                   V                F  = F
                   F                V  = F
                   V                V  = V
          if ((num1 > num2) and (num1 > num3)) then ->
            write('entro al if');


          if ((num1 > num2) or (num1 > num3)) then -> una condicion es v = V
                  F                  F        = F
                  V                  F        = V
                  F                  V        = V
                  V                  V        = V

}


{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R^2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)}

 {
program ej4p0;
const
  pi = 3.14; //constante, nunca cambia su valor
var
  diametro: real;
  radio: real;
  area: real;
  perimetro: real;
begin
  read(diametro);
  //diametro:=8.6;

  radio:= diametro/2;
  writeln('el radio del circulo es:', radio);  //punto a

  area:= pi*radio*radio;
  writeln('el area del circulo es:',area); //punto b

  perimetro:=pi*radio*2;
  writeln('el perimetro del circulo es:',perimetro); //punto c
end;  }


  {
Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)
}
 {
 x:real;
 num:real;
 cant: integer; //variable contadora

 read(x); 5  //NO CAMBIA
 read(num);  7
 cant:=1;  //cuenta la cant de numeros que lei


 while(num <> x*2) and (cant < 11)do begin
    cant:=cant+1;
    read(num);
 end;

    }


program project1;
const
    maximo=10;
var
    num,x:real;
    cantidad:integer;
begin
    cantidad:=1;
    writeln('Ingrese un valor:');
    readln(x);
    writeln('Ingrese un numero:');
    readln(num);

              //MENOR A 10 O 11?
    while ((cantidad <= maximo ) and (num <> x*2)) do begin
        cantidad:=cantidad+1;
        writeln('Ingrese un numero:');
        readln(num);
    end;

    writeln('Ingresaste el doble del valor.');
end.





     write('hola');
     write('chau');   -> holachau


     writeln('hola');
     writeln('chau'); ->> hola
                          chau























