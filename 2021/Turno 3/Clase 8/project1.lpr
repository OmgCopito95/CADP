{program Hello;
type
 fecha = record
   dia:integer;
   mes:integer;
   anio:integer;
 end;

 articulo = record
  codigo: integer;
  descripcion: string[20];
  precio: integer;
  fecha_fabri: fecha;
  edadrec: integer;
 end;




procedure leer_fecha(var f:fecha);
begin
  with f do begin
  writeln('Introducir dia de fabricacion');
  readln(dia);
  if(dia<>0)then begin
    writeln('Introducir mes de fabricacion');
    readln(mes);
    writeln('Introducir anio de fabricacion');
    readln(anio);
  end;
end;

end;

Procedure leer_juguetes (var juguete: articulo);
begin
  writeln('Introducir codigo del producto');
  readln(juguete.codigo);
  writeln('Introducir descripcion del juguete');
  readln(juguete.descripcion);
  writeln('Introducir precio del juguete');
  readln(juguete.precio);
  writeln('Introducir edad recomendada del juguete');
  readln(juguete.edadrec);
  leer_fecha(juguete.fecha_fabri);
end;
var
juguete:articulo;
a:fecha;
begin
 leer_juguetes(juguete);

 with juguete do begin
   writeln('El codigo del juguete es: ',codigo);
   writeln('La descripcion del juguete es: ',descripcion);
   writeln('El precio del juguete es: ',precio,' pesos');
   a:=jueguete.fecha_fabri;
   with a do begin
     writeln('Dia de la creacion del juguete: ',dia);
     writeln('Mes de la creacion del juguete: ',mes);
     writeln('Anio de la creacion del juguete: ',anio);
   end;
   writeln('Edad recomendada para usar el juguete es de: ',edadrec,' anios');
 end;
 readln();
end.
}

  {

    REGISTROS

       - EN EL TYPE
       - TIPO DE DATOS DEFINIDOS POR EL USUARIO
       - TIPO DE DATO COMPUESTO -> UNA FUNCION NO DEVUELVE UN REGISTRO COMPLETO
       -

    alumno = record
      nombre:string;
      apellido: string;
      edad: integer;              :)
    end;

    var
       afdafrgverg:alumno;
       a,b:alumno;
    begin
      read(a); //NO. SOLO SE LEE CAMPO POR CAMPO
      writeln(a); //NO. CAMPO POR CAMPO

      a.nombre := 'juanito'
      read(afdafrgverg.nombre);
      read(afdafrgverg.apellido);
      read(afdafrgverg.edad);

      with afdafrgverg do begin
         read(nombre);
         read(apellido);
      end;

      a:=afdafrgverg;

       a   :=   afdafrgverg.nombre;
      reg               string

       a.nombre :=   afdafrgverg.nombre;
         string              string



      procedure leerRegistro(var a:alumno);
      begin

         with a do begin
            read(nombre);
            read(apellido);
         end;


      end;

    }

