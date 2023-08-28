program calcularUnMaximo;

var
  max: integer;  //GUARDA EL MAXIMO CALCULADO
  num,i: integer;
begin

  //1) SE INICIALIZA EL MAXIMO EN UN NUMERO MUY CHICO
  max:=-1;

  //calcular un maximo entre 10 numeros
  for i:=1 to 10 do begin
    writeln('Ingrese un numero');
    readln(num);

    if(num > max) then  //2) COMPARO EL NUMERO CON EL MAXIMO
       max:=num;

  end;

  writeln('El numero mas grande es: ',max);

  readln;
end.
