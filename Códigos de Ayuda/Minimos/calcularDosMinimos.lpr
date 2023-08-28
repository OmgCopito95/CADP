program calcularDosMinimos;

var
  min1,min2: integer;  //GUARDAN LOS DOS MINIMOS CALCULADOS
  num,i: integer;
begin

  //SE INICIALIZAN LOS MINIMOS EN NUMEROS MUY GRANDES
  min1:=999;
  min2:=999;

  //calcular dos minimos entre 10 numeros
  for i:=1 to 10 do begin
    writeln('Ingrese un numero');
    readln(num);

    if(num < min1) then begin       //PRIMERO SE COMPARA CON MIN1
      min2:=min1;
      min1:=num
    end
    else
        if (num < min2) then        //EN UN ELSE SE COMPARA CON MIN2
           min2:=num;
  end;

  writeln('El numero mas chico es: ',min1);
  writeln('El segundo numero mas chico es: ',min2);

  readln;
end.
