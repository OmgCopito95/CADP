program recursantes;
const
  cant_eval = 10;
type
  rango_eval = 1..cant_eval;
  vector_eval = array[rango_eval] of integer;
  alumno = record
    dni : integer;
    nombre_apellido : string;
    ingreso : integer;
    auto_eval : vector_eval;
  end;
    
  lista = ^nodo;
  nodo = record
     dato : alumno;
     sig : lista;
  end;   
     
   procedure leer_auto_eval(var v:vector_eval);  
   var
     i : rango_eval;
   begin
      for i:= 1 to cant_eval do
	readln(v[i]);
   end;
     
   procedure leer_alumno(var a:alumno);  
   begin
      readln(a.dni);
      readln(a.nombre_apellido);
      readln(a.ingreso);
      leer_auto_eval(a.auto_eval);
   end;
   
   //PODRIA AGREGAR ADELANTE, EN ESTE ENUNCIADO ES INDISTINTO
   procedure agregar_atras(var pri,ult : lista; a : alumno);
   var
     aux : lista;
   begin
     new(aux); 
     aux^.dato := a;
     aux^.sig := nil;
     if (pri=nil) then
       pri := aux
     else
       ult^.sig := aux;
     ult := aux;    
   end; 
    
   //INCISO A 
   procedure cargar_alumnos(var L : lista);
   var 
     a : alumno;
     ult : lista;
   begin
     l := nil;
     repeat
       leer_alumno(a);
       agregar_atras(L,ult,a);
     until (a.dni = 33016244) 
   end;  

  procedure contar_auto_eval(v:vector_eval; var presentes,aprobadas : integer);
  var
    i : rango_eval;
  begin
    presentes := 0;
    aprobadas := 0;
    for i:= 1 to cant_eval do
      if (v[i] >= 0) then
      begin
        presentes := presentes + 1;
        if (v[i] >= 6) then
          aprobadas := aprobadas + 1;
      end;  
  end;
  
  function cumple_condicion(ingreso,presentes : integer) : boolean;
  begin
    cumple_condicion := (ingreso = 2020) and (presentes = cant_eval);
  end; 
   
  function suma_digitos(num : integer) : integer;
  var
    suma : integer;
  begin
     suma := 0;
     while (num <> 0) do
     begin
        suma := suma + (num MOD 10); //sumo el útimo digito de num
        num := num DIV 10; 
     end; 
  end;
  
  function porcentaje(num1, num2 : integer) : real;
  begin
    porcentaje := (num1 * 100 / num2);
  end;
  
  procedure procesar_e_imprimir(L : lista);
  var
    aprobadas, presentes, cant_alumnos, cant_total_alumnos : integer;
  begin
     cant_alumnos := 0;
     cant_total_alumnos := 0;
     while (L <> nil) do
     begin
        cant_total_alumnos := cant_total_alumnos + 1;
        contar_auto_eval(L^.dato.auto_eval, presentes,aprobadas);
        //INCISO B1
        if (aprobadas >= 4) and (presentes >= 8) then
          writeln(L^.dato.dni);
        
        //INCISO B2
        if (cumple_condicion(L^.dato.ingreso, presentes)) then
          cant_alumnos := cant_alumnos + 1;
        
        //INCISO B3     
        if (suma_digitos(L^.dato.dni) MOD 2 = 0) then
          writeln(L^.dato.nombre_apellido);  
     end;
     writeln(porcentaje(cant_alumnos, cant_total_alumnos));  
  end;
  
   
  //PROGRAMA PRINCIPAL
  var
    L: lista;
  begin
    cargar_alumnos(L); //PUNTO A
    procesar_e_imprimir(L); //PUNTO B
  end. 
