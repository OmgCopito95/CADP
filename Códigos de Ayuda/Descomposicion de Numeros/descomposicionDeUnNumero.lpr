program descomposicionDeUnNumero;
var
  num,copia,digito:integer;

begin

  writeln('Ingresar numero a descomponer');
  readln(num);
  copia:=num; //hago una copia asi no se pierde el original

  // DIV -> SE QUEDA CON EL RESULTADO DE UNA DIVISION ENTERA
  // MOD -> SE QUEDA CON EL RESTO DE UNA DIVISION ENTERA

  while(copia > 0) do begin

    digito:=copia MOD 10; //SE QUEDA CON EL ULTIMO DIGITO

    if (digito MOD 2 = 0) then
       writeln('El digito: ',digito,' es par.')
    else
       writeln('El digito: ',digito,' es impar.');

    copia:=copia DIV 10; //ACHICA AL NUMERO HASTA QUE SEA 0

  end;

  readln;
end.