{
 program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
begin
writeln('Ingrese el código del alumno');
readln(alu.codigo);
if (alu.codigo <> 0) then begin
writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
writeln('Ingrese el promedio del alumno'); readln(alu.promedio);
end;
end;
var
  a:alumno;
begin
  leer(a);
  writeln(a.nombre);
  readln;
end.

  }
      {

 {Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}
program Hello;
type
    cadena30 = string[30];
    auto = record
        marca: cadena30;
        modelo: cadena30;
        precio: real;
    end;
procedure masCaro(marcaAct, modeloAct:cadena30; precioAct:real; var precioCaro: real; var marcaCara,modeloCaro:cadena30);
begin
    if (precioAct > precioCaro) then begin
        precioCaro:= precioAct;
        marcaCara:=marcaAct;
        modeloCaro:=modeloCaro;
    end;
end;
procedure leerAuto(var a:auto);
begin
    writeln('MARCA:');
    readln(a.marca);
    if (a.marca <> 'ZZZ') then begin
        writeln('MODELO:');
        readln(a.modelo);
        writeln('PRECIO');
        readln(a.precio);
    end;
end;
var
    a:auto;
    cantAutos:integer;
    marcaActual,modeloCaro,marcaCara:cadena30;
    sumaPrecios,precioProm,precioCaro:real;
begin
    leerAuto(a);
    precioCaro:=-1;
    while (a.marca <> 'ZZZ') do begin begin // condición de lectura
        marcaActual:= a.marca; // asigno la MARCA ACTUAL
        cantAutos:=0; //inicializo la variable que suma la cantidad de autos para la marca actual
        sumaPrecios:=0; //inicializo la variable que suma los precios para la marca actual
        precioProm:=0; //inicializo la variable de promedio para la marca actual
            while (a.marca <> 'ZZZ') and (marcaActual = a.marca) do begin //
                cantAutos:=cantAutos+1; //ingreso un auto
                sumaPrecios:=sumaPrecios+a.precio; //agrego su precio
                precioProm:= sumaPrecios / cantAutos;
                leerAuto(a);
            end;
        masCaro(a.marca,a.modelo,a.precio,precioCaro,marcaCara,modeloCaro);
        writeln('El precio promedio de la marca', a.marca,'es: $ ',precioProm);
        writeln(' Marca y modelo del auto más caro: ', marcaCara,' ' ,modeloCaro);
    end;
end.
     }
    {

  {2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses
de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha}
program Hello;
type
    subrangodia = 1..31; //puedo poner el subrango sin declararlo...? o sea al lado
    subrangomes = 1..12;
    subrangoanio= 2019..2020;

    fecha = record
        dia:subrangodia;                  fec.mes
        mes:subrangomes;
        anio:subrangoanio;
    end;

procedure leerFecha (var f:fecha);
begin
    writeln('Ingrese el anio de casamiento:');
    readln(f.anio);
    if (f.anio <> 2020) then begin
        writeln('Ingrese el día del casamiento:');
        readln(f.dia);
        writeln('Ingrese el mes de casamiento:');
        readln(f.mes);
    end;
end;

function mesVerano(m:subrangomes):boolean;
begin
    mesVerano:=(m = 1 ) or (m = 2 ) or (m = 3);
end;

function diasMes(d:subrangodias):boolean;
begin
    diasMes:=(fec.dia >= 1) and (fec.dia <= 10);
end;

var
    fec:fecha;
    casamientoVerano,primerosDiez:integer;
begin
    casamientoVerano:= 0;
    primerosDiez:= 0;
    leerFecha(fec);
    while (fec.anio <> 2020) do begin

        if ( mesVerano(fec.mes) ) then
            casamientoVerano:= casamientoVerano+1;

        if (diasMes(fec.dias)) then                                 //revisar acá
            primerosDiez:=primerosDiez+1;

        leerFecha(fec);
    end;
    writeln('Cantidad de casamientos realizados durante los meses de verano: ', casamientoVerano);
    writeln('Cantidad de casamientos realizados en los primeros 10 días de cada mes:', primerosDiez);
end.



  }


  {



 {4-Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}
program Hello;
const
    cantCli = 3; // 9300 uso 3 para probar
    precioMin = 3.40;
    precioMB = 13.35;
type
    linea = record
        numTel:integer;
        cantMinCons:real;
        cantMBcons:real;
    end;

    cliente = record
        cod:integer;
        cantLineas:integer;
        infolinea:linea;
    end;
procedure leerLinea(var l:linea);
begin
    writeln('NUMERO DE TELEFONO:');
    readln(l.numTel);
    writeln('MINUTOS CONSUMIDOS:');
    readln(l.cantMinCons);
    writeln('MB CONSUMIDOS:');
    readln(l.cantMBcons);
end;
procedure procesarCliente (var c:cliente; var totalMinutos,totalMB:real);
var li:linea;
begin
    totalMinutos:=0;
    totalMB:=0;
    writeln('CODIGO DEL CLIENTE:');
    readln(c.cod);
    writeln('CANTIDAD DE LINEAS:');
    readln(c.cantLineas);
    leerLinea(li);
    totalMinutos:= totalMinutos * precioMin;
    totalMB:= totalMB * precioMB;
end;

var
    cli:cliente;
    i:integer;
    totalMinutos,totalMB, montoFactura: real;
begin
    montoFactura:=0;
    for i:= 1 to cantCli do begin
        ProcesarCliente (cli,totalMinutos,totalMB);
        montoFactura:= totalMinutos + totalMB;
        writeln('Para el cliente ', i, ' el monto a facturar es: $ ',montoFactura:4:2);
    end;
end.









   program Hello;
const
    relevamiento = 3; //2400 uso 3 para probar
    propUNESCO = 1 / 23.435;  // ~0.04267
type
    cadena50 = string[50];
    establecimiento = record
        cue:integer;
        nom:cadena50;
        cantDoc:integer;
        cantAlu:integer;
        localidad:cadena50;
    end;
procedure escMejorRelacion(cueAct:integer;nombreAct: cadena50; relacion:real; var mejorRelac1,mejorRelac2:real; var cue1,cue2:integer; var nom1,nom2:cadena50);
begin
    if (relacion > mejorRelac1) then begin
        mejorRelac2:=mejorRelac1;
        cue2:=cue1;
        nom2:=nom1;
        mejorRelac1:=relacion;
        cue1:=cueAct;
        nom1:=nombreAct;
    end
    else
    if (relacion> mejorRelac2) then begin
        mejorRelac2:= relacion;
        cue2:=cueAct;
        nom2:=nombreAct;
    end;
end;
function relacDocAlu (cDocentes:integer; cAlumnos:integer):real;
begin
    relacDocAlu:= cDocentes / cAlumnos;
end;
procedure leerEstablecimiento (var e:establecimiento);
begin
    with e do begin
        writeln('CUE:');
        readln(cue);
        writeln('NOMBRE DEL ESTABLECIMIENTO:');
        readln(nom);
        writeln('CANTIDAD DE DOCENTES:');
        readln(cantDoc);
        writeln('CANTIDAD DE ALUMNOS:');
        readln(cantAlu);
        writeln('LOCALIDAD:');
        readln(localidad);
    end;
end;
var
    est: establecimiento;
    i,cantEsc,cue1,cue2: integer;
    relacion, mejorRelac1, mejorRelac2: real;
    nom1,nom2:cadena50;
begin
    cantEsc:=0;
    mejorRelac1:=-1;
    mejorRelac2:=-1;
    for i:=1 to relevamiento do begin
        leerEstablecimiento(est);
        relacion:=relacDocAlu(est.cantDoc,est.cantAlu);

        if (est.localidad = 'La Plata') and (relacion > propUNESCO )then
                cantEsc:=cantEsc+1;

        escMejorRelacion(est.cue, est.nom, relacion, mejorRelac1,mejorRelac2,cue1,cue2,nom1,nom2);
    end;
    writeln('Cantidad de escuelas de La Plata con relación de alumnos por docente superior a la sugerida por UNESCO: ',cantEsc);
    writeln('CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos: ',cue1,'de nombre ',nom1, 'y', cue2, 'de nombre ',nom2);
end.

    }
  {

  {El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la
provincia de Bs. As, con el objetivo de evaluar si se cumple la proporción de alumnos por docente
calculada por la UNESCO para el año 2015 (1 docente cada 23,435 alumnos). Para ello se cuenta con
información de: CUE (código único de establecimiento), nombre del establecimiento, cantidad de
docentes, cantidad de alumnos, localidad. Se pide implementar un programa que procese la
información y determine:
◦ la cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la
sugerida por UNESCO.
◦ el CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos
El programa debe utilizar:
A) Un módulo para la lectura de la información de la escuela.
B) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente
entre la cantidad de alumnos y la cantidad de docentes).}


