program explicacion_vectores;

begin
end.




VECTORES

        -> ESTRUCTURA HOMOGENEA
        -> estatica
        -> v[pos]
const
  dimF = 10
type
    vector = array [1..dimF] of integer;

    vector1 = array['a'..'j'] of real;

dimension Logica = cant de elem guardados que tiene
dimension Fisica = cant maxima de elementos que puede llegar a guardar






                                              //incializo dimL=0 en el pp
   procedure cargarVector(var v:vector; var dimL:integer;);
   var
     num:integer;

   begin
      read(num);
      while (num<>0) and (dimL < dimF)do begin
        dimL:=dimL+1;
        v[dimL]:=num;
        read(num);
      end;
   end;



                                              //incializo dimL=1 en el pp
   procedure cargarVector(var v:vector; var dimL:integer;);
   var
     num:integer;
   begin
      read(num);           11     10
      while (num<>0) and (dimL <= dimF)do begin
        v[dimL]:=num;
        dimL:=dimL+1;
        read(num);
      end;
   end;
   //tener cuidado cuando se usa el for


   //recorre todo el vector cada vez que llamo a la funcion
   function calcularMax(v:vector; dimL:integer):integer;
   begin

       for(i:=1 to dimL)do begin

         if(v[i] > max)then
           max:=v[i];

       end;
       calcularMax:=max;

   end;

 //---------------------------------------------------------

 //podria ser funcion
 procedure actMaximo(num:integer; var max:integer);
 begin
      if(num > max)then
           max:=num;
 end;

procedure actMinimo(num:integer; var min:integer);
begin
     if(num < min)then
          min:=num;
end;


//programa principal
  begin
      min:=999;
      max:=-1;
      cargarVector(v,dimL);
      for(i:=1 to dimL)do begin  //recorro el vector una vez
         actMinimo(v[i],min);
         actMaximo(v[i],max);


      end;




  end.


          read(num);
          .....
          read(num)

6846656
 -1

66516512

23322

5652
552
-1









