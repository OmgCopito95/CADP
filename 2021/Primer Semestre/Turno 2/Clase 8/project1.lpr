{3. Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
? Los códigos de los dos productos más baratos.
? La cantidad de productos de más de 16 pesos con código par.}
{program ejer3;
const
    productos=5;
type
    subrango=1..200;

//modulos
procedure LeerProductos(var cod: subrango; var precio: real);
begin
    writeln('Ingrese el codigo: ');
    readln(cod);
    writeln('Ingrese el precio: ');
    readln(precio);
end;

procedure MasBaratos(cod: subrango; precio:real; var min1:real; var min2: real; var cod1, cod2: subrango);
begin
    if (precio<min1) then begin
        min2:=min1;
        cod2:=cod1;
        min1:=precio;
        cod1:=cod;
    end
    else
        if (precio < min2) then begin
            min2:=precio;
            cod2:=cod;
        end;
end;

procedure Cant16 (cod:subrango; precio:real; var cant: integer);
begin
    if (precio > 16) and (cod mod 2 =0) then
        cant:=cant+1;
end;

function cant16funcion(cod:subrango; precio:real):integer;
begin
     if (precio > 16) and (cod mod 2 =0) then
        cant16funcion:=1
     else
        cant16funcion:=0;

end;

function cant16funcion(cod:subrango; precio:real):boolean;
begin
    cant16funcion:= (precio > 16) and (cod mod 2 =0)
end;

//pp
var
    cod, cod1, cod2: subrango;
    i,cant: integer;
    precio, min1, min2: real;
begin
    cant:=0;
    min1:=999; min2:=999;
    cod1:=0; cod2:=0;
    for i:=1 to productos do begin
        LeerProductos(cod, precio);
        MasBaratos(cod, precio, min1, min2, cod1, cod2);
        //Cant16(cod, precio, cant);

        //cant := cant + cant16funcion(cod,precio);

        if(cant16funcion(cod,precio)=true)then
           cant:=cant+1;
    end;
    writeln('Los códigos de los dos productos más baratos: ', cod1, ' y ', cod2);
    writeln('La cantidad de productos de más de 16 pesos con código par: ', cant);
end.

  }







Program project1;
function restar(a:integer; b:integer):integer;
begin
  restar:= a-b;
end;
var
  c,d:integer;
begin
  c:=9;
  d:=8;
  writeln (    restar(restar(c,d), restar(d,c))    );
  writeln(c);
  writeln(d);
  readln;
end.




program Registros;
const
  No = 0;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
begin
    writeln('Ingrese el codigo del alumno');
    readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno');
        readln(alu.nombre);
        writeln('Ingrese el promedio del alumno');
        readln(alu.promedio);
    end;
end;

procedure comparar (alu: alumno; m:real; var nom:str20);
begin
    if (alu.promedio>m) then begin
        m:=alu.promedio;
        nom:=alu.nombre;
    end;
end;

