{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

program ejercicio6;

procedure leerDatos();
var
  num: integer;
  max: integer;
begin
  max := -9990; //inicializo el maximo en un numero muy chico

  writeln('ingrese un numero');
  readln(num);
  while(num >= 0)do begin  //verifico que el numero sea positivo o 0


    if (num MOD 2 = 0)then begin  //verifico si el numero es par

      if (num > max)then begin  //si es par, calculo el maximo
        max := num;
      end;

    end;

    readln(num); //leo otro numero

  end;

  //cuando salgo del while signifca que se ingreso un numero negativo
  writeln('el numero maximo par leido fue: ',max);

end;

begin
  leerDatos; //llamo a la ejecucion del módulo
  readln;
end.

