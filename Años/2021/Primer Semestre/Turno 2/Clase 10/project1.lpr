{7- Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
? Cantidad total de centros para cada universidad.
? Universidad con mayor cantidad de investigadores en sus centros.
? Los dos centros con menor cantidad de becarios.}

program project1;
type
    cadena10 = string[10];
    cadena30 = string[30];

    centro = record
        nombre:cadena10;
        univeper:cadena30;
        cantInv:integer;
        cantBec:integer;
    end;

procedure menorCantBec(centroActual:cadena10; cantBecAct:integer; var menorBec1,menorBec2:integer; var centro1,centro2:cadena10);
begin
    if (cantBecAct < menorBec1) then begin
        menorBec2:=menorBec1;
        centro2:=centro1;
        menorBec1:=cantBecAct;
        centro1:=centroActual;
    end
    else if (cantBecAct < menorBec2) then begin
            menorBec2:=cantBecAct;
            centro2:=centroActual;

        end;
end;
procedure mayorInvestigadores(cantInv:integer; uniactual:cadena30; var maycantinv:integer; var univMayor:cadena30);
begin
    if (cantInv > maycantinv) then begin
        maycantinv:=cantInv;
        univMayor:=uniactual;
    end;
end;
procedure leerCentro (var c:centro);
begin
    with c do begin
        writeln('CANTIDAD DE INVESTIGADORES:');
        readln(cantInv);
        if (cantInv <> 0) then begin
        writeln('NOMBRE DEL CENTRO:');
        readln(nombre);
        writeln('UNIVERSIDAD A LA QUE PERTENECE:');
        readln(univeper);
        writeln('CANTIDAD DE BECARIOS:');
        readln(cantBec);
        end;
    end;
end;
var
    cen:centro;
    totalCentros,totalInvest,maycantinv,menorBec1,menorBec2:integer;
    centro1,centro2:cadena10;
    univActual,univMayor:cadena30;
begin

    maycantinv:=-1;
    menorBec1:=999;
    menorBec2:=999;

    leerCentro(cen);
    while(cen.cantInv <> 0) do begin
        univActual:= cen.univeper;

        totalCentros:=0;
        totalInvest:=0;

        while (cen.cantInv <> 0) and (univActual = cen.univeper) do begin  //analizo todos los centros de una misma universidad

          totalCentros:=totalCentros+1;

          totalInvest:=totalInvest+cen.cantInv;

          menorCantBec(cen.nombre,cen.cantBec, menorBec1,menorBec2,centro1,centro2);

          leerCentro(cen);

        end;//salgo del while porque CAMBIO DE UNIVERSIDAD

        writeln('Cantidad total de centros para cada universidad: ', totalCentros);

        mayorInvestigadores(totalInvest,univActual,maycantinv,univMayor);

    //IMPRIMO COSAS DE TODOS LOS CENTROS
    end;
    writeln('Universidad con mayor cantidad de investigadores en sus centros: ', univMayor);
    writeln('Los dos centros con menor cantidad de becarios: ', centro1 ,' y ', centro2);
end.




 

