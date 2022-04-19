{Una empresa administra la información de sus empleados y necesita disponer de un programa modularizado que:

A) Lea y almacene la información de los empleados. De cada empleado se conoce: DNI, apellido, nombre,
categoría (A, B, C, D o E), sueldo básico, montos de los premios obtenidos en el mes (como máximo 5)(hasta que se llene el vector
o hasta que se ingresa el monto -1) y
fecha de ingreso a la empresa. La lectura de la información se lee ordenada por DNI (de menor a mayor) y
finaliza cuando se lee el DNI -1 (que no debe procesarse). La información debe quedar ordenada por DNI (de menor a mayor).

B) Una vez leída y almacenada la información:

a. Obtener una lista de “Liquidaciones” con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se calcula
de la siguiente manera:

- EMPLEADO Categoría A, B o C ? Sueldo básico + premios.

- EMPLEADO Categoría D, E ? Se adiciona, al sueldo básico + premios, 1000 pesos por cada año de trabajo en la empresa.
(CONSIDERO ACTUAL EL AÑO 2021)

b. Informar para cada categoría la cantidad de empleados.

c. Eliminar de la lista de “Liquidaciones” el empleado con un DNI que se lee de teclado, de ser posible.   }


program ejercicio_parcial_viejo;
const
    dimF = 5;
type
    rangoMontos = 1..dimF;
    vec_Montos = array [rangoMontos] of real;
    rangoCat ='A'..'E';
    cadena20=string[20];

    empleado = record
        dni:integer;
        apellido:cadena20;
        nombre:cadena20;
        cat:rangoCat;
        sueldoBas:real;
        montosPremios: vec_Montos;
        dimL:integer;
        fechaIng:cadena20;
    end;

    //LISTA PARA PUNTO A
    lista= ^nodo;
    nodo = record
        dato:empleado;
        sig:lista;
    end;


    liquidaciones = record
        dniEmp:integer;
        sueldoMensual:real;
    end;

    //LISTA PARA EL PUNTO B
    listaLiq= ^nodo1;
    nodo1 = record
        dato:liquidaciones;
        sig:listaLiq;
    end;

    vector_contador = array[rangoCat] of integer;

procedure leerEmpleado (var emp:empleado);
var
    i:integer; v:vec_Montos;
begin
    with emp do begin;
        readln(dni);
        if (dni <> -1) then begin
            readln(apellido);
            readln(nombre);
            readln(cat);
            readln(sueldoBas);
            readln(fechaIngreso);
            dimL:=0;//DIML DEL VECTOR DE PREMIOS DEL EMPLEADO

            read(monto); //leo un monto de los premios
                  //no se llene el vector y no llegue el corte de control
            while (dimL<dimF) and (monto<>-1) do begin //CARGO EL VECTOR DE PREMIOS DE UN EMPLEADO
               diml:=diml+1; //aumento diml porque sino se rompe porque lo puse en 0
               v[diml]:=monto; //guardo el monto en el vector
               readln(monto);
            end;
            montosPremios:=v; //GUARDA EL VECTOR DE PREMIOS EN EL REGISTRO DEL EMPLEADO


            {read(monto);
            while (dimL<dimF) and (monto<>-1) do begin //CARGO EL VECTOR DE PREMIOS DE UN EMPLEADO
               diml:=diml+1; //aumento diml porque sino se rompe porque lo puse en 0
               montosPremios[diml]:=monto; //guardo el monto en el vector directamente en el registro
               readln(monto);
            end;}

        end;
    end;
end;
procedure cargarLista (var l:lista; var ult:lista);
var
    emp:empleado;
begin
    leerEmpleado(emp);
    while (emp.dni <> -1) do begin
        agregarAtras(l,ult,emp); //porque ya viene ordenada de menor a mayor por dni
        leerEmpleado(emp);
    end;
end;

function recorrerVectorPremios(v:vec_Montos; diml:integer): real;
var
    i:integer;
    suma:real;
begin
    suma:=0;
    for i:=1 to dimL do begin
        suma:= suma + v[i];
    end;
    recorrerVectorPremios:=suma;
end;

function calcularAnio(anioIng:integer):integer;
begin
     calcularAnio:=(2021-anioIng)*1000;
end;

procedure recorrerLista(l:lista; var listaLiquidaciones:listaLiq; var vc: vector_contador);
var
    saldoMensual:real;
    liquidacion: liquidaciones;
begin

    while(l<>nil)do begin

        // -------------------------- PUNTO A -----------------------------------------
        saldoMensual:=0; //pongo en cero el saldo mensual del empleado

        {saldoMensual:=l^.dato.suledoBas + recorrerVectorPremios(l^.dato.montosPremios,l^.dato.dimL);
        if(l^.dato.rangoCat = 'D') or (l^.dato.rangoCat = 'E')then
           saldoMensual:=saldoMensual+calcularAnio(l^.dato.fechaIng); }


       //a. Obtener una lista de “Liquidaciones” con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se calcula
       //- EMPLEADO Categoría A, B o C ? Sueldo básico + premios.
       if(l^.dato.rangoCat = 'A') or (l^.dato.rangoCat = 'B') or (l^.dato.rangoCat = 'C')then //if(l^.dato.rangoCat >= 'A') and (l^.dato.rangoCat <= 'C')
         saldoMensual:=l^.dato.suledoBas + recorrerVectorPremios(l^.dato.montosPremios,l^.dato.dimL);
       else
          //- EMPLEADO Categoría D, E ? Se adiciona, al sueldo básico + premios, 1000 pesos por cada año de trabajo en la empresa.
          //(CONSIDERO ACTUAL EL AÑO 2021)

          saldoMensual:= l^.dato.suledoBas + recorrerVectorPremios(l^.dato.montosPremios,l^.dato.dimL) + calcularAnio(l^.dato.fechaIng);

       liquidacion.dniEmp:=l^.dato.dni;       //GENERA EL NUEVO REGISTRO PARA GUARDARLO EN LA LISTA DE LIQUIDACIONES
       liquidacion.sueldoMensual:=saldoMensual;

       agregarAdelante(listaLiquidaciones,liquidacion); //AGREGA LA LIQUIDACION DEL EMPLEADO EN LA LISTA NUEVA

       // ----------------------------------------------------------------------------

       // -------------------------- PUNTO B -----------------------------------------
       //b. Informar para cada categoría la cantidad de empleados.
       vc[l^.dato.rangoCat]:= vc[l^.dato.rangoCat]+1;

       l:=l^.sig;
    end;
    informarVectorContador(vc); //INFORMO LA CANTIDAD DE EMPLEADOS POR CATEGORIA

end;



var
    l,ult:lista;
    listaLiquidaciones: listaLiq;
    vc:vector_contador;
begin
    l:=nil;
    ult:=nil;
    listaLiquidaciones:=nil;
    cargarLista(l,ult); //A
    inicializarVectorContador(vc); //PONE TODO EN CERO EL VECTOR
    recorrerLista(l,listaLiquidaciones,vc);
    readln(dni);
    borrarDni(listaLiquidaciones,dni);
end.










