program ej13_ejEmbarazadas;
const
 dimF=3600;
type
 roles=1..4;
 cad25=string[25];
 usuario=record
   correo:cad25;
   rol:roles;
   revista:cad25;
   ultac:integer;
 end;
 info=array[1..dimF] of usuario;  //SE DISPONE

 milei=record
   correo:cad25;
   ultac:integer;
 end;

 lista=^nodo;       //A
 nodo=record
   dato:milei;
   sig:lista;
 end;

 vcont=array[roles] of integer;  //B

 vago=record        //C
   correo:cad25;
   ultac:integer;
 end;

procedure agregarord(var L:lista;correo:cad25;ultac:integer);      //A
 var
   pos,posant,aux:lista;
 begin
   pos:=L;
   posant:=L;
   new(aux);
   aux^.dato.correo:=correo;
   aux^.dato.ultac:=ultac;
   while (pos<>nil) and (pos^.dato.ultac<=ultac) do begin
     posant:=pos;
     pos:=pos^.sig;
   end;
   posant^.sig:=aux;
   aux^.sig:=pos;
 end;



procedure check(var L:lista;inf:info;var v1,v2:vago);

 procedure dosvagos(var v1, v2:vago;correo:cad25;ultac:integer);   //CALCULO LOS DOS MAXIMOS DEL PUNTO C
   begin
     if ultac>v1.ultac then begin
       v2:=v1;
       v1.ultac:=ultac;
       v1.correo:=correo;
     end
     else if ultac>v2.ultac then begin
       v2.ultac:=ultac;
       v2.correo:=correo;
     end;
   end;


 var
   i:integer;

 begin    //RECORRE EL VECTOR QUE SE DISPONE

   for i:=1 to dimF do begin
     //b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
     VC[INF[i].rol]:= VC[INF[i].rol] +1;   //B

     if inf[i].revista='Economica' then           //PUNTO A - BIEN
       agregarord(L,inf[i].correo,inf[i].ultac);

     dosvagos(v1,v2,inf[i].correo,inf[i].ultac);  //C
     writeln('agr');
   end;
 end;
procedure impL(L:lista);
 begin
   writeln('Correo y ultima sesion de todos los usuarios de la revista Economica:');
   while L<>nil do begin
     writeln(L^.dato.correo);
     writeln('Inicio hace ',L^.dato.ultac,' dias.');
     L:=L^.SIG;
   end;
 end;
procedure impv(v1,v2:vago);
 begin
   writeln('Los dos correos con mas tiempo sin conexion:');
   writeln(v1.correo,' y ',v2.correo);
 end;
var
 inf:info;
 L:lista;
 v1,v2:vago;
 VC:vcont;
begin
 L:=nil;
 v1.ultac:=0;
 INICIALIZARVECTORCONTADOR(VC);
 cargar(inf); //SE DISPONE
 check(L,inf,v1,v2,VC);
 impL(L);
 impv(v1,v2);
 informarVectorContador(vc);
end.





  

{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario
se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de
días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista
Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}
program Hello;
const
    dimF = 3600;
type
    rangoRol = 1..4;
    cadena15 = string[15];
    rangoVec= 1..dimF;

    usuario = record
        email:cadena15;
        rol: rangoRol;
        revistaPart:cadena15;
        cantDiasUltAcc:integer;
    end;

    vec_usuarios = array [rangoVec] of usuario;
    vec_roles = array[rangoRol] of integer;

    lista = ^nodo;
    nodo=record
        dato:usuario;
        sig:lista;
    end;

procedure informar (l:lista;vr:vec_roles);
var
    i:integer;
begin
    while (l<> nil) do begin
        writeln('El usuario: ', l^.dato.email, 'ingreso por ultima vez hace: ',l^.dato.cantDiasUltAcc);
        l:=l^.sig;
    end;
    for i:=1 to 4 do
        writeln('Para el rol: ',i,' hubo ', vr[i],' usuarios');
end;
procedure actualizarMaximos(emailActual:cadena15; cant_dias:integer; var maximo1,maximo2:integer; var email1,email2:cadena15);
begin
    if (cant_dias > maximo1) then begin
        maximo2:=maximo1;
        maximo1:=cant_dias;
        email2:=email1;
        email1:=emailActual;
    end
    else
        if(cant_dias > maximo2) then begin
            cant_dias:=maximo2;
            email2:=emailActual;
        end;
end;

procedure insertarOrdenado(var l:lista; u:usuario);
var
    nue,ant,act:lista;
begin
    new(nue);
    nue^.dato:=u;
    ant:=l;
    act:=l;
    while((act <> nil ) and (act^.dato.cantDiasUltAcc < u.cantDiasUltAcc )) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act = ant) then
        l:=nue {va al principio}
    else
        ant^.sig  := nue; {va entre otros dos o al final}
    nue^.sig := act;
end;

procedure recorrerVector (v:vec_usuarios; var l:lista; var vr:vec_roles);
var
    i: integer;
    email1,email2:cadena15;
    maximo1,maximo2:integer;
begin
    maximo1:=-1;
    maximo2:=-1;
    for i:=1 to dimF do begin
        if(v[i].revistaPart = 'ECONOMICA') then
            insertarOrdenado(l,v[i]);
        vr[v[i].rol]:=vr[v[i].rol]+1;
        actualizarMaximos(v[i].email,v[i].cantDiasUltAcc,maximo1,maximo2, email1,email2);
    end;
    writeln(email1,' y ', email2,' son los dos usuarios que hace más tiempo que no ingresan al portal.');
end;

procedure inicializarVContador (var vr:vec_roles);
var
    i:integer;
begin
    for i:=1 to 4 do
        vr[i]:=0;
end;
var
    l: lista;
    vec: vec_usuarios;
    vr: vec_roles;
begin
    l:=nil;
    cargarVector(vec); //se dispone
    inicializarVContador(vr);
    recorrerVector(vec,l,vr);
    informar(l,vr);
end.


//----------------------------------------------------------

// ejercicio 11
 while (l<>nil) and i<10
       imprimirdatos
       l:=l^.sig;

 for i:=1 to 10
     imprimirdatos
     l:=l^.sig;

//---------------------------------------------------------


{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42).
La maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}


program ejercicio4;
const
    dimF=42;
type

    vectorPesos = array[1..dimF] of real;

    paciente = record
        nombre: cadena10;
        apellido: cadena10;
        pesos: vectorPesos;
        dimL: integer;
    end;

    lista = ^nodo;
    nodo=record
        dato:paciente;
        sig:lista;
    end;



procedure mayorAumento
    for i:=2 to dimL
      aumento:=v[i]-v[i-1];
      if(aumento>max)then begin
        max:=aumento;
        semana:=i;
      end;
    end;
    writeln('la semana con mas aumento es',i);


procedure recorrerLista
begin

    while(l<>nil)do begin

        mayorAumento(l^.dato.pesos,l^.dato.dimL);//le mando el vector de pesos
        aumentoTotal := l^.dato.pesos[l^.dato.dimL] - l^.dato.pesos[1];
        l:=l^.sig;
    end;
end;

begin
    l:=nil;
    cargarLista(l); //se dispone
    recorrerLista(l);
end;


// ------------------------------------------------------------------------