Program ejer3;
CONST
  UNESCO = 23.435;

TYPE
  str20= string[20];

  r_escuela = record
      CUE: integer;
      nombre: str20;
      docentes: integer;
      alumnos: integer;
      localidad: str20;
  end;


PROCEDURE LEER (VAR e: r_escuela);
Begin
   with e do begin
     writeln('Ingrese el CUE del establecimiento: ');
     readln(CUE);
     writeln('Ingrese el nombre del establecimiento: ');
     readln(nombre);
     writeln('Ingrese la cantidad de docentes: ');
     readln(docentes);
     writeln('Ingrese la cantidad de alumnos: ');
     readln(alumnos);
     writeln('Ingrese la localidad: ');
     readln(localidad);
  end;
end;

FUNCTION PROMEDIO (alu,doc: integer): real;
Begin
   PROMEDIO:= alu/doc;
end;


FUNCTION LAPLATA(localidad:string; relacion:real):integer;         // Promedio superior LA PLATA
Begin
    IF (localidad = 'LA PLATA') and (relacion > UNESCO) then
      LAPLATA:=1
    ELSE
      LAPLATA:=0;
end;


Procedure MINIMOS (relacion: real; c:integer; n: str20; VAR min1,min2: real; VAR cue1,cue2: integer; VAR nom1,nom2: str20);
Begin
   If (relacion < min1) then begin
         min2:= min1;
	 min1:= relacion;
	 cue2:= cue1;
	 cue1:= c;
	 nom2:= nom1;
	 nom1:= n;
   end
   ELSE
      If (relacion < min2) then begin
	    min2:= relacion;
	    cue2:= c;
	    nom2:= n;
      end;
end;


VAR
   escuela: r_escuela;
   i,cant_sup,cue1,cue2: integer;
   relacion,min1,min2: real;
   nom1,nom2: str20;

Begin
  min1:= 99999;
  min2:= 99999;
  cant_sup:= 0;

  FOR i:= 1 to 2400 do begin
     LEER (escuela);
     relacion:= PROMEDIO(escuela.alumnos,escuela.docentes);

     cant_sup := cant_sup + LAPLATA (escuela.localidad,relacion); //cant escuelas relacion sup unesco la plata

     MINIMOS (relacion,escuela.CUE,escuela.nombre,min1,min2,cue1,cue2,nom1,nom2);

     writeln('             ');

  end;

  writeln('cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO: ',cant_sup);
  writeln('el CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos: ',cue1,' / ',nom1,' y ',cue2,' / ',nom2);
  readln();
