{no te pude pegar la consigna pero es el ejercicio 3 de la práctica 1 adicionales}

program project1;
var
    forma: char;
    ancho, largo, alto, radio, cantC, cantR, petizo, flaquito: integer;
    volPromC, volPromR, volumen, cantVolR, cantVolC, volumenMayor1, volumenMayor2: real;
begin
    volumen:=0;
    volumenMayor1:=-1;
    volumenMayor2:=-1;
    cantC:=0;
    cantVolC:=0;
    cantVolR:=0;
    cantR:=0;
    petizo:=0;
    flaquito:=0;
    readln(forma); //leo forma
    while (forma<>'Z') do begin // cada iteracion del while es tanque nuevo

        readln(alto); //leo el alto

        if (forma='C') then begin
            readln(radio);  // leo radio
            volumen:=3.14*(radio*radio)*alto; //calculo volumen
            cantC:=cantC+1; //cuento un tanque cilindrico
            cantVolC:=cantVolC+volumen;
        end
        else begin
            readln(ancho);
            readln(largo);
            volumen:=ancho*largo*alto;  //calculo volumen
            cantR:=cantR+1;  //cuento un tanque rectangular
            cantVolR:=cantVolR+volumen;
        end;

        if (alto < 1.40) then  //d
          petizo:=petizo+1;

        if volumen < 800 then
          flaquito:=flaquito+1;

        //calcular dos maximos    //modularizar
        {if (volumen > volumenMayor1) then begin
            volumenMayor2:=volumenMayor1;
            volumenMayor1:=volumen;
        end; }

        readln(forma);
    end;

    volPromC:=cantVolC/cantC;
    volPromR:=cantVolR/cantR;

    writeln('Ranking de tanques: ');
    writeln('1. ',volumenMayor1,', 2. ',volumenMayor2);
    writeln('Promedio cilindrico: ',volPromC:2:2);
    writeln('Promedio rectangular: ',volPromR:2:2);
    writeln('Cantidad de tanques de menos de 1,40 metros: ',petizo);
    writeln('Cantidad de tanques de menos de 800 centimetros cubicos: ',flaquito);
end.









   
{14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja.
El módulo debe
recibir la cantidad de hectáreas (ha) sembradas,
el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja;
y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar
el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
1 = 6 toneladas por ha
2 = 2,6 toneladas por ha
3 = 1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee:

localidad, cantidad de hectáreas sembradas y el tipo de zona(1, 2 ó 3).

La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio
}

program Practica2_ejer14_P2_B___NICE;
type
  cadena20=string[20];
const
  dolar=320;

procedure leer(var ha:real; var zona:integer; var localidad:cadena20);
begin
      read(ha);
      read(zona);
      read(localidad);
end;




function rendimiento(hecta:integer; tipoZona:integer; dolarucos:real) :real;
begin
          case  tipoZona of
            1:
              rendimiento:= dolarucos *(6 * hecta);
            2:
              rendimiento:= dolarucos *(2.6 * hecta);
            3:
              rendimiento:= dolarucos *(1.4 * hecta);
           else
              rendimiento:=-1;  //no ingreso un tipo de zona valido
          end;
end;

//-----------------------------------------------------------------------------------//

procedure mayorRend(rend_EC:real; localidad:cadena20; var localidadMAx:cadena20; var max:real);

begin
       if (max<rend_EC) then begin
            localidadMAx:=localidad;
            max:=rend_EC;
       end;
end;

//------------------------------------------------------------------------------------//
                                                   //acomodar
function MenorRend(rend_EC:real; localidad:cadena20; localidadMIN:cadena20; min:real):cadena20;

begin
       if (rend_EC<min) then begin
           min:=rend_EC;
           localidadMin:=localidad;
       end;

      MenorRend:=localidadMin;

  end;

//------------------------------------------------------------------------------------//

var
 x:cadena20; z:cadena20;
 tipoZona, hecta :integer;
 localidad , localidadMax, localidadMIN:cadena20;
 rend,  rend_ec :real;
 rendimientoTOTAL :real;
 cont, cont3 :integer;
 Max :real; min :real;

begin
cont:=0;     x:=' ';
cont3:=0;    z:=' ';
rendimientoTOTAL:=0;  localidadMax:=' ';  localidadMin:=' ';
Max:=-9999;
min:=99999999;

repeat

  leer(hecta,tipoZona,localidad);///  leer datos del campo

  rend_EC:= rendimiento(ha,tipoZona,dolar); //rendimiento economico individual

  mayorRend(rend_EC,localidad,localidadMax,max); //

  //z:=MenorRend(rend_EC,localidad,localidadMin,min);// acomodar

  rendimientoTOTAL:= rendimientoTOTAL + rend_ec;


//------------------------------------//  a
  if( localidad='tres de febrero') and (rend_ec>10000) then
     cont3:=cont3+1;
//-----------------------------------//


  until ( hecta=900) and (localidad='saladillo'); //corte de control

   writeln(' rendimiento economico promedio de todas las plantaciones: ',(rendimientoTOTAL/cont):10:2);
   writeln(' rendimiento economico de plantaciones en tres de febrero y Rend. mayor a $10000:  ',cont3 );
   writeln(' el mayor rendimiento economico es de la localidad de:  ',localidadMax );
   writeln(' el menor rendimiento economico es de la localidad de:  ',localidadMin );
 readln;
end.




   el siguiente rendimiento por tipo de zona:
Tipo de zona Rendimiento por ha
1 = 6 toneladas por ha
2 = 2,6 toneladas por ha
3 = 1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee:

localidad, cantidad de hectáreas sembradas y el tipo de zona(1, 2 ó 3).

La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio
}






















program Practica2_ejer14_P2;



function rendimiento(hecta:integer; tipoZona:integer; dolarucos:real) :real;
begin
        case  tipoZona of
          1:
            rendimiento:= dolarucos *(6 * hecta);
          2:
            rendimiento:= dolarucos *(2.6 * hecta);
          3:
            rendimiento:= dolarucos *(1.4 * hecta);
         else
            rendimiento:=-1;  //no ingreso un tipo de zona valido
        end;
end;

var
 tipoZona,hecta:integer;
 dolarucos:real;
 rend:real;
begin


  leer(hecta,tipoZona,dolarucos,rend);


   writeln(' rendimiento economico de la plantacion es de: ',rend:8:2,' dolares en total');
    readln;




end.








              procedure confundir (var a:integer; b:integer);
              begin
                    ....
              end;


              var
               b,a:integer
              begin
                   b:=1;
                   a:=2;
                   confundir(b,a);
              end;










function calcularSuma(x,y:integer):integer   //para calcular la suma
var
 j:integer;
 suma:integer;
begin
           suma:=0;
           if(x < y)  then

              for j:=x to y do begin
                 suma:=suma+j;
              end;
           else
             for j:=x downto y do begin
                 suma:=suma+j;
              end;

           calcularSuma:= suma;
end;

       var
          suma:integer;
       begin



         for i:=1 to 10 do begin  //cada iteracion del for analiza dos pares de numeros
             suma:=0;
             read(x);
             read(y);

             suma:=calcularSuma(x,y);

             writeln('suma=', suma);
         end;


      end.





              for 1 a 200
                  leerDatos
                  calculoMinimos
                  cant:=funcion()

              end;
              imprimir Minimos
              informar cant prod cod par











