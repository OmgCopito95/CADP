// EJERCICIO 4 PRACTICA 0

{
Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la
fórmula D*PI (o también PI*R*2)
}

program circulo;
const
     pi = 3.1415;
var
   diametro, radio, area, perimetro : real;
begin
     writeln('Ingrese el diámetro del círculo: ');
     readln(diametro);
     radio := diametro / 2;
     writeln('El radio del círculo es: ', radio:4:2);
     area := radio*radio*pi;
     writeln('El área del círculo es: ', area:4:2);
     perimetro := diametro * pi;
     writeln('El perímetro es: ',perimetro:4:2);
     readln;
end.                                  