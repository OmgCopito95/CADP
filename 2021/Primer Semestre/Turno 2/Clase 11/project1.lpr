procedure intercambio (x,y:rango_vec; var v: vectorNumeros);                            //pensando como los modulos intercambiar de practicas anteriores pero aplicando vectores
var
    aux:integer;
begin
    aux:= v[x];  //guarda el num de la pos x
    v[x] := v[y]; //guarda en la pos x lo que esta en la pos y
    v[y] := aux; //guarda el dato de la pos x en la pos y
end;




{8-Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}
program Hello;
const
    dimF = 3;//400 puse 3 para probar
type
    rango = 1..dimF;
    cadena15 = string[15];
    alumno = record
        nroInsc:integer;
        dni:integer;
        ape:cadena15;
        nom:cadena15;
        anionac:integer;
    end;
    vec_alumnos= array [rango] of alumno;
procedure masViejos(anioAnalizado:integer; apeAct, nomAct:cadena15; var anio1,anio2: integer; var apeViejo1,nomViejo1,apeViejo2,nomViejo2:cadena15);
begin
    if(anioAnalizado < anio1) then begin
        anio2:= anio1;
        apeViejo2:= apeViejo1;
        nomViejo2:= nomViejo1;
        anio1:= anioAnalizado;
        apeViejo1:= apeAct;
        nomViejo1:= nomAct;
    end
    else
        if( anioAnalizado < anio2) then begin
            apeViejo2:= apeAct;
            nomViejo2:= nomAct;
            anio2:= anioAnalizado;
        end;
end;

function calcularPorcentaje (cantPares:integer; dimL:integer):real;
begin
    calcularPorcentaje:= (cantPares/dimL) *100;
end;

function soloDigPares (num:integer): integer;
var
    dig:integer;
    esPar:boolean;
begin
    esPar:=true;
    while (num <> 0) and (esPar) do begin
        dig := num mod 10;
        if ((dig mod 2) = 0) then
            num:= num div 10
        else
            esPar:=false;
    end;

    if(esPar)
             soloDigPares:=1;
    else
        soloDigPares:=0;

end;
procedure leerAlumno (var a:alumno);
begin
    with a do begin
        writeln('NRO INSCRIPCION:');
        readln(nroInsc);
        writeln('DNI:');
        readln(dni);
        writeln('APELLIDO:');
        readln(ape);
        writeln('NOMBRE:');
        readln(nom);
        writeln('ANIO DE NACIMIENTO:');
        readln(anionac);
    end;
end                                          0
procedure cargarAlumnos(var v:vec_alumnos; var dimL:integer);
var                                        //DIML SE LO PASO CUANDO NO SE LA CANT EXACTA QUE GUARDO
    i:integer;
    alu:alumno;
begin
    // ESTO ES CUANDO SE LA CANTIDAD DE DATOS QUE GUARDO EN EL VECTOR
    {for i:=1 to dimF do begin
        leerAlumno(alu);
        v[i]:=alu;
    end;}

    //ESTO ES CUANDO NO SE LA CANTIDAD DE DATOS QUE GUARDO EN EL VECTOR (A LO SUMO)
    leerAlumno(alu);
    while (dimL< dimF) and (alu.dni <> -1) do begin
        dimL:=dimL+1;
        v[dimL]:=alu;
        leerAlumno(alu);
    end;

end;
var
    v:vec_alumnos;
    i,cantPares, anio1,anio2:integer;
    apeViejo1,apeViejo2,nomViejo1,nomViejo2:cadena15;
begin
    anio1:=9999;
    anio2:=999;
    cantPares:=0; //inicializo en 0 el contador de pares

    dimL:=0;
    cargarAlumnos(v,dimL); //cargo el vector de alumnos

    for i:=1 to dimL do begin   //recorrer el vector
        //if ( soloDigPares(v[i].dni)) then //verifico si en la posicion actual, en el campo dni el dni es par
            cantPares:= cantPares + soloDigPares(v[i].dni);
            //cantPares:= cantPares +1; //si era par me suma 1
        masViejos(v[i].anionac,v[i].ape,v[i].nom,anio1,anio2,apeViejo1,nomViejo1,apeViejo2,nomViejo2);
    end;

    writeln('Porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', calcularPorcentaje(cantPares,dimL):2:2, '%');
    writeln('Apellido y nombre de los dos alumnos de mayor edad edad son:', apeViejo1 , nomViejo1,' y ', apeViejo2 , nomViejo2);
