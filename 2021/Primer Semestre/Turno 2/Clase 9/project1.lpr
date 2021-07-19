
      //zecarlos
{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}


program project1;
type
    dias = 1..31;

    Fecha = record
        dia:dias;
        mes:string[20];
        anio:integer;
    end;
//Procesos
procedure LeerFecha(var f:Fecha);

begin
    writeln('Ingrese el año');
    readln(f.anio);
    if(f.anio <> 2020) and (f.anio = 2019) then begin
        writeln('Ingrese el dia');
        readln(f.dia);
        writeln('Ingrese el mes');
        readln(f.mes);
        writeln('------------------------------------');
    end;
end;


procedure Verano (f: Fecha; var cantMes: integer);
begin
    if(f.mes = 'enero') or (f.mes = 'febrero') or (f.mes = 'marzo') then
        cantMes:= cantMes +1;
end;

procedure PrimerosDias(f:Fecha; var cantDia:integer);
begin
    if(f.dia >= 1) and (f.dia <= 10) then
        cantDia:= cantDia + 1;
end;
//Programa Principal
var
    f:Fecha;
    cantMes:integer;
    cantDia:integer;
begin
    cantMes:= 0;
    cantDia:= 0;
    writeln('Ingrese el año');
    readln(f.anio);
    writeln('------------------------------------');

    while(f.anio <> 2020) and (f.anio = 2019) do begin
        Verano(f,cantMes);
        PrimerosDias(f,cantDia);
        LeerFecha(f);
    end;
    writeln('La cantidad de casamientos en verano fueron de: ', cantMes);
    writeln('La cantidad de casamientos de los primeros 10 dias fueron de: ', cantDia);
end.








         //cecilia
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
    end;


procedure leerLinea(var l:linea);    //a
begin
    writeln('NUMERO DE TELEFONO:');
    readln(l.numTel);
    writeln('MINUTOS CONSUMIDOS:');
    readln(l.cantMinCons);
    writeln('MB CONSUMIDOS:');
    readln(l.cantMBcons);
end;

procedure procesarCliente (var c:cliente; var totalMinutos,totalMB:real);  //b
var li:linea;
begin
    totalMinutos:=0;
    totalMB:=0;

    leerCliente()

    //modularizar leerCliente()------------------
    writeln('CODIGO DEL CLIENTE:'); //leo la info de un cliente
    readln(c.cod);
    writeln('CANTIDAD DE LINEAS:');
    readln(c.cantLineas);
    //------------------------------
                     80
    for(i:=1 to c.cantLineas)do begin  //leo info de todas las lineas del cliente
      leerLinea(li);   //lee una sola linea
      totalMinutos:= totalMinutos + li.cantMinCons; //va sumando la cant de min consumidos entre todas las
                                                    //lineas del cliente
      totalMB:= totalMB + li.cantMBcons; //va sumando los megas de toas las lineas del cliente
    end;
end;

var
    cli:cliente;
    i:integer;
    totalMinutos,totalMB, montoFactura: real;
begin

    for i:= 1 to cantCli do begin //cada iteracion del for es un cliente
        //leerCliente(cli)
        ProcesarCliente (cli,totalMinutos,totalMB); //me devuelve la cant total de min y de mb

        //esto puede ser dos funciones o un procedimiento
        precioTotalMin:=totalMinutos * precioMin; //calcula el precio total por mmin
        precioTotalMB:= totalMB * precioMB; //calcula el precio total por mb

        montoFactura:=precioTotalMin + precioTotalMB; //total que tiene que pagar el cliente

        writeln('Para el cliente ', i, ' el monto a facturar es: $ ',montoFactura:4:2);

    end;
end.







           //8braian
      {
La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}

Program Ejercicio;
type
  str=string[20];
  docente=record
   dni:integer;
   nomape:str;
   email:str;
  end;

  proyecto=record
   cod:integer;
   titulo:str;
   Docent:docente;
   CantAlu:integer;
   NomEsc:str;
   Local:str;
  end;

