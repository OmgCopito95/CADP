



{12-En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}


Program ejer12;

Const
   dimF = 53;

Type
   str10 = string [10];

   r_galaxia = record
         nombre: str10;
         tipo: 1..4;
	 masaKG: real;
	 distanciaPC: integer;

   end;



   v_gala = array [1..dimF] of r_galaxia;

   v_tipo = array [1..4] of integer;


Procedure LEER (VAR g: r_galaxia);
Begin
     with g do begin
         writeln('Ingrese el nombre de la galaxia');
	     readln(nombre);
	     writeln('Ingrese tipo (de 1 a 4): ');
	     readln(tipo);
	     writeln('Ingrese su masa en KG ');
	     readln(masaKG);
	     writeln('Ingrese la distancia en parsecs medida desde la Tierra');
	     readln(distanciaPC);
	 end;
End;

Procedure CARGA (VAR v: v_gala);
VAR
  i: integer;
  g: r_galaxia;
Begin
     For i:= 1 to dimF do begin
	     LEER (g);
	     v[i]:= g;

     end;
End;

Procedure CARGATIPO (VAR vec2: v_tipo);
VAR
  i: integer;
Begin
     For i:= 1 to 4 do begin
         vec2[i]:= 0;
     end;
End;

//a) la cantidad de galaxias de cada tipo.
Procedure CANT_GALAXIA (tipoGal: integer; VAR vec2: v_tipo);
VAR
 j: integer;
Begin
     //j:= tipoGal;
     vec2[tipoGal]:= vec2[tipoGal] + 1;
End;



//b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
//porcentaje que esto representa respecto a la masa de todas las galaxias.


FUNCTION MASAS3 (name: str10; masa_total:real): real;

Begin
    If (name = 'VIA LACTEA') or (name = 'ANDROMEDA') or (name = 'TRIANGULO') then
      MASAS3:= masa_total;
    else
      MASAS3:=0;

End;

FUNCTION PORCENT (masas,Total_Masas3: real): real;
Begin
     PORCENT:= (Total_Masas3*100) / masas;
End;


//c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.

FUNCTION NOIRREGULAR (tip,distancia:integer): integer;
Begin
     If (tip <> 4 ) AND ( distancia < 1000) then
	     NOIRREGULAR:= 1
	 Else
	     NOIRREGULAR:= 0;
End;


//d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa

Procedure MAXIMOS (name:str10; VAR nameMax1,nameMax2: str10; masa:real; VAR masaMax1,masaMax2: real);
Begin
     If (masa > masaMax1) then begin
	     masaMax2:= masaMax2;
		 masaMax1:= masa;
		 nameMax2:= nameMax1;
		 nameMax1:= name;
	 end
	 Else
	     If (masa > masaMax2) then begin
		     masaMax2:= masa;
			 nameMax2:= name;
     end;
End;


Procedure MINIMOS (name:str10; VAR nameMin1,nameMin2: str10; masa:real; VAR masaMin1,masaMin2: real);
Begin
     If (masa < masaMin1) then begin
	     masaMin2:= masaMin2;
		 masaMin1:= masa;
		 nameMin2:= nameMin1;
		 nameMin1:= name;
	 end
	 Else
	     If (masa < masaMin2) then begin
	       masaMin2:= masa;
	       nameMin2:= name;
    end;
End;


Procedure IMPRIMIR (vec2: v_tipo);
Var
  i: integer;
Begin
    For i:= 1 to 4 do begin
      writeln ('Para el tipo ',i,' hay ',vec2[i],' galaxias');
    end;
End;


VAR
  v: v_gala;
  g: r_galaxia;
  vec2: v_tipo;
  i,no_irreg: integer;
  Total_Masas3,masas: real;
  nameMax1,nameMax2,nameMin1,nameMin2: str10;
  masaMax1,masaMax2,masaMin1,masaMin2: real;
