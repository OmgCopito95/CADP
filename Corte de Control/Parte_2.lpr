// CORTE DE CONTROL

// TOMEMOS DE EJEMPLO EL EJERCICIO 5 DE LA PRACTICA

Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.


//ESTRUCTURA BASICA DEL CORTE DE CONTROL

     leer(auto);

     while (auto.marca <> 'ZZZ') do begin

        marcaActual := auto.marca

        while ( (auto.marca <> 'ZZZ') AND (marcaActual = auto.marca) ) do begin

          leer(auto);
        end;

     end;

// A PARTIR DE LA ESTRUCTURA BÁSICA, TENEMOS QUE ENTENDER QUE SIGNIFICA CADA UNA DE LAS ITERACIONES DE LOS WHILE


     leer(auto);
     // SECTOR 1- ACA VAN TODAS LAS VARIABLES QUE SE USAN PARA CONTABILIZAR LOS TOTALES ENTRE TODOS LOS DATOS LEIDOS

     while (auto.marca <> 'ZZZ') do begin

        marcaActual := auto.marca
        // SECTOR 2- ACA VAN TODAS LAS VARIABLES QUE SE DEBEN INICIALIZAR CUANDO CAMBIA DE MARCA (OSEA CUANDO TE PIDEN ALGO POR MARCA)

        while ( (auto.marca <> 'ZZZ') AND (marcaActual = auto.marca) ) do begin
          // SECTOR 3- ACA SE VAN A ESTAR PROCESANDO TODOS LOS DATOS (EN ESTE CASO TODOS LOS AUTOS)

          leer(auto);
        end; {CUANDO SALE DEL WHILE INTERNO SIGNIFICA QUE CAMBIO DE MARCA}

        // SECTOR 4- ACA VA TODO LO QUE ME PIDEN ACTUALIZAR O INFORMAR POR MARCA

     end; {CUANDO SALE DEL WHILE GENERAL SIGNIFICA QUE YA NO LEE MAS DATOS}

  // SECTOR 5- ACA INFORMO TODO LO QUE ME PIDEN EN GENERAL Y SIN QUE DEPENDA DEL CORTE DE CONTROL DE MARCA


POR EJEMPLO: si el ejercicio pide "a. El precio promedio por marca."

    - al decir por marca, sabemos que vamos a tener que informar en el SECTOR 4

    - al pedir calcular precio promedio, necesitamos:
               - variable que sume los precios
               - variable que cuente el total de autos por marca

               estas variables entonces tendremos que incrementarlas en el SECTOR 3

               - importante! donde inicializo estas variables? al pedir POR MARCA, vamos a inicializarlas en el SECTOR 2



POR EJEMPLO: si el ejercicio pide "b. Marca y modelo del auto más caro."

    - al no estar pidiendo algo especificamente por marca, sabemos que en el SECTOR 2 seguro no vamos a poner nada

    - claramente vamos a tener que calcular un maximo comparando por precio
                 - necesito una variable max
                 - necesito una variable marcaMax
                 - necesito una variable modeloMax

                 - estas variables al ser generales para todos los datos del programa, se inicializan en el SECTOR 1

    - al estar pidiendo marca y modelo en general, voy a tener que usar el SECTOR 3 para ir actualizando

    - por ultimo, para informar, debemos hacerlo una vez que terminamos de procesar todos los datos, por lo tanto lo hacemos en el SECTOR 5



//PROXIMAMENTE PARTE 3