procedure leer(Var p:proyecto);
begin
 writeln('Ingrese Codigo');
 readln(p.cod);
 if(p.cod <> -1)then begin
  writeln('Ingrese Titutlo');
  readln(p.titulo);
  writeln('Ingrese Dni');
  readln(p.docent.dni);
  writeln('Ingrese Nombre y Apellido');
  readln(p.Docent.nomape);
  writeln('Ingrese Email');
  readln(p.Docent.email);
  writeln('Ingrese Cantidad de Alumnos');
  readln(p.cantalu);
  writeln('Ingrese Nombre de la escuela');
  readln(p.nomesc);
  writeln('Ingrese Localidad');
  readln(p.local);
 end;
end;

procedure SacarMax(  --- cantpart:integer;Var Nom1:str;Var Nom2:str);
var
 Max1,max2:integer;
begin

 If(CantPart > Max1)then begin
  max2:=max1;
  nom2:=nom1;
  max1:=cantpart;
  nom1:=p.NomEsc;
 end
 else
  if(CantPart > Max2)then begin
   max2:=cantpart;
   nom2:=p.NomEsc;
  end;
end;


function Descomponer (cod:integer):boolean;
var
 cantPar,CantImp,dig:integer;
begin
 cantPar:=0;
 cantImp:=0;
 while(cod <> 0)do begin
  dig:=cod mod 10;
  if((dig mod 2)=0)then
   CantPar:=CantPar + 1
  else
   CantImp:=CantImp + 1;
  cod:=cod div 10;
 end;
 Descomponer:= CantPar <> CantImp

end;

var
 p:proyecto;
 ok:boolean;
 cantTot,CantEsc,CantPart:integer;
 LocAct,EscAct,nom1,nom2:str;
begin
  cantTot:=0;
  leer(p);
  Max1:=-99999;
  Max2:=-99999;
  while(p.cod <> -1)do begin
   locAct:=p.Local;
   cantesc:=0;
   while(LocAct=P.local)and(p.cod <> -1)do begin

    cantpart:=0;
    EscAct:=p.NomEsc;

    while(EscAct=P.NomEsc)and(p.cod <> -1)do begin
     cantPart:=Cantpart + p.cantalu;
     if(LocAct='Daireaux')then begin
      if(descomponer(p.cod,ok))then
       writeln('El titulo de la localidad de Daireaux que cumple se llama ',p.titulo);
     end;
    leer(p);
    end;
    SacarMax(EscAct,cantpart,Nom1,Nom2);
    cantEsc:=CantEsc + 1; //por localidad
    CantTot:=canttot + 1; //cant escuelas totals
   end;
   //cambio de localidad
   writeln('La Localidad ',LocAct,' tuvo ',cantEsc,' escuelas convocadas');
  end;
  writeln('Participaron un total de ',canttot,' escuelas en esta convocatoria');
  writeln('El nombre de la escuela con mas alumnos es ',nom1,' y la segunda es ',nom2);
 readln();
end.
















   Procedure MasCaro (a: auto; var Max_Marca, Max_modelo: cadena; var Max_precio: real);
Begin
    leerAuto(a);
    if (a.precio > Max_precio) then begin
         Max_precio:= a.precio;
         Max_marca:= a.Marca;
         Max_modelo:= a.Modelo;
     End;
end;

var
   marcaActual , Max_Marca, Max_modelo: cadena;
   Preciototalxmarca, Max_precio: real;
   A: auto;
   Pre_prom:real;
   Cantautosxmarca: integer;
