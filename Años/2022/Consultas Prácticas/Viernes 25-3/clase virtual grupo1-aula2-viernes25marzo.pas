//lazarus
{
program ejercicio5;

const
  PRECIO = 1.6;
var
  cant_caramelos: integer;  //X
  cant_clientes: integer; //Y
  cant_caramelos_x_cliente: integer;
  cant_caramelos_kiosquero: integer;

begin
   read(cant_caramelos);  //leo cant caramelos
   read(cant_clientes); //leo cant clientes

   //imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada cliente

   cant_caramelos_x_cliente:= cant_caramelos DIV cant_clientes; //se queda con el resultado de la division

   writeln('a cada cliente le corresponde ', cant_caramelos_x_cliente,' caramelos');

   //cant caramelos del kiosquero
   cant_caramelos_kiosquero:= cant_caramelos MOD cant_clientes; //se queda con el resto de la division
   writeln('al kiosquero le quedan',cant_caramelos_kiosquero,'caramelos');

   //-------------------------------------------------

   //imprima en pantalla un mensaje informando la cantidad de caramelos que le corresponderá a cada cliente


   writeln('a cada cliente le corresponde ', cant_caramelos DIV cant_clientes,' caramelos');

   //cant caramelos del kiosquero

   writeln('al kiosquero le quedan',cant_caramelos MOD cant_clientes,'caramelos');


   //------------------------------------------------

   cant_caramelos_x_cliente*1.60;  //lo que le cobra a un cliente
   cant_caramelos_x_cliente*1.60*cant_clientes; //lo que gana en total

   writeln('El kiosco va a ganar',cant_caramelos_x_cliente*PRECIO*cant_clientes,'pesos' );

end.

//----------------------------------------------------------------
 }
program ejercicioDos;
var
    num: integer; //X
{begin
    read (num1);
    if (num1>=0) then begin
        write (num1) //imprime X
        write('hola')
    end
    else //num1<0
        write (num1 * -1); //imprime -X
end. }


BEGIN
    readln(num);
    if (num >= 0) then begin
        writeln(num)
    end
    else
        writeln(num*-1);
    readln;
END.

  // IF ->  0,1 VEZ
  // WHILE -> 0, 1 O MAS VECES. corta cuando la condicion es falsa. NO SE cuantas veces se ejecuta
  // NO SE PROCESA
     //se leen numero hasta que aparezca el -1 "el cual no se procesa"

     read(num)
     while(num<>-1)do
        ---- //proceso el numero
        read(num)-1
     ---
     ---


  // FOR -> saben la cant exacta de veces que se ejecuta algo

     //se leen 5 numeros
     //  for i=1 to 5    i=5
           ----
           ----


  // A LO SUMO 8 -> COMO MAXIMO 8
  // AL MENOS 8 -> COMO MINIMO 8

  // repeat-until -> "repetir hasta que". corta la ejecucion cuando la condicion es verdadera
  // se ejecuta como minimo 1 vez
  // "el cual SE procesa"
     //leo numeros hasta que aparezca el -1 que si se procesa

     repeat
       read(num) //ESTA PROCESANDO -1
       -----
     until (num=-1)

 //-------------------------------------------------------------

{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}

 program ejercioTres;
var
    num1, num2, num3, posicionUno, posicionDos, posicionTres: integer;
begin
    read (num1);
    read (num2);
    if (num1 >= num2) then
        begin
            posicionUno:= num1;
            posicionDos:= num2;
        end
    else
        begin
            posicionUno:= num2;
            posicionDos:= num1;
        end;
    read (num3);
    if (num3 <= posicionDos) then
            posicionTres:= num3
    else
        if (num3 <= posicionUno) then
            begin
                posicionDos:= posicionTres;
                posicionDos:= num3;
            end
        else
            begin
                posicionTres:= posicionDos;
                posicionDos:= posicionUno;
                posicionUno:= num3;
            end;
    write (posicionUno,'    ',posicionDos,'    ',posicionTres);
end.

//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------



program ejercicioNueve;
var
    num, operacionResultado: integer;
    suma, resta, operacionSolicitada: char;
begin
    suma:= '+';
    resta:= '-';
    read (operacionSolicitada);

    if ((operacionSolicitada <> suma) and (operacionSolicitada <> resta)) then
        write ('ERROR')
    else
        if(operacionSolicitada = suma) then  +                    6+  5+  3 +1 +0  =RESULTADO
            begin
                read (num); 7                                           NUM=0
                operacionResultado:= 0;                             RESULTADO=0+6=6                  +5=11+3=14+1=15+0=15 --->15
                while (num <> 0) do
                    begin
                        operacionResultado:= operacionResultado + num
                        read (num);
                    end;
                write (operacionResultado)
            end
        else
            begin
                read (num);
                operacionResultado:= num;
                while (num <> 0) do
                    begin
                        read (num);
                        operacionResultado:= operacionResultado - num
                    end;
                write (operacionResultado)
            end;
end.













