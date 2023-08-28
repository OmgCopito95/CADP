program calcularUnMinimo;

var
  min: integer;  //GUARDA EL MINIMO CALCULADO
  num,i: integer;
begin

  //1) SE INICIALIZA EL MINIMO EN UN NUMERO MUY GRANDE
  min:=999;

  //calcular el minimo entre 10 numeros
  for i:=1 to 10 do begin
    writeln('Ingrese un numero');
    readln(num);

    if(num < min)then  //2) COMPARO EL NUMERO CON EL MINIMO
       min:=num;    //3) ACTUALIZO EL MINIMO
  end;

  writeln('El numero mas chico es: ',min);

  readln;
end.