Begin
   marcaActual:= “ “;
   Max_Marca:= " ";                          auto1: marca a , modelo5
                                             auto2: marca a, modelo10   ->PRECIO PROM

                                             auto3: marca b  -> PRECIO PROM
                                             auto4: marca c

   Max_Modelo:= " ";
   Max_precio:= -1;
   Pre_prom:= 0;
   leerAuto(a);


   while (a.marca <> 'ZZZ') do begin //TODOS LOS AUTOS                     //while principal para el corte de control
          marcaActual:=a.marca;                           //me guardo el actual que estoy analizando


          preciototalxmarca:=0;
          cantautosxmarca:=0;
                                                 C
          while(a.marca <> "ZZZ")and(a.marca=marcaActual)   do begin  //while interno.   //POR MARCA
          //chequea si llegue al corte de control o si llegue a cambiar de marca

               cantautosxmarca:=cantautosxmarca+1; //CANT AUTOS TOTAL POR MARCA
               preciototalxmarca:=preciototalxmarca + a.precio; //SUMO LOS PRECIOS DE LOS AUTOS POR MARCA

               MasCaro(a, Max_Marca, Max_modelo, Max_precio );
               leerAuto(a);
          end;

          //CAMBIE DE MARCA

          Pre_prom:= preciototalxmarca / cantautosxmarca;
          writeLn("precio promedio por marca:", Pre_prom);
    end;

   IMPRIMIR PROMEDIO DE TODOS LOS AUTOS
   --

    writeLn ("la marca y modelo del auto mas caro: ", Max_Marca, Max_modelo; Max_precio);
end.
















 {6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}


program ejercicio6;
type
	str20 = string [20];
	nucleos = 1..32;
	microprocesador = record
		marca:str20;
		linea:str20;
		cantCores:nucleos;
		Ghz:real;
		nanometros:integer;
	end;
//----------------------------------------------------------------------
procedure Leer (var mp:microprocesadores);
begin
	with mp do begin
                write ('La cantidad de cores: ');
		readln (cantCores);
                IF(cantCores <> 0)then begin
		  writeln ('Informacion del microprocesadores:');
		  write ('Marca: ');
		  readln (marca);
		  write ('Linea: ');
		  readln (linea);
		  write ('Velocidad del reloj (medida en Ghz): ');
		  readln (Ghz);
		  write ('Tamaño en nanometros (nm) de los transistores: ');
		  readln (nanometros);
                end;
	end;
end;
//----------------------------------------------------------------------
procedure Mayor2cores (mp:microprocesadores); {Punto 1}
begin
	if ((2 > mp.cantCores) and (22 > mp.nanometros)) then begin
		writeln ('Marca y linea de todos los procesadores de mas de 2 cores con transistores de a lo sumo 22nm: ');
		writeln ('Marca: ', mp.marca);
		writeln ('Linea: ', mp.linea);
		end;
end;
//----------------------------------------------------------------------
procedure DosMarcasMayor14nm (var max1Marca,max2Marca:str20; var max1,max2: integer; marcaActual:str20; cant:integer); {Punto 2 por la ultima vez}
begin

	if (cant > max1) then begin
		max2:= max1;
                max2Marca:=max1Marca;
		max1Marca:= marcaActual;
                max1:= cant
	end
	else if (cant > max2) then begin
	     max2:= cant;
             max2Marca:= marcaActual;
	end;

end;
//----------------------------------------------------------------------
var
	mp:microprocesadores;
	max1, max2:str20;
	cantProcesador:integer;
begin
	max1:= '';
	max2:= '';
	cantProcesador:= 0;
	Leer (mp);

        cantProcesador:=0;

	WHILE (0 < mp.cantCores) then begin //while principal

                marcaActual:=mp.marca; //me guardo la marca actual
                cantMicro:=0;


                //hago while interno               A
                while (mp.cantCores > 0) and (marcaActual = mp.marca) do begin
                 //Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.

                 Mayor2cores (mp); {Punto 1}

                 if (14 = mp.nanometros) then begin
                   cantMicro:=cantMicro+1;
		 end;

                 if ((1 > mp.cantCores) and (2 < mp.Ghz) AMD INTEL) then begin {Punto 3}
		    cantProcesador:=cantProcesador+1;
		 end;

                 leer(mp);
                end;
                //cuando sale del while interno es porque cambio de marca

                //Las dos marcas con mayor cantidad de microprocesadores con transistores de 14 nm.

                DosMarcasMayor14nm (marcaMax1,marcaMax2,max1,max2, marcaActual,cantMicro); {Punto 2}














	end;
	writeln ();
	writeln ('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: ');
	writeln ('Marca 1: ', max1, 'marca 2: ', max2);
	writeln ('Cantidad de procesadores multicore (de mas de un core) de Intel o AMD, cuyos relojes  alcancen velocidades de al menos 2 Ghz: ', cantProcesador);
end.

































