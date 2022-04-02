{  Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}

program ejercicio3;

var
   num1,num2,num3: integer;
begin
  readln(num1);
  readln(num2);
  readln(num3);

  //imprime los numeros en orden descendente

    if (num1 > num2) and (num1 > num3) then // verifica si el mas grande es num1
    begin
      writeln(num1);
      if (num2 > num3) then     //verifica cual de los dos restantes es el mas grande
      begin
        writeln(num2);
        writeln(num3);
      end
      else
      begin
        writeln(num3);
        writeln(num2);
      end;
    end
    else
    begin
      if (num2 > num1) and (num2 > num3) then //verifica si el mas grande es num2
      begin
        writeln(num2);
        if (num1 > num3) then     //verifica cual de los dos restantes es el mas grande
        begin
          writeln(num1);
          writeln(num3);
        end
        else
        begin
          writeln(num3);
          writeln(num1);
        end;
      end
      else
      begin
        writeln(num3);  //es seguro que el mas grande es num3
        if (num1 > num2) then  //verifica cual de los dos restantes es el mas grande
        begin
          writeln(num1);
          writeln(num2);
        end
        else
        begin
          writeln(num2);
          writeln(num1);
        end;
      end;
    end;
    readln;
end.

