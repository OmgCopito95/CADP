{13. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
program project1;

procedure cumpleA (var ok:boolean; var LongA:integer); //verifico si se ok la secuencia de A -en la que no existe el carácter ‘$’-
var
    c:char;
begin
    longA:=0;
    writeln ('Ingrese la primer secuencia de caracteres:');
    readln(c);
    while ((c <>'%') and (ok)) do begin //mientras no llegue al final de la secuencia y ok siga en true

        if (c='$') then           //si existe $ cambio el valor de ok a false
            ok:=false                  //asi cambio el valor del while y evito seguir procesando
        else begin
            longA:=longA+1;
            readln(c);                       // si no había $ sigo leyendo...
        end;

    end;
end;

procedure cumpleB(var ok:boolean; longA:integer);
var
    c:char;
    arroba, longB:integer;
begin
    arroba:=0;
    longB:=0;
    writeln ('Ingrese la segunda secuencia de caracteres:');
    readln(c);
    while ((c<>'*') and (ok)) do begin
        longB:=longB+1;
        if (c='@') then                                   longB=0
            arroba:=arroba+1;                             longA=10
        if ((longB>longA) or (arroba > 3))then           arroba=0
            ok:=false
        else
            readln(c);
    end;
end;


     a   g  d  e q  @  s d   w  @   y   u  o  l @ f  h  d  @


var
    car:char;
    ok:boolean;
    longA:integer;
begin
    ok:=true;
    cumpleA(ok, longA);
    if ok then begin                     //entonces se cumplió A porque ok sigue en true
        cumpleB (ok, longA);             //bueno acá necesito resolver el tema de las consonantes...
        if (ok) then //se cumplió la secuencia de B porque ok sigue en true
            writeln('¡Se cumplió la secuencia!')
        else writeln('¡NO se cumplió la secuencia B!');
    end
    else
       writeln('¡NO se cumplió la secuencia A!');
end.



{Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
    Tipo de zona     Rendimiento por ha
        1           6 toneladas por ha
        2           2,6 toneladas por ha
        3           1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
? La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
? La localidad del campo con mayor rendimiento económico esperado.
? La localidad del campo con menor rendimiento económico esperado.
? El rendimiento económico promedio.
}
program Hello;
type
    zona = 1..3;
procedure leerDatos(var cantHectSembradas:real; var tipoDeZona:zona; precioEnDolar:real);
begin
    writeln('Cantidad de hectáreas (ha) sembradas:');
    readln(cantHectSembradas);
    writeln('Tipo de zona:');
    readln(tipoDeZona);
    writeln('Precio en dolar');
    readln(precioEnDolar);
end;
procedure rendimientoEconomico(cantHectSembradas:real; tipoDeZona:zona; precioEnDolar:real); // mmm dudoso debo devolver el rendimiento, estimo que debe ser una variable...
begin
    case tipoDeZona of
        1: 6;
        2: 2.6;
        3: 1.4;
    else writeln('No corresponde a un tipo de zona');
    end;
end;
var
    cantHectSembradas,precioEnDolar :real;
    tipoDeZona:zona;
begin
    leerDatos(cantHectSembradas,tipoDeZona,precioEnDolar);
  rendimientoEconomico(cantHectSembradas,tipoDeZona,precioEnDolar);
end.






program eje5;




function numeros(numA:integer;numB:integer):boolean;
var dobleb: integer;
begin

    dobleb:= numA * 2;
    if (numB = dobleb) then
        numeros:= true
    else
        numeros:= false;
end;



var numA,numB,cantdoble,cantnumeros:integer;
begin
    cantnumeros:= 0;
    cantdoble:= 0;
    readln(numA);
    readln(numB);

    while ((numA <> 0) and (numB <> 0) ) do begin  // usar <> asi acepta numeros negativos

        cantnumeros:= cantnumeros + 1;  //cuenta la cant de pares leidos

        if numeros(numA,numB) then
            cantdoble:= cantdoble + 1; //cuenta la cant de pares donde numB es el doble de numA

        readln(numA);
        readln(numB);
    end;

    writeln('Cantidad de pares leidos',cantnumeros);
    writeln('Cantidad de pares en los que numB es el doble de numA son', cantdoble);
    readln();
end.




 program Hello;

function calcularDoble(numA,numB:integer):boolean;
begin
    calcularDoble:=(numB=numA*2);
end;

var
    numA, numB, cantParesLeidos, elDoble:integer;
begin
    cantParesLeidos:=0;
    elDoble:=0;
    writeln('Ingrese numA:');
    readln(numA);
    writeln('Ingrese numB:');
    readln(numB);
    while ((numA <> 0) and (numB <> 0)) do begin
        cantParesLeidos:=cantParesLeidos+1;

        if (calcularDoble(numA,numB)) then
            elDoble:=elDoble+1;

        writeln('Ingrese numA:');
        readln(numA);
        writeln('Ingrese numB:');
        readln(numB);
    end;
    writeln('Cantidad de pares leídos: ',cantParesLeidos);
    writeln('Cantidad de pares en los que numB es el doble de numA: ', elDoble);
end.

program ejericio7b;
procedure Leer(var num1, num2:integer);
begin
    write ('Ingrese el numero de A: ');
    readln (num1);
    write ('Ingrese el numero de B: ');
    readln (num2);
end;
{-----------------------------------------------------------------------------}
function esDoble(num1, num2:integer):boolean;
begin
    esDoble:= (num1*2)= num2;
end;
{------------------------------------------------------------------------------}
var
    numA, numB:integer;
    cantLeidos, cantDoble:integer;
begin
    cantLeidos:= 0;
    cantDoble:= 0;
    Leer (numA, numB);
    writeln ();
    while ((numA <> 0) and (numB <> 0)) do
    begin
        cantLeidos:= cantLeidos +1;
        if (esDoble (numA, numB)) then
            cantDoble:= cantDoble+1;
        Leer (numA, numB);
        writeln ();
    end;
    writeln ('La cantidad total de pares de numeros leidos: ', cantLeidos);
    writeln ('La cantidad de pares en las numB es el doble de numA: ', cantDoble);
    readln ();
end.



Program par de números;

procedure doble (numA , numb: integer; var pares_numB_2numA: integer)
Var
    Pares_Nros, pares_numB_2numA : integer;
    cumple : boolean
Begin
     numA:=0;
     numB:=0;
    num2A:= 0;
     cumple:= true;
     pares_numB_2numA:= 0;
    writeLn(´leer pares de números: ´);
     read(Pares_Nros);
    writeLn(´descomponer en numero A: ´, numA,  ´y ´, en numero B: ´, numB);
    read(numA);
    read(numB);
     if (numB = 2 * numA) and (cumple) then  begin
         writeLn(´Informar que el numero B es el doble del numero A: ´, num2A);
          read (numA, numB)
     end;
end;



Var
  NumA, NumB, Num2A, Pares_Nros, Cant_total = integer;
begin
   canT_Total:= 0;
   writeLn(´leer pares de números: ´);
  read(Pares_Nros);
   writeLn(´descomponer en numero A: ´, numA,  ´y ´, en numero B: ´, numB);
    read(numA);
    read(numB);

   while ((numA, numB) <> (0, 0) ) do begin  //numA<>0
       canT_Total:=cant_total + 1;

       If (doble (numA, numB, pares_numB_2numA) and (cumple) then
              pares_numB_2numA:= pares_numB_2numA + num2A

   end;


   writeLn (´informar la cantidad de pares de números leidos:  ´, (cant_Total)
end.








 //mateo

program punto8;
type cadena20 = string[20];

procedure leer(var codigo:integer; var precio:real;var tipo:cadena20);
begin
    writeln('Ingrese el precio del producto');
    readln(precio);
    writeln('Ingrese el codigo del producto');
    readln(codigo);
    writeln('¿Que tipo de producto haz elegido?');
    readln(tipo);
end;
procedure product_masbajo(precio: real; codigo: integer;cero : integer;var max1:real; var cod1:cadena20;var max2 :real; var cod2:cadena20);
var
begin
    if (precio < cero  ) then begin
        max1:=precio;
        cod1:=codigo;
    end
    else
        if (precio < max1) then begin
            max2:= precio;
            cod2:= codigo;
        end;
end;

var precio,max1,max2: real;
codigo, i,cero: Integer;
tipo,cod1,cod2 : cadena20;

begin
 cero:= 1000;

 for i:= 1 to 100 do begin
    leer(codigo,precio,tipo);
    product_masbajo(precio, codigo,cero,max1,cod1,max2,cod2);
    maxi(..)
 end;

end.



// cecilia

program Hello;
const
  cantProd = 100;
Type
    cadena25 = string[25];
Procedure leerDatos(var precio:real; var codigo:integer; var tipo:cadena25); //estos van con VAR?
Begin
    writeln('Ingrese el tipo de prenda');
    readln(tipo);
    writeln('Ingrese el precio del ',tipo);
    readln(precio);
    writeln('Ingrese el codigo del ',tipo);
    readln(codigo);
end;

procedure dosMasbaratos(precio:real; codigo:integer; var precioMin1,precioMin2:real;  var codMin1:integer; var codMin2:integer);
Begin
    if (precio<precioMin1) then Begin
        precioMin2:=precioMin1; //actualizo el min2
        codMin2:=codMin1; //actualizo el min2 -> codigo
        precioMin1:=precio; //actualizo el min1
        codMin1:=codigo; //actualizo min1 -> codigo
    end
    else if (precio<precioMin2) then Begin
        precioMin2:=precio;
        codMin2:=codigo;
    end;
end;

procedure pantalonCaro (precio:real; var precioMax:real; codigo:integer; var codMax:integer);
Begin
    if(precio>precioMax) then Begin
        precioMax:=precio;
        codMax:=codigo;
    end;
end;
Var
    precio, precioMax, precioMin1, precioMin2, prom,suma:Real;
    codigo, codMax, codMin1, codMin2, cont,i:integer;
    tipo:cadena25
Begin
    suma:=0;
    precioMax:=-1;

    precioMin1:=999;
    precioMin2:=999;

    for i:=1 to cantProd do Begin //pongo 5 para probar

        leerDatos(precio,codigo,tipo);
        suma:=suma+precio;
        dosMasbaratos(precio,codigo,precioMin1,precioMin2,codMin1,codMin2);
        if (tipo ='pantalon') then
            pantalonCaro(precio,precioMax,codigo,codMax);

    end;
    prom:=suma/cantProd; //puse div 5 porque es el limite del for que use
    writeln('El producto más barato fue el: ',codMin1);
    writeln('El segundo producto más barato fue el:' ,codMin2);
    writeln('El pantalon más caro fue el: ',codMax);
    writeln('El precio promedio fue de: ',prom:2:2);
end.


 // maria marta
program ejemplo;
type
   cadena20 = string[20];

procedure mascaro(p:real; c:integer; var cp:integer; var pmax: real);
begin
   If (p > pmax) then begin
          p:=pmax;
          c:=cp;
   end;
end;

procedure masBarato(p:real; c:integer; var c1, c2: integer; var mb1, mb2: real);
begin
     If (p < mb1) then begin
            mb2:=mb1;
             c2:=c1;
             mb1:=p;
             c1:=c;
     end
     else
         If (p < mb2) then begin
                mb2 := p;
                c2 := c;
        end;
end;

var
   precio,total: real;
   i,cod,cod1,cod2,codpant: integer;
   tipo: cadena20;
   mb1, mb2: real;
   pmax: real;
begin
  total:=0; cod1:=0; cod2:=0; mb1:=999; mb2:=999; pmax:=-1;
  for i:=1 to 100 do begin
      writeln('Ingrese un precio:');
      readln(precio);
      total := total + precio;
      writeln('Ingrese un codigo:');
      readln(cod);
      writeln('Ingrese un tipo:');
      readln(tipo);

     If (tipo ='pantalon') then
           mascaro(precio,cod, codpant, pmax);

     masBarato(precio,cod,cod1,cod2, mb1, mb2);


     end;
     writeln('Los dos codigos de los productos mas baratos son',cod1, 'y' ,cod2);
     writeln('El promedio es:', total / 100);
     writeln('El codigo del pantalon mas caro es', codpant);
     readln();
end.



Program Tienda;
Type
    prodcutos=string [25];
 Procedure Leer(var p:integer;var c:integer;var t:prodcutos);
 Begin
     readln(p);
     readln(c);
     readln(t);
 end;
Procedure MasBaratos(precio:integer;codigo:integer;var b1:integer;var b2:integer;var cod1:integer;var cod2:integer);
 begin
    IF (precio<b1)then begin
        cod2:= cod1;
        b2:= b1;
        cod1:=codigo;
        b1:=precio
     end
     else
       if(precio<b2) then begin
           b2:= precio;
           cod2:=codigo;
       end;
 end;
Procedure Mascaro(precio:integer;codigo:integer;var c1:integer;var codc:integer)
 begin
     If(precio>c1)then begin
        codc:=codigo;
        c1:=precio;
     end;
 end;
Var
   precio:integer;codigo:integer;i: integer;tipo:prodcutos;
   barato1,barato2,cod1,cod2:integer;
   caro1,codcaro:integer;preciototal:integer;
Begin

     caro1:=1;
     preciototal:=0
     min1:=9999;
      min2:=9999;
     For i:=1 to 100 do begin


      Leer(precio,codigo,tipo);

      MasBaratos(precio,codigo,min1,min2,cod1,cod2);



                                 If(tipo=pantalon) then
                                 Mascaro(precio,codigo,caro1,codcaro);
                                 preciototal:= preciototal+precio;
     end;
     writeln('El codigo del pantalon más caro es';codcaro);
     writeln('Los codigos de los dos productos más baratos son';cod1,cod2);
     writeln('El precio promedio es'; preciototal/100);
end.



  { Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa.
Para cada producto
debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.).
Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.
}

program Project1;


const
  prod = 3;  // cantidad de productos



type
    cadena20= string[20];

procedure leerProductos(var precio:real;var codigo:integer;var tipo:cadena20);

begin
   write(' ingrese codigo del producto: ');
    readln(codigo);
   write(' ingrese precio del producto: ');
    readln(precio);
   write(' ingrese tipo del producto (pantalon,remera,etc) : ');
    readln(tipo);
   writeln('//----------------------------------------------------//');

   end;
procedure MinyMax(codigo:integer;var codigoMax, codigo1,codigo2:integer ; precio:real;var preciototal:real ; tipo:cadena20);
 var
 min,min1:real;
 max:real;
begin

        if (min > precio) then begin
            codigo2:=codigo1;
            min1:=min;
           codigo1:= codigo;
            min:=precio


        end
        else if(min1 > precio) then begin
              min1:= precio;
              codigo2:=codigo;
          end;

         if( max < precio) and (tipo='pantalon') then begin
            codigoMax:= codigo;
            max:=precio;
         end;
end;
var
  i,codigo:integer;
  precio:real;
  tipo:cadena20;
  preciototal:real;
  codigoMas:integer;
  codigo1,codigo2:integer;
begin
    preciototal:=0;
    min:= 9999 ; min1:=9999;
    max:=-9999;

  for i:=1 to prod do begin

      leerProductos(precio,codigo,tipo);
      preciototal:=preciototal+precio;
      MinyMAx(codigo,codigoMas,codigo1,codigo2,precio,preciototal,tipo,min,min1,max);

   end;

    writeln('codigos de los productos mas baratos: ',codigo1,' y ',codigo2);
     writeln(' codigo del producto "pantalon" mas caro: ',codigomas);
     writeln(' precio promedio: ',(preciototal/prod):4:2);
     readln;readln;

end.



  program Hello;

function esVocal(car:char):boolean;
begin
    esVocal:=((car ='a') or (car ='e') aor (car ='i') or (car ='o') or (car ='u') or (car ='A') or (car ='E') or(car ='I') or(car ='O') or (car ='U'));
end;




procedure cumpleA (var cumple:boolean); //verifico si se cumple la secuencia de A -solo vocales-
var
    c:char;
begin
    writeln ('Ingrese la primer secuencia de caracteres:');
    readln(c);
    while ((c <>'$') and (cumple)) do begin //mientras no llegue al final de la secuencia y cumple siga en true
        if (esVocal(c)) then //si no es vocal cambio el valor de cumple a false
            readln(c); // si era una vocal sigo leyendo...
        else
            cumple:=false //asi cambio el valor del while y evito seguir procesando
    end;
end;

     a      e     g




 procedure cumpleB(var cumple:boolean);
var
    c:char;
begin
    writeln ('Ingrese la segunda secuencia de caracteres:');
    readln(c);
    while ((c<>'#') and (cumple)) do begin
        if (esVocal(c)) then
            cumple:=false
        else readln(c);
    end;
end;
var
    car:char;
    cumple:boolean;
begin
    cumple:=true;
    cumpleA(cumple);
    if cumple then begin//entonces se cumplió A porque cumple sigue en true
        cumpleB (cumple);
        if (cumple) then //se cumplió la secuencia de B porque cumple sigue en true
            writeln('¡Se cumplió la secuencia!')
        else writeln('¡NO se cumplió la secuencia B!');
    end
    else
      writeln('¡NO se cumplió la secuencia A!');
end.



Program RendimientoDeLosCampos
Type
   Cadena: string[15];
   Rango: 1..3;

   TipoZona = record
        1:zonaMuyFertil: integer,
        2:zonaEstandart: integer;
        3:zonaArida: integer;
   End;

  CampoSoja = record
       Localidad: cadena;
       cantHecSembradas: integer;
       Tip_Zon: TipoZona;
  End;

Function Rendimiento (ha: integer;  tipo: TipoZona; precio: real): real;
Var
    toneladas: real
Begin
   toneladas:=0;
   Case tipo of begin
       1:
         toneladas := ha * 6;
       2:
         toneladas := ha * 2.6;
       3:
         toneladas := ha * 1.4;
   Else
       Rendimiento:=-1;
   End;

   Rendimiento:= toneladas * precio;
End;

Procedure LeerTipo (var T: TipoZona)
Begin
     writeLn(´ingresar los tipos de cultivo´);
    case T of begin
         1:writeLn(`Tipo en zona Muy Fertil: ´);
             Read(zonaMuyFertil);
         2:writeLn(´Tipo en zona Estandart: ´);
            Read(zonaEstandart);
         3:writeLn(´Tipo en zona Arida: ´);
            Read(zonaArida)
    End;
End;

Procedure leerCampos (var C: campoSoja);
Begin
    writeLn( ´Ingresar informacion´);
    writeLn(´ingresar localidad: ´);
    readLn (C.Localidad);
   writeLn(´Ingresar cantidad de hectareas sembradas: ´);
   readLn(C.cantHecSembradas);
   If (C.cantHecSembradas <> 900) and (C.Localidad <> ´Saladillo´) then begin
           writeLn(´ingresar los tipos de zonas: ´);
           leerTipo(C.Tip_Zon);
   end;
End;

Var                                                      (programa principal)
   Ha: integer;
  Tipo: integer;
  Precio: real;
  Valor: real;
  Total: real;
  Cant, cantTres: integer;
  Max: real;
  Min: real;
  localidad, localidadMax, localidadMin: string
  Prom: real;
Begin
     Precio:= 320;
     Max:= -1;
     Min:= 9999;
     Prom:= 0;
     Total:= 0;
     Cant:= 0;
     cantTres:= 0;
     repeat  //
            readLn(localidad);
            readLn(ha);
            readLn(tipo);
            valor:= rendimiento (ha, tipo, precio);
            if(valor=-1)then begin
                writeln('invalido')
                cumple:=false;
            end
            else begin
              total:= total + valor;
              cant:= cant + 1;
              if (valor > max) then   //modularizar
                  max:= valor;
                  localidadmax:= localidad;
              if ( valor < Min) then   //modularizar
                 Min:= valor;
                 localidadMin:= localidad;
             if (localidad = ´Tres de febrero´) then
                 cantTres:= cantTres + 1;
           end;
     Until (localidad = ´Saladillo´and ha = 900 or cumple=true);
     Prom:= (total/cant)
     writeLn (´informar el promedio: ´, prom);
End;
















