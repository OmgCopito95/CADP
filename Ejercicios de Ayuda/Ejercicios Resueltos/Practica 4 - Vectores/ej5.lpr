{5) La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más grandes del país.
De cada cliente conoce la fecha de firma del contrato con AWS,
la categoría del monotributo (entre la A y la F), el código de la ciudad dondese encuentran las oficinales (entre 1 y 2400)
y el monto mensual
acordado en el contrato. La información se ingresa ordenada por fecha de firma de contrato
(los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
2) Cantidad de clientes para cada categoría de monotributo
3) Código de las 10 ciudades con mayor cantidad de clientes
4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program ej5;
const

  dimF_cat = 'F';
  dimF_max = 10;
  dimF_ciu = 2400;
  dimF_cli = 500;
  dimF_meses = 12;
type

  rango_cat = 'A'..dimF_cat;
  rango_ciu = 1..dimF_ciu;

  v_categorias = array ['A'..dimF_cat] of integer; //para contar la cant de clientes para cada categoria de monotributo

  r_maximo = record
    codigo: integer;
    max: integer;
  end;

  v_maximos = array [1..dimF_max] of r_maximo; //un vector para calcular 10 maximos

  v_meses = array [1..dimF_meses] of integer; //para contar cant de contratos por mes

  v_ciudades = array [1..dimF_ciu] of integer; //vector para contar la cantidad de clientes por ciudad

  r_fecha = record
    mes: integer;
    anio: integer;
  end;

  r_cliente = record
    categoria: rango_cat;
    codigo_ciudad: rango_ciu;
    monto_mensual: real;
    fecha: r_fecha;
  end;

  v_clientes = array [1..dimF_cli] of r_cliente; // vector que guarda los clientes

procedure leerCliente(var c:r_cliente);
begin
  with c do begin
    readln(categoria);
    readln(codigo_ciudad);
    readln(monto_mensual);
    with fecha do begin
      readln(mes);
      readln(anio);
    end;
  end;
end;

procedure cargarVectorClientes(var v:v_clientes);
var
  i: integer;
  c: r_cliente;
begin
  for i:=1 to dimF_cli do begin
    leerCliente(c);
    v[i]:= c;
  end;
end;

procedure inicializarVectorMeses(var v:v_meses);
var
  i:integer;
begin

  for i:=1 to dimF_meses do begin
    v[i] := 0;
  end;

end;

procedure inicializarVectorMaximos(var v:v_maximos);
var
  i:integer;
begin

  for i:=1 to dimF_max do begin
    v[i].max := -1;
  end;

end;

procedure inicializarVectorCiudades(var v:v_ciudades);
var
  i:integer;
begin

  for  i:=1 to dimF_ciu do begin
    v[i] := 0;
  end;

end;

procedure inicializarVectorCategorias(var v:v_categorias);
var
  i:integer;
begin

  for i:='A' to dimF_cat do begin
    v[i] := 0;
  end;

end;

procedure imprimirVectorCategorias(v:v_categorias);
var
  i:integer;
begin

  for(i:='A' to dimF_cat)do begin
    writeln('para la categoria ',i,'hay',v[i],' clientes.');
  end;

end;

function calcularMontoPromedio(v:v_clientes):real;
var
  i:integer;
begin
  suma:=0;
  for(i:=1 to dimF_cli)do begin
     suma:=suma+v[i].monto_mensual;
  end;
  calcularMontoPromedio:=suma/dimF_cli;
end;

procedure recorrerVectorClientes(v:v_clientes; vmax: v_maximos; vciu: v_ciudades; vmeses: v_meses);
var
  i,actualAnio,cantContratoAnio,cantContratosPorMes,actualMes,cant_clientes_supera_monto:integer;
  monto_promedio:real;
begin

  monto_promedio := calcularMontoPromedio(v);
  i:=1;
  cant_clientes_supera_monto := 0;

  while(i<dimF) do begin

      actualAnio = vc[i].fecha.anio
      cantContratoAnio:=0;

      while (i<dimF) and (actualAnio=vc[i].fecha.anio)do begin   //procesa cada anio

            actualMes = vc[i].fecha.mes;
            cantContratosPorMes:=0;

            while (i < dimF) and (actualAnio = vc[i].fecha.anio)and (actualMes = vc[i].fecha.mes)do begin   //procesa cada mes

                  //1) Cantidad de contratos por mes
                  cantContratosPorMes := cantContratosPorMes + 1;

                  //2) Cantidad de clientes para cada categoría de monotributo
                  vcat[v[i].categoria] := vcat[v[i].categoria] + 1;

                  vciu[v[i].ciudad] := vciu[v[i].ciudad] + 1; //actualiza vector contador de ciudades para podes calcular los maximos

                  //4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
                  if(v[i].monto_mensual > monto_promedio)then
                      cant_clientes_supera_monto := cant_clientes_supera_monto + 1;

                  i := i + 1;  //leer
            end;
            //cambio de mes

            //1) Cantidad de contratos por anio
            cantContratoAnio := cantContratoAnio + cantContratosPorMes;

            vMeses[actualMes] := vMeses[actualMes] + cantContratosPorMes; //actualiza vector de meses para contar contratos
      end;
      //cambio de anio

      writeln('cant de contratos del anio ',actualAnio,' son:',cantContratoAnio);

  end;

  imprimirVectorMeses(vmeses); //1  FALTA IMPLEMENTAR
  writeln('la cantidad de clientes que superan el monto promedio es de:',cant_clientes_supera_monto); //4
  imprimirVectorCategorias(vcat); //2   FALTA IMPLEMENTAR
  calcular10Maximos(vmax,vciu); //3     FALTA IMPLEMENTAR

end;

var
  vcli: v_clientes;
  vmax: v_maximos;
  vciu: v_ciudades;
  vcat: v_categorias;
  vmeses: v_meses;

begin
  cargarVectorClientes(vcli);

  inicializarVectorMaximos(vmax);
  inicializarVectorMeses(vmeses);
  inicializarVectorCiudades(vciu);
  inicializarVectorCategorias(vcat);

  recorrerVectorClientes(vcli,vmax,vciu,vcat,vmeses);

  imprimirVectorCategorias(vcat);
end.


























