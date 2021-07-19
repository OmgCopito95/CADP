// ------------------------------- EJERCICIO DE AUTOEVALUACION ------------------------------------------

Teniendo en cuenta el siguiente código que contabiliza la cantidad de repeticiones de cada letra minúscula almacenada en el arreglo v2:

program repeticiones;
type
  rango='a'..'z';
  vector1=array['a'..'z'] of integer;
  vector2=array[1..500] of char;


procedure cargarVector(var v:vector2; var dimL:integer);
begin
{ carga el vector v y retorna su dimensión lógica dimL }
end;
var
   v1:vector1;
   v2:vector2;
   dimL,i:integer;
begin
    cargarVector(v2,dimL); //->CARGO CARACTERES
    for i:=1 to 500 do
       v2[v1[i]]:= v2[v1[i]]+1;  {1}
    end;
    for a:='a' to 'z' do
    begin
      Writeln('se encontraron ',v1[a],' repeticiones de la letra ', a );  {2}
    end;
end.


El programa no funciona porque no se está inicializando la variable v2.  v?

Para inicializar la variable v1 es necesario utilizar el procedure cargarVector. f

El programa no funciona ya que la asignación {1} está intentando sumar un caracter con un entero. v

EL programa no funciona porque el primer for no tiene en cuenta la dimensión lógica de v2.   v

El programa no funciona porque no se está inicializando la variable v1. v

El programa no funciona,  se debe reemplazar la asignación {1} por v1[v2[i]]:= v1[v2[i]]+1;   v

La línea {2} no es correcta.  f

Está mal declarado el tipo vector2, no es necesario que sea de char, debe ser solo de caracteres entre la 'a' y la 'z'.   v


// --------------------------------------------------------------------------------------------------------------------------


//EJERCICIO 5 PRACTICA 4 PARTE 2
 // EN LA CARPETA DE EjerciciosDeAyuda/EjerciciosResueltos está mas o menos la estructura de cómo seria el programa. faltan implementar algunas cosas



                   calcularMontoPromedio(vc,montoPromedio);

                   i:=1;
                   while(i<dimF)       //while afuera

                        actualAnio = vc[i].fecha.anio
                        cantContratoAnio:=0;

                        while (i<dimF) and (actualAnio=vc[i].fecha.anio)do begin   //procesa cada anio

                              actualMes = vc[i].fecha.mes;
                              cantContratosPorMes:=0;
                              while (i<dimF) and (actualAnio=vc[i].fecha.anio)and (actualMes = vc[i].fecha.mes)do begin   //procesa cada mes
                                 cantContratosPorMes:=cantContratosPorMes+1;

                                 //sumar 1 a la posicion del vector contador de categoria

                                 if(montoDelCliente > montoPromedio)
                                   cuento

                                 i:=i+1;  //leer
                              end;
                              //ya cambio de mes
                              cantContratoAnio:=cantContratoAnio+cantContratosPorMes; //cuenta cant contratos x anio
                              vMeses[actualMes]:=vMeses[actualMes]+cantContratosPorMes;
                        end;
                        //cambio de anio
                        writeln('cant de contratos del anio son:',cantContratoAnio);

                   end;


                   imprimirVectorMeses(vMeses);
                   imprimirVectorDeCategorias(vCategorias);



//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------

PUNTEROS

   variable que guarda una direccion a memoria dinamica(heap)
   tipo de dato simple. (lo puede devolver una funcion)
   ^ -> para acceder a lo que apunta el puntero
   p:=q -> apuntan a lo mismo (tienen la misma dir de memoria)
   el puntero es definido por el usuario/lenguaje -> type
   4 bytes en memoria estatica
   dependiendo lo que apunte el puntero, es cuánto ocupa en memoria dinamica

   p:=nil; --> "inicializa"
   new(p); --> reserva lugar en memoria dinamica
   dispose(p); --> libera espacio de memoria dinamica apuntado por el puntero