end.


 {

{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}
program Hello;
const
    dimF = 3;//400
type
    rango = 1..dimF;
    cadena15 = string[15];
    alumno = record
        nroInsc:integer;
        dni:integer;
        ape:cadena15;
        nom:cadena15;
        anionac:integer;
    end;
    vec_alumnos= array [rango] of alumno;
procedure masViejos(anioAnalizado:integer; apeAct, nomAct:cadena15; var anio1,anio2: integer; var apeViejo1,nomViejo1,apeViejo2,nomViejo2:cadena15);
begin
    if(anioAnalizado < anio1) then begin
        anio2:= anio1;
        apeViejo2:= apeViejo1;
        nomViejo2:= nomViejo1;
        anio1:= anioAnalizado;
        apeViejo1:= apeAct;
        nomViejo1:= nomAct;
    end
    else
        if( anioAnalizado < anio2) then begin
            apeViejo2:= apeAct;
            nomViejo2:= nomAct;
            anio2:= anioAnalizado;

        end;
end;

function calcularPorcentaje (cantPares:integer):real;
begin
    calcularPorcentaje:= (cantPares/dimF) *100;
end;
function soloDigPares (num:integer): boolean;
var
    dig:integer;
    esPar:boolean;
begin
    esPar:=true;
    while (num <> 0) and (esPar) do begin
        dig := num mod 10;
        if ((dig mod 2) = 0) then
            num:= num div 10
        else
            esPar:=false;
        end;
    soloDigPares:=esPar;

end;
procedure leerAlumno (var a:alumno);
begin
    with a do begin
        writeln('DNI:');
        readln(dni);
        if (dni <> -1) then begin
            writeln('NRO INSCRIPCION:');
            readln(nroInsc);
            writeln('APELLIDO:');
            readln(ape);
            writeln('NOMBRE:');
            readln(nom);
            writeln('ANIO DE NACIMIENTO:');
            readln(anionac);
        end;
    end;
end;
procedure cargarAlumnos(var v:vec_alumnos; var dimL:integer);
var
    alu:alumno;
begin
    leerAlumno(alu);
    while (dimL< dimF) do begin
        dimL:=dimL+1;
        leerAlumno(alu);
        v[dimL]:=alu;
    end;
end;
var
    v:vec_alumnos;
    dimL,cantPares, anio1,anio2:integer;
    porcentaje:real;
    apeViejo1,apeViejo2,nomViejo1,nomViejo2:cadena15;
begin
    cantPares:=0; //inicializo en 0 el contador de pares
    anio1:=9999;
    anio2:=999;
    dimL:=0;
    //while (v[0].dni <> -1 ) and (dimL < dimF) do begin
    cargarAlumnos(v,dimL); //cargo el vector de alumnos
    for i:=1 to dimL
        if ( soloDigPares(v[dimL].dni)) then //verifico si en la posicion actual, en el campo dni el dni es par
            cantPares:= cantPares +1; //si era par me suma 1
        masViejos(v[dimL].anionac,v[dimL].ape,v[dimL].nom,anio1,anio2,apeViejo1,nomViejo1,apeViejo2,nomViejo2);
   // end;
    porcentaje:= calcularPorcentaje(cantPares);
    writeln('Porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', porcentaje:2:2, '%');
    writeln('Apellido y nombre de los dos alumnos de mayor edad edad son:', apeViejo1 , nomViejo1,' y ', apeViejo2 , nomViejo2);
end.

}


  {7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}
program Hello;
const
    dimF = 9;
type
    rangovec = 0..dimF;
    vec_enteros = array [rangovec] of integer;

procedure inicializarContador (var v:vec_enteros);
var
    i:rangovec;
begin
    for i:=0 to dimF do
        v[i]:=0;
end;
procedure descomponer (var v:vec_enteros; num:integer);
var
    resto:rangovec;
begin
    while (num <> 0) do begin
        resto:= num mod 10; {obtengo el digito}
        v[resto]:= v[resto] + 1; {incremento contador asociado al dígito}
        num:= num div 10;
    end;
end;

procedure actualizarMaximo (num:integer; var max,pos:integer; i:integer);
begin

    if (num>max) then begin
         max := num;
         pos := i; //la posicion del numero que mas veces salió
    end;

end;

procedure imprimir (v:vec_enteros);
var
    i:integer;
    max,pos:integer;
begin
    max:=-1;
    pos:=-1;
    for i:=0 to 9 do begin   //i se esta guardando los digitos que procesa

        actualizarMaximo(v[i],max,pos,i);

        if (v[i] = 0) then
            writeln('El digito ', i, ' no tuvo ocurrencias')
        else
           writeln ('el ', i,' ocurrió ',v[i],' veces.');
    end;

    writeln ('el dígito más leído fue: ', pos);   //max tiene la cantidad de veces que salio el numero que mas salio
end;

var
    v:vec_enteros;
    num:integer;
    numMax:rangovec;
begin
    inicializarContador(v);
    writeln ('Ingrese un numero:');
    readln(num);
    while (num <> -1) do begin
        descomponer(v,num);
        writeln ('Ingrese un numero:');
        readln(num);
    end;
    imprimir(v);
end.




























