{
Implementar un programa que lea una secuencia de caracteres que termina en punto. 
Se debe informar la cantidad de veces que aparece cada letra minúscula en la secuencia.

}

Program ejer2;
type vector = array ['a'..'z'] of integer;



procedure ProcesarSecuencia (var v: vector);

 procedure InicializarVector (var v: vector);
 var i: char;
 begin
   for i:= 'a' to 'z' do
     v[i] := 0;
 end;
 
var car: char;
begin
  InicializarVector (v);
  write ('Ingrese caracter: '); readln (car);
  while (car <> '.') do
  begin
    if (car >= 'a') and (car <= 'z')
    then v [car] := v [car] + 1;
    write ('Ingrese caracter: '); readln (car);
  end;
end;

procedure Informar (v: vector);
var i: char;
begin
   writeln;
   for i:= 'a' to 'z' do
      writeln ('Cantidad de ', i, ': ', v[i]);
end;
  
var v: vector;

begin
  ProcesarSecuencia (v);
  Informar (v);
end.



