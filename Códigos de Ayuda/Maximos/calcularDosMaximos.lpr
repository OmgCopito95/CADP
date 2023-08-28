program calcularDosMaximos;

var
  max1,max2: integer;  //GUARDAN LOS DOS MAXIMOS CALCULADOS
  num,i: integer;
begin

  //SE INICIALIZAN LOS MAXIMOS EN NUMEROS MUY CHICOS
  max1:=-1;
  max2:=-1;

  //calcular dos maximos entre 10 numeros
  for i:=1 to 10 do begin
    writeln('Ingrese un numero');
    readln(num);

    if(num > max1) then begin       //PRIMERO SE COMPARA CON MAX1
      max2:=max1;
      max1:=num
    end
    else
        if (num > max2) then        //EN UN ELSE SE COMPARA CON MAX2
           max2:=num;
  end;

  writeln('El numero mas grande es: ',max1);
  writeln('El segundo numero mas grande es: ',max2);

  readln;
end.

