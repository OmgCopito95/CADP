// CORTE DE CONTROL

// GENERALMENTE TODOS LOS ENUNCIADOS QUE DIGAN QUE LA INFORMACIÓN QUE SE INGRESA VIENE ORDENADA, ENTONCES
// LO MAS PROBABLE ES QUE HAYA QUE HACER CORTE DE CONTROL

// CABE ACLARAR QUE ESTO ES UN INTENTO DE FACILITAR LA FORMA DE PENSAR EL CÓMO RESOLVER LOS EJERCICIOS
// PERO ES IMPORTANTE SABER QUE CADA EJERCICIO ES DIFERENTE, POR ENDE, PRESTAR ATENCION

// TOMEMOS DE EJEMPLO EL EJERCICIO 5 DE LA PRACTICA

Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.



// LEER EL ENUNCIADO Y HACER PASO 1 Y 2

// PASO 1) IDENTIFICAR BAJO QUE CRITERIO VIENE ORDENADA LA INFORMACION
la info viene ordenada por marca

// PASO 2) IDENTIFICAR CUAL ES EL CORTE DE CONTROL DE LECTURA
el ingreso de la info finaliza cuando se ingresa la marca = ZZZ

// --------------------------------------------------------------------------------- //

// CÓMO HACER EL CODIGO? ME VOY A ENFOCAR EN EL FUNCIONAMIENTO DEL CORTE DE CONTROL
// LOS TIPOS DE DATOS Y DECLARACIONES, SE LOS DEJO A USTEDES

// PASO 3) ESCRIBIR LA ESTRUCTURA DE CONTROL DE LA FINALIZACION DE ENTRADA DE DATOS.
//         ES DECIR, EL WHILE QUE CORTA TODO EL PROGRAMA
// TENER EN CUENTA QUE PRIMERO HABRIA QUE LEER LOS DATOS PARA ENTRAR AL WHILE

           leer(auto);
           while (auto.marca <> 'ZZZ') do begin


// TODO LO QUE SIGUE, SE VA A ESCRIBIR DENTRO DEL WHILE

// PASO 5) GUARDARSE EN UNA VARIABLE ACTUAL, EL DATO QUE SE ESTÁ PROCESANDO
//         TENER EN CUENTA QUE ESE ACTUAL QUE SE GUARDA, ES EL QUE TIENE QUE VER CON EL ORDEN

           marcaActual := auto.marca

//SI LA INFO VENIA ORDENADA POR RAZA DE PERRO, SERIA: razaActual := perro.raza

// PASO 6) HACER UN WHILE INTERNO QUE COMPARE EL DATO ACTUAL CON EL LEIDO
// ACORDARSE ADEMAS DE PONER LA CONDICION DE CORTE DE LECTURA

             while ( (auto.marca <> 'ZZZ') AND (marcaActual = auto.marca) )

// PASO 7) LLAMAR AL MODULO DE LECTURA DENTRO DEL SEGUNDO WHILE

// --------------------------------------------------------------------------------- //

// LISTO. ESA ES LA ESTRUCTURA PRINCIPAL DE LOS PROGRAMAS DE CORTE DE CONTROL
// CON ESTO VAN A PODER RESOLVER LOS EJERCICIOS QUE TENGAN UN SOLO CRITERIO DE ORDEN


     leer(auto);

     while (auto.marca <> 'ZZZ') do begin

        marcaActual := auto.marca

        while ( (auto.marca <> 'ZZZ') AND (marcaActual = auto.marca) ) do begin

          leer(auto);
        end;

     end;