Begin
   Total_Masas3:= 0;
   masas:= 0;
   no_irreg:=0;
   masaMax1:= -1;
   masaMax2:= -1;
   masaMin1:= 99999;
   masaMin2:= 99999;


   CARGA (v);   //guarda las galaxias
   CARGATIPO (vec2);  //inicializa el vector contador

   For i:= 1 to dimF do begin
         masas:= masas + v[i].masaKG; //suma todas las masas de las galaxias

         CANT_GALAXIA (v[i].tipo, vec2);              //INCISO A
         //vec2[v[i].tipo] := vec2[v[i].tipo]+1;

	 Total_Masas3:= Total_Masas3 + MASAS3(v[i].nombre,v[i].masaKG);

         no_irreg:= no_irreg + NOIRREGULAR(v[i].tipo,v[i].distanciaPC);

	 MAXIMOS (v[i].nombre,nameMax1,nameMax2,v[i].masaKG,masaMax1,masaMax2);
	 MINIMOS (v[i].nombre,nameMin1,nameMin2,v[i].masaKG,masaMin1,masaMin2);
   end;

   IMPRIMIR (vec2);

   writeln('La masa total acumulada de las 3 galaxias principales (la Via Láctea, Andromeda y Triangulo) es de: ',Total_Masas3:6:2);
   writeln('El porcentaje de la masa total acumulada de las 3 galaxias principales respecto a la masa de todas las galaxias es: ',PORCENT(masas,Total_Masas3):6:2,'%');
   writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es: ',no_irreg);
   writeln('el nombre de las dos galaxias con mayor masa: ',nameMax1,' y ',nameMax2,' y el de las dos galaxias con menor masa: ',nameMin1,' y ',nameMin2);

   readln();
End.



Program ejer7;
CONST
  dimF = 9;
TYPE
    v_numero = array [0..dimF] of integer;


Procedure INCIALIZAR_VECTOR (VAR v: v_numero);
Var
  i: integer;
Begin
    for i:= 1 to dimF do begin
         v[i]:= 0;
    end;
End;

Procedure DESCOMPONER(VAR v: v_numero; num:integer);         //la cantidad de ocurrencias de cada dígito procesado.
var
   dig: integer;
Begin
     if(num=0)then
       v[0]:= v[0] + 1;

     while (num <> 0) do begin
         dig:= num MOD 10;
         v[dig]:= v[dig] + 1;
         num:= num DIV 10;
     end;
End;
Procedure LEER (VAR v: v_numero);
var
   numero:integer;
Begin
     writeln('Ingrese un numero: ');
     readln(numero);
     while (numero <> -1) do begin
         DESCOMPONER(v,numero);
         writeln('Ingrese un numero: ');
         readln(numero);
     end;
End;


Procedure IMPRIMIR (v: v_numero);
Var
   i: integer;
Begin
    writeln;
    for i:= 0 to dimF do begin
         writeln('La carga es : v[',i,']= ',v[i]);
    end;
    writeln;
end;

Procedure MAXDIG (v: v_numero;i:integer; VAR max,pos: integer);                         //el dígito más leído.
Begin
    if (v[i] > max) then begin
        max:= v[i];
        pos:=i;
    end;
end;
Procedure CERO_OCURRENCIA (v: v_numero; i: integer);
Begin
    if (v[i] = 0) then
        writeln('El digito ',i,' tuvo 0 ocurrencias');
End;
VAR
   v: v_numero;
   i,num: integer;
   max: integer;
Begin
     max:= -1;
     INCIALIZAR_VECTOR(v);
     LEER (v,num);
     //IMPRIMIR (v);
     For i:= 0 to dimF do begin
         writeln('La carga es : v[',i,']= ',v[i]);
         MAXDIG (v,i,max,pos);
         CERO_OCURRENCIA (v,i);
     end;
     writeln('El mayor digito leido fue el : ',pos);
     readln();
End.



{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ejercicio10; // A LO SUMO  es <=
const
    dimF = 3; //300; uso 5 para probar
type
    rango= 1..dimF;
    vec_Empleados = array [rango] of real;

function promedio (sueldoTotal:real; dimL:rango):real;
begin
    promedio:=sueldoTotal/dimL;
end;
Procedure incrementarsueldo (x: real; var v: vec_Empleados; dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
     v[i]:= v[i] + (v[i]*x);
end;

Procedure imprimir (v: vec_Empleados;dimL:integer);
var
     i: integer;
     total_sueldo:real;
Begin
    total_sueldo:=0;
    for i:=1 to dimL do
        total_sueldo:= total_sueldo + v[i];
    writeln('kjasnkjasd');
    writeln(dimL);
    writeln('El sueldo promedio de los empleados de la empresa es: $ ',(total_sueldo/dimL));
End;
Procedure cargarsueldos (var v:vec_Empleados;var dimL:integer);
var
    sueldo:real;
begin
    writeln('SUELDO:');
    readln(sueldo);
    while (sueldo <> 0 ) and (dimL<dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=sueldo;
        writeln('SUELDO:');
        readln(sueldo);
    end;
end;
var

   vec:vec_Empleados;
    i,dimL:integer;
    numX:real;
begin
    dimL:=0;
    numX:=0.15;
    cargarsueldos(vec,dimL);
    writeln(vec[1]);
    incrementarsueldo(numX,vec,dimL);
    imprimir(vec,dimL);
end.




















