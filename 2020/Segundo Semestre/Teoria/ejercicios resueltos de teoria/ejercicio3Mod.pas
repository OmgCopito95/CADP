{
Realizar un programa que lea una secuencia de caracteres finalizada en ".". 
Determinar si la secuencia cumple con el patrón A@B (en caso de no cumplir, informar qué parte del patrón 
no se cumplió). 
- @ seguro existe.
- A es una secuencia de caracteres en donde no aparecen los caracteres “+” y “-”.
- B es una secuencia de caracteres que posee la misma cantidad de letras ‘a’ y ‘e’ que aparecen en A.
Modularizar su solución.
}

program ejercicio3;

procedure patronA (var cantA, cantE: integer; var cumple: boolean);
var car: char;
begin
  cantA:= 0;
  cantE:= 0;
  cumple:= true;
  read (car);
  while (car<>'@') and (cumple) do
  begin
    if (car = '+') or (car = '-') 
    then cumple:= false
    else begin
          if (car = 'a') then cantA:= cantA + 1
                         else if (car = 'e')
                              then cantE:= cantE + 1;
          read (car);
         end;
  end;
end;
     
    
function patronB (cantA, cantE: integer): boolean;
var car: char;
begin
  read (car);
  while (car <> '.') and (cantA >= 0) and (cantE >= 0) do
  begin
    if (car = 'a') then cantA:= cantA - 1
                   else if (car = 'e')
                        then cantE:= cantE - 1;
    read (car);
  end;
  patronB:= (cantA=0) and (cantE=0);
end;

var cantA, cantE: integer;
    cumple: boolean;
begin
  patronA (cantA, cantE, cumple);
  If cumple
  then begin
         cumple:= patronB (cantA, cantE);
         If cumple then writeln ('La secuencia cumple con el patron')
                   else writeln ('La secuencia no cumple con la parte B')
       end
  else writeln ('La secuencia no cumple con la parte A')
end.