End.


 }


     {Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}
program project1;
type
    cadena30 = string[30];
    auto = record
        marca: cadena30;
        modelo: cadena30;
        precio: real;
    end;
procedure masCaro(marcaAct, modeloAct:cadena30; precioAct:real; var precioCaro: real; var marcaCara,modeloCaro:cadena30);
begin
    if (precioAct > precioCaro) then begin
        precioCaro:= precioAct;
        marcaCara:=marcaAct;
        modeloCaro:=modeloCaro;
    end;
end;
procedure leerAuto(var a:auto);
begin
    writeln('MARCA:');
    readln(a.marca);
    if (a.marca <> 'ZZZ') then begin
        writeln('MODELO:');
        readln(a.modelo);
        writeln('PRECIO');
        readln(a.precio);
    end;
end;
var
    a:auto;
    cantAutos:integer;
    marcaActual,modeloCaro,marcaCara:cadena30;
    sumaPrecios,precioProm,precioCaro:real;
begin
    leerAuto(a); f
    precioCaro:=-1;

   // CANTAUTOSTOTAL:=0;

    while (a.marca <> 'ZZZ') do begin // UN AUTO DE DIFERENTE MARCA                                           // condición de lectura

        marcaActual:= a.marca;                                                        //1 // asigno la MARCA ACTUAL

        cantAutos:=0;                                                                  //inicializo la variable que suma la cantidad de autos para la marca actual
        sumaPrecios:=0;                                                                             //inicializo la variable que suma los precios para la marca actual
        precioProm:=0;                                                                              //inicializo la variable de promedio para la marca actual

            while (a.marca <> 'ZZZ') and (marcaActual = a.marca) do begin  TODOS LOS AUTOS DE LA MISMA MARCA                                      // 2 -corte de control y comparar el actual con el que proceso
                  //CANTAUTOSTOTAL:=CANTAUTOSTOTAL+1;
                  cantAutos:=cantAutos+1; //ingreso un auto
                sumaPrecios:=sumaPrecios+a.precio; //agrego su precio
                masCaro(a,precioCaro,marcaCara,modeloCaro);
                leerAuto(a);
            end;

         //SALGO DEL WHILE PORQUE CAMBIO LA MARCA
         precioProm:= sumaPrecios / cantAutos;

        writeln('El precio promedio de la marca', marcaActual,'es: $ ',precioProm);


    end;

    //IMPRIMO COSAS DE TODAS LAS MARCAS JUNTAS
    writeln(' Marca y modelo del auto más caro: ', marcaCara,' ' ,modeloCaro);

end.



{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

Program ejer5;
Type
str10= string[10];
r_autos = record
     marca: str10;
	 modelo: str10;
	 precio: real;
end;

Procedure LEER (VAR a: r_autos);
Begin
     with a do begin
	     writeln('Ingrese la marca del auto: ');
		 readln(marca);
         If (marca <> 'ZZZ') then begin
		    writeln('Ingrese el modelo del auto: ');
	        readln(modelo);
            writeln('Ingrese el precio del auto: ');
		    readln(precio);
         end;
	 end;
End;


Procedure IncisoA (VAR auto_marca:integer; VAR precioTotal: real; price:real);
Begin
      auto_marca:= auto_marca + 1;
	  precioTotal:= precioTotal + price;
End;




Procedure MAXIMO (mark: str10; VAR marcaMax:str10; model:str10; VAR modelMax: str10; price: real; VAR max: real);
Begin
     IF (price > max) then begin
	     max:= price;
		 marcaMax:= mark;
		 modelMax:= model
     end;
End;


VAR
 a: r_autos;
 marcaMax,aux,modelMax: str10;
 auto_marca: integer;
 max,promedio,precioTotal: real;
Begin
    max:= -1;
	LEER (a);
	while (a.marca <> 'ZZZ') do begin
         aux:= a.marca;
		 promedio:= 0;
		 auto_marca:= 0;
		 precioTotal:= 0;
		 while (a.marca <> 'ZZZ') AND (a.marca = aux) do begin
		     MAXIMO (a.marca,marcaMax,a.modelo,modelMax,a.precio,max);
			 IncisoA (auto_marca,precioTotal,a.precio);
             writeln('__________ ');
			 LEER(a);
		 end;
		 promedio:= precioTotal/auto_marca;
         writeln('   ');
         writeln('>> El precio promedio de la marca ',aux,' es de: $',promedio:7:2);
         writeln('    ');
	 end;

     writeln('La marca: ',marcaMax,' y el modelo: ',modelMax,' es del auto mas caro');
	 readln();
End.













      BEGIN

              leer(...);
              writeln('asdasd')

              cant:=cantidad(....)
              ...
              ...

      END;


















