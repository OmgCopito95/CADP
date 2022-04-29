program clase;


{A es una secuencia de sólo letras vocales}

function esVocal(letra:char): boolean;
var
  ok:boolean;
begin
   if ((letra='a') or (letra='e') ....)then
      ok:=true;
   else
       ok:=false;

   //esVocal:=((letra='a') or (letra='e') ....);

   esVocal:=ok;
end;

procedure cumpleA(var cumple:boolean);
var
   letra: char;
begin

  readln(letra);
  while(letra <> '$') and (cumple)do begin
     if(esVocal(letra))then
       readln(letra)
     else begin
       cumple:=false;
       writeln('no se cumple');
     end;
  end;


end;



{B es una secuencia de sólo caracteres alfabéticos sin letras vocales}

procedure cumpleB(var cumple);




end;

var
  cumple: boolean;

begin
  cumple:=true;

  cumpleA(cumple);

  if(cumple)then  //chequea que se cumpla A

     cumpleB(cumple);
     if(cumple)then  //chequea que se cumpla B
        writeln('se cumplio todo');
     else
        writeln('no cumple B');
  else
     writeln(' no se cumple A');

end.





{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}


    readl(marca) ford
    while(marca <> 'zzz')do begin  //cambio de marca          marca=c
        marcaActual= marca;                 //marcaActual=c

        while(marca = marcaActual)do  begin
             //proceso                             //auto de la marca actual
          calcularMaximo(max,auto);
          readln(marca);
        end;
        //cambio marca

        writeln('para la marca', marcaActual,'el promedio es..')
    end;

    //termine de leer todos los datos















