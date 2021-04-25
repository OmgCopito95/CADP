program project1;
const
    precioSoja = 320;
type
    zona = 1..3;
    cadena30 = string [30];
Function rendimientoEco (ha: integer; tipoDeZona:zona; precio: real): real;
Var
    Toneladas: real;
Begin
   Case tipoDeZona of
       1:
         toneladas := ha * 6;
       2:
         toneladas := ha * 2.6;
       3:
         toneladas := ha * 1.4;
     Else
          rendimientoEco:= -1;
     End;
     writeln(tipoDeZona);
     writeln(toneladas);
     rendimientoEco:= toneladas * precio;
End;
procedure mayorRendEsperado(rendimiento:real; var mayor:real; localidad:cadena30; var locmayor:cadena30);
Begin
    if(rendimiento > mayor) then Begin
        mayor:=rendimiento;
        locmayor:=localidad;
    end;
end;
procedure menorRendEsperado(rendimiento:real; var menor:real; localidad:cadena30; var locmenor:cadena30);
Begin
   writeln(rendimiento);
    if(rendimiento < menor) then Begin
        menor:=rendimiento;
        locmenor:=localidad;
    end;
    writeln('estoy en el procedimiento', menor);
    writeln(locmenor);
end;
procedure leerDatos(var ha:integer; var tipoDeZona:zona; var localidad:cadena30);
begin
    writeln('Cantidad de hectáreas (ha) sembradas:');
    readln(ha);
    writeln('Tipo de zona:');
    readln(tipoDeZona);
    writeln('localidad:');
    readln(localidad);
end;
var
    cantHectSembradas,cantCampos:integer;
    tipoDeZona:zona;
    cant:integer;
    rendEco,total,mayor,menor,promedio:real;
    localidad,locmayor, locmenor: cadena30;
begin
    total:=0;
    cant:=0;
    cantCampos:=0;
    mayor:=-1;
    menor:=99999;
    repeat
      leerDatos(cantHectSembradas,tipoDeZona,localidad);
      rendEco:= rendimientoEco(cantHectSembradas,tipoDeZona,precioSoja);
      writeln(rendEco);
      total:=total+rendEco;
      cant:=cant+1;
      if ((localidad = 'Tres de febrero') and (rendEco >10000) ) then
          cantCampos:=cantCampos+1;
      mayorRendEsperado(rendEco,mayor,localidad,locmayor);
      //writeln('aksjdnkajnd', menor);
      //writeln(locmenor);
      menorRendEsperado(rendEco,menor,localidad,locmenor);
      writeln('---------------', menor);
      writeln(locmenor);

    until ((cantHectSembradas = 10) and(localidad = 'Saladillo'));
    promedio:=total/cant;
writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es: ',cantCampos);
writeln('La localidad del campo con mayor rendimiento económico esperado es: ', locmayor);
writeln('La localidad del campo con menor rendimiento económico esperado es: ',locmenor);
writeln('El rendimiento económico promedio es: ', promedio:2:2);
readln;
end.



{ 
 program Hello;
procedure cumpleA (var ok:boolean; var LongA:integer); //verifico si se ok la secuencia de A -en la que no existe el carácter ‘$’-
var
    c:char;
begin
    longA:=0;
    writeln ('Ingrese la primer secuencia de caracteres:');
    readln(c);
    while ((c <>'%') and (ok)) do begin //mientras no llegue al final de la secuencia y ok siga en true
        if (c = '$') then //si existe $ cambio el valor de ok a false
            ok:=false //asi cambio el valor del while y evito seguir procesando
        else begin
            longA:=longA+1;
            readln(c); // si no había $ sigo leyendo...
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
        if (c='@') then
            arroba:=arroba+1;
        if ((longB>longA) or (arroba >3)) then
            ok:=false
        else
           readln(c);
    end;
end;
var
    car:char;
    ok:boolean;
    longA:integer;
begin
    ok:=true;
    cumpleA(ok, longA);
    if ok then begin//entonces se cumplió A porque ok sigue en true
        cumpleB (ok, longA);//bueno acá necesito resolver el tema de las consonantes...
        if (ok) then //se cumplió la secuencia de B porque ok sigue en true
            writeln('¡Se cumplió la secuencia!')
        else writeln('¡NO se cumplió la secuencia B!');
    end
    else writeln('¡NO se cumplió la secuencia A!');

    readln;
end.

    }

