{4. Una compaÃ±Ã­a de telefonÃ­a celular debe realizar la facturaciÃ³n mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su cÃ³digo de cliente y
cantidad de lÃ­neas a su nombre. De cada lÃ­nea se tiene el nÃºmero de telÃ©fono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compaÃ±Ã­a e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un mÃ³dulo que lea la informaciÃ³n de una lÃ­nea de telÃ©fono.
b. Realizar un mÃ³dulo que reciba los datos de un cliente, lea la informaciÃ³n de todas sus lÃ­neas (utilizando el
mÃ³dulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cÃ¡lculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program ejer4;
const
    cli = 5;
type
    cliente = record
        codigo: integer;
        cantL: integer;
    end;

    Lineas = record
        numTel: integer;
        CantMin: real;
        CantMB: real;
    end;

//modulos
procedure leerCli (var c: cliente);
begin
    writeln ('Ingrese el codigo: ');
    readln (c.codigo);
    writeln ('Ingrese la cantidad de lineas: ');
    readln (c.cantL);
end;

procedure leerLinea (var l: Lineas);
begin
    writeln ('Ingrese el numero: ');
    readln (l.numTel);
    writeln ('Ingrese la cantidad de minutos: ');
    readln (l.CantMin);
    writeln ('Ingrese la cantidad de MB: ');
    readln (l.CantMB);
end;

procedure procesar (c: cliente; var TotalMin: real; var TotalMB: real);
var
    l: Lineas;
    i:integer;
begin
    for i:= 1 to c.cantL do begin
        leerLinea(l);
        TotalMin:= TotalMin + l.CantMin //* 3.40;   //cuenta cant total de minutos de todas las lineas del cliente
        TotalMB:= TotalMB + l.CantMB// * 1.35;
    end;
    TotalMin:=  TotalMin * 3.40; //calculo el precio final
    TotalMB:= TotalMB * 1.35;
end;

procedure Imprimir (TotalMin, TotalMB: real);
var
    suma: real;
begin
    suma:= TotalMin+TotalMB;
    writeln('EL monto total es: ', suma:4:2);
end;

//pp
var
    c: cliente;
    i: integer;
    TotalMin, TotalMB: real;
begin
    for i:= 1 to cli do begin
        TotalMin:=0;
        TotalMB:=0;
        leerCli (c);
        procesar (c, TotalMin, TotalMB);
        Imprimir (TotalMin, TotalMB);
    end;
end.



// ---------------------------------------------------------------------------------

VECTORES -> HOMOGENEO
         -> 5 POS -> SE GUARDAN TODOS CONSECUTIVAMENTE

         -> V[8] -> ACCEDO AL VECTOR EN LA POS 8

  const
       dimF = 10;
  type
      vector = array [1..dimF] of integer;  -> DimF=10
                      1..1000
      dimF -> constante


  -> Dimension Logica -> cant de datos que estan guardados en el vector
  -> Dimension Fisica -> el maximo de datos que puedo tener guardado



  Cuando se recorre un vector, generalmente uso un FOR

  IMPRIMIR TODOS LOS DATOS DE UN VECTOR

      for i:=1 to DimL -> si el vector no esta cargado ompletamente
                  DimF -> cuando todo el vector esta cargado


  -> DIML <= DIMF

// ------------------------------------------------

program Vectores;
const
  cant_datos = 3;
  type
    vdatos = array[1..cant_datos] of real;


                                             SI INICIALIZO DIML=0
  procedure cargarVector(var v:vdatos; var dimL : integer);
      var
        nreal:real;
      begin
       writeln('Ingrese un numero real:');
       readln(nreal);  77
                                          3
       while (nreal <> 0) and (dimL < cant_datos) do begin

          dimL:= dimL+1; //voy cargando la dimL
          v[dimL]:=nreal; //asigno el valor leído en esa posición del vector...

          //v[1] = 15
          //v[2] = 17
          //v[3] = 8

          //v[4] -> posicion invalida ERROR

          writeln('Ingrese un numero real:');
          readln(nreal);
      end;
end;

                                              SI INICIALIZO DIML=1
   procedure cargarVector(var v:vdatos; var dimL : integer);
      var
        nreal:real;
      begin
       writeln('Ingrese un numero real:');
       readln(nreal);  77
                                 1         3
       while (nreal <> 0) and (dimL < cant_datos) do begin


          v[dimL]:=nreal; //asigno el valor leído en esa posición del vector...
          dimL:= dimL+1; //voy cargando la dimL

          //v[1]=77

          writeln('Ingrese un numero real:');
          readln(nreal);
      end;
end;

                                                                 10
procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        v[i]:= v[i] + n; //INCREMENTA CADA POS DEL VECTOR EN N  //V[1]=8 -> v[1]=v[1]+  10 -> v[1]=8+10
        suma:= suma + v[i]; //SUMA TODOS LOS VALORES DEL VECTOR
    end;
end;

var
    datos : vdatos;

    i, dim : integer;
    num, sumaTotal : real;
begin
    dim := 0;  //inicializo la dimL
    sumaTotal := 0;
    cargarVector(datos, dim);
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(datos, dim, num, sumaTotal);
    writeln('La suma de los valores es: ', sumaTotal);
    writeln('Se procesaron: ',dim, ' números');
end.




// -----------------------------------------------------------------------

//vector de enteros  DIMF=845415515125

function calcularMaximoEnVector(v:vector;dimL:integer): integer;
var
    max:integer;
begin
     max:=-1;

     for i:=1 to dimL do begin
         if( v[i] > max )the
             max:=v[i];
     end;

     calcularMaximoEnVector:=max;
end;



function calcularMinimoEnVector(v:vector;dimL:integer): integer;
var
    min:integer;
begin
     min:=999;

     for i:=1 to dimL do begin
         if( v[i] < min )the
             min:=v[i];
     end;

     calcularMaximoEnVector:=min;
end;

var
    diml:integer;
    v:vector

begin
    dimL:=0;
    cargarVector(v,dimL); //ya se dispone

    //RECORRO EL VECTOR DOS VECES
    //LE MANDO TODO EL VECTOR POR PARAMETRO

    writeln('el elemento mas grande es:', calcularMaximoEnVector(v,dimL));

    writeln('el elemento mas chico es:', calcularMinimoEnVector(v,dimL));

end.


  //para recorrer una vez sola el vector

procedure calcularMax(num:integer;var max:integer);
begin

    if(num > max)then
           max:=num;

end;



  begin
       //RECORRO EL VECTOR 1 VEZ SOLA
      //LE MANDO POR PARAMETRO CADA NUMERO

       for i:=1 to dimL do begin
           calcularMax(v[i],max);
           calcularMin(v[i],min);
       end;

  end.




 //-----------------------------------------------------------------------------
// parte del ejercicio 3

  procedure imprimirMitadVec (v:vector_numeros; dimL:integer);
var
    i: integer;
begin
    for i:= (dimL div 2) downto 1 do
        writeln('Desde la mitad hacia la primer posición',i,  'contiene:', v[i]);

    for i:= ((dimL div 2)+1) to dimL do
        writeln('desde la mitad más uno hacia la última posición contiene:', v[i]);
end;



procedure imprimirXY (v: vector_numeros; x,y:integer);
var
    i:=integer;
begin
    If (x > y) then begin
        for i:= x to y do
        writeln('El contenido es', v[i]);
    end
    else (y > x) then begin
            for x downto i:= y do
            writeln('El contenido en', v[i]);
    end;
end;




