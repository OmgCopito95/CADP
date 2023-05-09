{5. La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).

Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
}

program project1;
const
  dimF = 500; //porque son 500 clientes
type
        fecha = record
          dia: 1..31;
          mes: 1..12;
          anio: integer;
        end;

        cliente = record
          fecha: fecha;
          categoria: 'A'..'F';
          cod_ciudad: 1..2400;
          monto: real;
        end;

        vectorClientes = array [1..dimF] of cliente;
        vectorMeses = array [1..12] of integer; //vector contador

procedure leerFecha(var f:fecha);
begin
  readln(f.dia);
  readln(f.mes);
  readln(f.anio);
end;

procedure leerCliente(var c:cliente); //LEE UN CLIENTE Y GUARDA LA INFORMACION EN EL REGISTRO
begin
  leerFecha(c.fecha);
  {readln(c.fecha.dia);
  readln(c.fecha.mes);
  readln(c.fecha.anio);}
  readln(c.categoria);
  readln(c.cod_ciudad);
  readln(c.monto);
end;

procedure cargarVector(var v:vectorClientes);
var
   i:integer;
   c:cliente;
begin

  for i:=1 to dimF do begin //PROCESA 500 CLIENTES
    leerCliente(c); //LEO UN CLIENTE
    v[i]:=c; //GUARDO EL CLIENTE EN EL VECTOR
  end;

end;

procedure recorrerVector(vClientes:vectorClientes; var vMeses: vectorMeses);
var

begin
  //a. Cantidad de contratos por cada mes y cada año
  //ordenada por fecha(los más antiguos primero, los más recientes últimos)
  i:=1;
  while(i<dimF)do begin //verifico si no termine de recorrer el vector clientes

    anio:=vClientes[i].fecha.anio; //me guardo la fecha que uso para comparar
    cantContratosAnio:=0;

    while (i<dimF) and (anio = vClientes[i].fecha.anio) do begin
         //verifico si no termino el vector, si el anio es igual

         indiceMes:= vClientes[i].fecha.mes; //me quedo con el mes de la fecha del cliente
         vMeses[indiceMes] := vMeses[indiceMes] + 1; //sumo un contrato en el mes correspondiente (pensamos el enunciado como dos cosas separadas!)

         cantContratosAnio := cantContratosAnio + 1;

         montoTotal:=montoTotal + vClientes[i].monto; //sumo los montos de los clientes

         i:=i+1; //avanzo en el vector
    end;
    // cambio el anio
    calcularAnioMaximo(max,anio,cantContratosAnio,anioMax); //año en que se firmó la mayor cantidad de contratos

    writeln('para el anio',anio,'hubo',cantContratosAnio,'contratos'); //IMPRIME LA CANT DE CONTRATOS POR ANIO

  end;
  // termino el vector

  //calculo el monto promedio
  promedio:=montoTotal / dimF; //dimF es la cantidad total de clientes 500.

  //imprimo anioMaximo

end;

var //VARIABLES PP
  vClientes: vectorClientes
  vMeses: vectorMeses;
//PROGRAMA PRINCIPAL
begin
  cargarVector(vClientes);
  inicializarVectorMeses(vMeses);

  // b. Cantidad de clientes para cada categoría de monotributo --> vector contador

  recorrerVector(vClientes,vMeses);

  //cantidad de contratos por mes
  imprimirVectorMeses(vMeses); //imprime todo el vector de meses
end.

















