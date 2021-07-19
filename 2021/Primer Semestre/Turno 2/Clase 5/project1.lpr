{12. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
program project1;

function esVocal(car:char):boolean;
begin
    esVocal:=((car1 ='a') or (car1 ='e') or (car1 ='i') or (car1 ='o') or (car1 ='u') or (car1 ='A') or (car1 ='E') or(car1 ='I') or(car1 ='O') or (car1 ='U'));
end;

procedure cumpleA (var cumple:boolean); //verifico si se cumple la secuencia de A -solo vocales-
var
    c:char;
begin
    writeln ('Ingrese la primer secuencia de caracteres:');
    readln(c);
    while ((car <>'$') and (cumple)) do begin                   //mientras no llegue al final de la secuencia y cumple siga en true
        if (not esVocal(c)) then                                           //si no es vocal cambio el valor de cumple a false
            cumple:=false                                                       //asi cambio el valor del while y evito seguir procesando
        else
          readln(c);                                                                  // si era una vocal sigo leyendo...
    end;
end;

function(car:char):boolean; {aiura supongo que podría usar un caso o los signos de < y > para establecer el rango y comparar con el esVocal}
begin
    if (not esVocal(car))
end;

procedure cumpleB(var cumple:boolean);
var
    c:char;
begin
    writeln ('Ingrese la segunda secuencia de caracteres:');
    readln(c);
    while ((car<>'#') and (cumple)) do begin
        if (esVocal(c)) then
            cumple:=false
        else
          readln(c);
    end;
end;
var
    car:char;
    cumple:boolean;
begin
    cumple:=true;
    cumpleA(cumple);
    if cumple then begin                                      //entonces se cumplió A porque cumple sigue en true
        cumpleB(cumple)                                                     //bueno acá necesito resolver el tema de las consonantes...
        if (cumple) then                                                            //se cumplió la secuencia de B porque cumple sigue en true
            writeln('¡Se cumplió la secuencia!')
        else
          writeln('¡NO se cumplió la secuencia B!');
    end
    else writeln('¡NO se cumplió la secuencia A!');
end.










program ..
var
    //variables globales (NO)
procedure p;
var
    //variables locales al procedimiento
begin
    a:=1;
end;

var //variables locales al programa principal
    A:integer;
begin
    p(A);
end.






program alcanceYFunciones;
var
   suma, cant : integer;    //VARIABLES GLOBALES

function calcularPromedio : real
var
   prom : real; //VARIABLE LOCAL DE LA FUNCION
begin
    if (cant <= 0) then
      calcularPromedio := -1
    else
      calcularPromedio := suma / cant;

end;
var
   prom:real;
begin { programa principal }
   readln(suma);
   readln(cant);
   prom := calcularPromedio; // me guardo el valor que retorna la funcion

   if ( prom <> -1) then begin
      //cant := 0;
      writeln(‘El promedio es: ’ , prom)
   end
   else
     writeln(‘Dividir por cero no parece ser una buena idea’);
end.











program anidamientos;

procedure leer;
var
 letra : char;

 function analizarLetra : boolean
 begin     70      97
    if (letra >= 'a') and (letra <= 'z') then
      analizarLetra := true;
    else    70        65               90
      if (letra >= 'A') and (letra <= 'Z') then
        analizarletra := false;
 end; { fin de la funcion analizarLetra }

begin
  readln(letra);
  if (analizarLetra) then
     writeln('Se trata de una minúscula')
  else
    writeln('Se trata de una mayúscula');
end; { fin del procedure leer}


var
   ok : boolean;
begin { programa principal }
   leer;
   //ok := analizarLetra;  //tira error porque la funcion esta declarada en el procedure
   //if ok then
     //writeln(‘Gracias, vuelva prontosss’);
end.









         procedure imprimir(var dni: integer);
         begin
           writeln(dni)
         end;










           {4. El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en qué
línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.}


program programadores;
procedure leerDatos(var legajo: integer; var salario : real); //los parametros están al reves de la invocación, puede ser tmb que no se lea por ref?
begin
    writeln('Ingrese el nro de legajo y el salario');
    read(legajo);
    read(salario);
end;
procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer; var maxSalario:real);
begin

    if (nuevoLegajo > maxLegajo) then begin
        maxLegajo:= nuevoLegajo;
        maxSalario := nuevoSalario //falta el ;
    end;
end;


var
    legajo, maxLegajo, i : integer;
    salario, maxSalario, sumaSalarios : real;
begin
    sumaSalarios := 0; //FALTA INICIALIZAR maxSalario (dónde debiera hacerse, acá o en el módulo?)
     maxLegajo:=-1;
     maxSalario:=-1;
    for i := 1 to 130 do begin
        leerDatos(salario, legajo);
        actualizarMaximo(legajo, salario, maxLegajo,maxSalario);
        sumaSalarios := sumaSalarios + salario;//esto debiera estar en el proceso de lectura
    end;
    writeln('En todo el mes se gastan', sumaSalarios, 'pesos' );
    writeln('El salario del empleado más nuevo es',maxSalario);
end.




    PARAMETROS POR REFERENCIA (VAR) -> los uso cuando quiero modificar los valores (apunta a la variable)
    PARAMETROS POR VALOR -> los uso cuando quiero usar esos valores sin modificarlos (copia)







   procedure cumpleA (var cumple:true; var cantCaracteres:integer)

   procedure cumpleB(var cumple:true; cantCaracteres:integer);