var
a : alumno;
contador: integer;
promedio: real;
mejorpromedio: real;
nombre:str20;
begin
  mejorpromedio:= -1;
  contador:=0;
  leer(a);
  while (a.codigo <> 0) do begin
    comparar(a,mejorpromedio,nombre);
    contador:=contador+1;
    leer(a);
  end;
  writeln ('La cantidad de alumnos ingresados es de: ',contador);
  writeln(nombre,' es el alumno con el mejor promedio, el cual e



      const
        pi = 3.14;

      type // los tipos de datos definidos por el usuario

        alumno = record;
           nombre: String
           apellido: String
           edad: integer;
        end;

      var
        aasdasdefwefsdfsdf,b: alumno;
        c:integer;
      begin

        a.nombre:='santiago';

        readln(a.nombre);

        a.apellido := 'el covid nos va a matar a todos, y a lucas';

        writeln(a); //no se puede imprimir un registro entero

        writeln(a.nombre);
        writeln(a.apellido);
        read(a);

        //LEO E IMPRIMO CAMPO POR CAMPO
        c:=10;

        a:=b;
        a:=c;

        a.edad:=c;


        read(aasdasdefwefsdfsdf.nombre);
        read(aasdasdefwefsdfsdf.apellido);

        with aasdasdefwefsdfsdf do begin
          read(nombre)
          read(apellido)
        end;










     

program Registros;

const

No = 0;

type

str20 = string[20];

alumno = record

codigo : integer;

nombre : str20;

promedio : real;

end;

procedure leer(var alu : alumno);

begin

writeln('Ingrese el codigo del alumno');

readln(alu.codigo);

   if (alu.codigo <> 0) then begin

     writeln('Ingrese el nombre del alumno');

     readln(alu.nombre);

     writeln('Ingrese el promedio del alumno');

     readln(alu.promedio);

   end;

end;

procedure comparar (alu: alumno;var m:real; var nom:str20);

begin

     if (alu.promedio > m) then begin

        m:=alu.promedio;

        nom:=alu.nombre;

    end;

end;

var a : alumno; contador: integer;

promedio: real;

mejorpromedio: real; nombre:str20;

begin

mejorpromedio:= -1;

contador:=0;

leer(a);

while (a.codigo <> 0) do begin

   comparar(a,mejorpromedio,nombre);

   contador:=contador+1;

   leer(a);

end;

writeln ('La cantidad de alumnos ingresados es de: ',contador);

writeln(nombre,' es el alumno con el mejor promedio, el cual es ',mejorpromedio);

readln();

end.






 

program ejercicio2;

type
    verano = 1..3;

    fecha = record
          dia: integer;
          mes : integer;
          anio : integer;
    end;

    casamiento = record
       dias : fecha;
    end;

procedure leer(var cas : casamiento);
begin
    writeln('Ingrese el dia de casamiento');
    readln(cas.dias.dia);
    writeln('Ingrese el mes de casamiento');
    readln(cas.dias.mes);
    writeln('Ingrese anio de casamiento');
    readln(cas.dias.anio);
end;
function sienero(c: casamiento):boolean;
var
    enero : integer;
begin
    enero:= 1 ;
    if(c.dias.mes = enero) then
        sienero:= true
    else
    sienero:= false;


end;
function sifebrero(c: casamiento):boolean;
var
    febrero: verano;
begin
    febrero:= 2;
    if(c.dias.mes = febrero) then
        sifebrero:= true
    else
      sifebrero:= false;

end;
function simarzo(c: casamiento):boolean;
var marzo:verano;
begin
    marzo:= 3;
    simarzo:= (c.dias.mes = marzo);
end;
procedure sumar(c : casamiento; var cant_enero : integer; var cant_feb:integer ; var cant_marzo : integer);

begin

    if sienero(c) then
        cant_enero:= cant_enero + 1;
    if sifebrero(c) then
        cant_feb:= cant_feb + 1;
    if simarzo(c) then
        cant_marzo:= cant_marzo + 1;
end;
procedure comparardiezdias(c : casamiento; var cant_enero : integer; var cant_febrero : integer ; var cant_marzo : integer);

begin

    if sienero(c) then
        cant_enero:= cant_enero + 1;
    if sifebrero(c) then
        cant_febrero:= cant_febrero + 1;
    if simarzo(c) then
        cant_marzo:= cant_marzo + 1;
end;

function compararMeses (m:integer):boolean;
begin
   comparar:=(m = 1) or (m = 2 ) or (m = 3 );

end;





procedure comparar(c : casamiento ; var cant_enero : integer ; var cant_febrero : integer ; var cant_marzo : integer; var diadiez1 : integer; var diadiez2 : integer; var diadiez3 : integer);
{
    diadiez1 = enero , diadiez2 = febrero = diadiez3 = marzo
}

begin
  if ( compararMeses(c.dias.mes)) then
        //sumar(c,cant_enero,cant_febrero,cant_marzo);
        cantVeranos:=cantVeranos+1;

  if ( (c.dias.dia >= 1) and(c.dias.dia <= 10) ) then
        //comparardiezdias(c,diadiez1,diadiez2,diadiez3)
        cant:=cant+1;


end;
var

    c : casamiento;
    corte,cant_enero,cant_febrero,cant_marzo,enero,febrero,marzo : integer;
begin
    cant_enero:= 0;
    cant_febrero:= 0;
    cant_marzo:= 0;
    enero:= 0;
    febrero:= 0;
    marzo:= 0;

    leer(c);
    corte := 2020;
    while (c.dias.anio <> corte ) do begin
        // tod el codigo
        comparar(c,cant_enero,cant_febrero,cant_marzo,enero,febrero,marzo);
        leer(c);
    end;
    writeln('La cantidad de casamientos en el mes de enero fue de ', cant_enero);
    writeln('La cantidad de casamientos en el mes de febrero fue de ', cant_febrero);
    writeln('La cantidad de casamientos en el mes de marzo fue de ', cant_marzo);
    writeln('La cantidad de casamientos en los primeros 10 dias de enero fueron ',enero);
    writeln('La cantidad de casamientos en los primeros 10 dias de febrero fueron ',febrero);
    writeln('La cantidad de casamientos en los primeros 10 dias de marzo fueron ',marzo);
    readln();
end.







  function asdasd(a:casamiento):integer;
  begin
       ...
       ...
       asdasd:=cas.dias.mes;



  end;











