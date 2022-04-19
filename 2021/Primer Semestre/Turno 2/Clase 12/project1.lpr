{10.

Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector.


Una vez finalizada la carga de datos se pide:

a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.


b) Realizar un módulo que imprima el sueldo promedio de los empleados de la empresa. }
{
program ej10;
const
  dimF = 300;
type

  vectorSalarios = array[1..dimF] of real;

procedure imprimir(v:vectorSalarios; diml:integer);
var
   suma:real;
   i:integer;
begin
   suma:=0;
   for (i:= 1 to diml)do
    suma:=suma + v[i];

   writeln('el promedio es:', suma/dimL);

end;

                                //1.15 = 15%
procedure incrementarSalario(var v:vectorSalarios; dimL:integer; x:integer);     //punto A
var
  i:integer;
begin

   for(i:=1 to dimL)do begin
     v[i]:=v[i]*x;
   end;

end;

procedure cargarVector(var v:vectorSalarios; var dimL:integer);
var
  salario:real;
begin
   read(salario);
   while (dimL < dimF) and (salario<>0) do begin
     dimL:=dimL+1;
     v[dimL]:=salario;
     read(salario);
   end;

end;

var
  v:vectorSalarios;
begin
   dimL:=0;
   cargarVector(v,dimL);
   x:=1.15; //15%
   incrementarSalario(v,dimL,x); //punto A
   imprimir(v,dimL); //punto B
end.

}

// ----------------------------------------------------------------

//EJERCICIO 12  - HACER

{Ej. Nº12 Enunciado:
Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes,
para ello cuenta con información sobre todos los viajes realizados durante el mes de marzo.

De cada viaje se cuenta con la siguiente información: el dia del mes (1 a 31), monto de dinero transportado
y la distancia recorrida por el camión (medida en Km)

a)	Realizar un programa que lea y almacene la información de los viajes ( a lo sumo 200 ).
La lectura finaliza cuando se ingresa la distancia recorrida igual a 0 km, que no debe procesarse.

b)	Realizar un modulo que reciba el vector generado en a) e informe:
                 - El monto promedio transportado de los viajes realizados
                 - La distancia recorrida y el dia del mes en que se realizo el viaje que transporto mas dinero.
Nota: para realizar el inciso b, el vector debe recorrer una única vez

c) Realizar un modulo que reciba el vector generado en a) y
elimine todos los viajes cuya distancia recorrida sean igual a 100 km

}

// ------------------------------------------------------------------------------------------

{14- El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}

program project1;
const
    cantProy=1000;
type
    rangoVec= 1..5;
    rangoProy= 1..cantProy;
    cadena20= string[20];

    desarrollador =record
        cod:rangoVec;
        rol:cadena20;
        valor_hora:real;
    end;

    participante = record
        paisRes: cadena20;
        codProy: rangoProy;
        nomProy: cadena20;
        rolCumplido: rangoVec;
        cantHorasTrab: integer;
    end;

    vec_desarrolladores = array [rangoVec] of desarrollador; //vector que se dispone

    info = record
        montoTotal:real;
        cantArquitectos:integer;
    end;

    vectorProyectos = array[rangoProy]of info; //vector de proyectos que solo guarda monto total y cant de arquitectos


function arqSoftware (rol:rangoVec):integer;
begin
    if (rol = 4) then
        arqSoftware:=1
    else
        arqSoftware:=0;
end;


function adminBDHs (rol:rangoVec; horas:integer):integer;
begin
    if (rol = 3) then
        adminBDHs:=horas
    else
        adminBDHs:=0;
end;


function invertidoArg (pais:cadena20; horas:integer; valorHora:real):integer;
begin
    if (pais = 'ARGENTINA') then
        invertidoArg:=horas*valorHora;  //monto del participante
    else
        invertidoArg:=0;  //monto=0;
end;


procedure leerParticipante (var p:participante);
begin
    with p do begin
        writeln('CODIGO DEL PROYECTO:');
        readln(codProy);
        if (codProy <> -1) then begin
            writeln('ROL');
            readln(rolCumplido);
            writeln('HORAS TRABAJADAS');
            readln(cantHorasTrab);
        end;
    end;
end;


var
    vD: vec_desarrolladores;

    totalAdminBD:integer;
    montoTotalArg:real;

    vP:vectorProyectos;
begin

incializarVectorDeProyectos(vp); //poner en cero los dos campos

leerParticipante(p); //leo a juanito
while(p.codProye <> -1)do begin
  //a) El monto total invertido en desarrolladores con residencia en Argentina.
    montoTotalArg:=montoTotalArg + invertidoArg(p.paisRes, p.cantHorasTrab, vD[p.rol].valorHora);

  //b) La cantidad total de horas trabajadas por Administradores de bases de datos.
    totalAdminBD:=totalAdminBD + adminBDHs(p.rol, p.cantHorasTrab);

  //c) El código del proyecto con menor monto invertido.
    vp[p.nroProy].montoTotal:=vp[p.nroProy].montoTotal + p.cantH * vD[p.rol].valorHora;

  //d) La cantidad de Arquitectos de software de cada proyecto.
    vp[p.nroProy].cantArquitectos := vp[p.nroProy].cantArquitectos + arqSoftware;

end;

 minimoEimprimirCantArq(vp,min...) //c y d
 writeln('El monto total invertido en desarrolladores con residencia en Argentina es: $ ',montoTotalArg:6:2);
 writeln('Total de horas trabajadas por Administradores de bases de datos es: ', totalAdminBD);

end.











