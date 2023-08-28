program ingresantes;
const
  cant_clases = 12;
  cant_turnos = 4;
type
  rango_notas = 4..10;
  rango_turnos = 1..cant_turnos;
  rango_clases = 1..cant_clases;
  vector_clases = array[rango_clases] of boolean;
  alumno = record
	DNI : integer;
	nombre_apellido : string;
	nota : rango_notas;
	turno : rango_turnos;
	asistencias : vector_clases;
  end;
    
  lista = ^nodo;
  nodo = record
       dato : alumno;
       sig : lista;
  end;

  vector_turnos = array[rango_turnos] of integer;

  //opcion 1: usamos un for      
  function cumple_condicion(asistencias : vector_clases) : boolean;
  var
    i, cant : integer;      
  begin
    cant := 0;
    for i:=1 to cant_clases do
      if (asistencias[i]) then
        cant := cant + 1;
    cumple_condicion := (cant >= 8);     
  end;      
 
  //opcion 2: usamos un while. Más eficiente!
  function cumple_condicion2(asistencias : vector_clases) : boolean;
  var
    i, cant : integer;      
  begin
    cant := 0;
    i := 1;
    while (i <= 12) and (cant <8) do
    begin
      if (asistencias[i]) then
        cant := cant + 1;
      i := i+1;  
    end;
    cumple_condicion2 := (cant = 8);  //if cant = 8 then cumle_condicion := true else cumple_condicion := false;
  end;      
 
  procedure agregarAdelante(var L : lista; a : alumno);
  var
    aux : lista;
  begin
    new(aux);
    aux^.dato := a;
    aux^.sig := L;
    L := aux;
  end;
 
  procedure procesarAlumnos(lista_alumnos : lista; var lista_rinden : lista); 
  var
    aux : alumno;
  begin
    lista_rinden := nil;
    while (lista_alumnos <> nil) do 
    begin
      aux := lista_alumnos^.dato; 
      if (cumple_condicion(aux.asistencias)) then
        agregarAdelante(lista_rinden,aux);
      lista_alumnos := lista_alumnos^.sig;  
    end;
  end;
 
  procedure inicializar(var v : vector_turnos);
  var
    i :  rango_turnos;
  begin
    for i:= 1 to cant_turnos do
      v[i] := 0;
  end;
 
  //otra opcion: no envío el parámetro digito_buscado, y esta funcion sólo cuenta la cantidad de ceros
  function cant_digitos(num,digito_buscado : integer) :integer;
  var
    dig,cant : integer;
  begin
    cant := 0;
    while (num <> 0) do
    begin
      dig := num MOD 10;
      if (dig = digito_buscado) then
        cant := cant + 1;
      num := num DIV 10;  
    end;
    cant_digitos := cant;
  end;
 
  //otra opcion: en vez de retornar la cant. de ceros, retorno TRUE si no tiene ceros, o FALSE si aparece algun cero. ESTA OPCION PUEDE SER MAS EFICIENTE!
  function tiene_ceros(num : integer) : boolean;
  var
    encontre_un_cero : boolean;
    dig : integer;
  begin
    encontre_un_cero := false;
    while (num <> 0) and (not encontre_un_cero) do
    begin
      dig := num MOD 10;
      if (dig = 0) then
        encontre_un_cero := true
      else  
        num := num DIV 10;
    end;    
   tiene_ceros := encontre_un_cero;
  end;  
 
  function maximo(v : vector_turnos) : rango_turnos;
  var
    i, max_turno : rango_turnos;
    maxAlumnos : integer;
  begin
    maxAlumnos := -1;
    for i:= 1 to cant_turnos do
      if (v[i] > maxAlumnos) then
      begin
        maxAlumnos := v[i];
        max_turno := i;
      end;
    maximo := max_turno;
  end;  
 
  procedure procesar_e_imprimir(L : lista);
  var
    turnos : vector_turnos;
    cantAlumnos : integer;
  begin
    inicializar(turnos);
    cantAlumnos := 0;
    while (L <> NIL) do 
    begin
      //Inciso 1
      if (L^.dato.nota >= 8) then
        writeln(L^.dato.nombre_apellido, l^.dato.DNI);
      //Inciso 2
      turnos[L^.dato.turno] := turnos[L^.dato.turno] + 1;
      //Inciso 3
      if (cant_digitos(L^.dato.dni,0) = 0) then
        cantAlumnos := cantAlumnos + 1;
      L := L^.sig;
    end;
    //inciso 2
    writeln(maximo(turnos));
    //inciso 3
    writeln(cantAlumnos); 
 end;

 procedure cargarAlumnos(var L : lista);
 begin
 end;
 
  //PROGRAMA PRINCIPAL
var
    L1,L2 : lista;
begin
    cargarAlumnos(L1); //SE DISPONE
    procesarAlumnos(L1,L2); //PUNTO A
    procesar_e_imprimir(L2); //PUNTO B
end.
