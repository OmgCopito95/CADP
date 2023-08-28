program finalCADP2019;
uses
    crt;
  const
    MAX=10;
    type
      subr=1..2;

      miReg=record
        campo:1..31;
      end;

var
  num,i,max1,max2,pmax1,pmax2:integer;
  min1,min2,pmin1,pmin2:integer;

procedure agregarAlFinal(var l:lista; dato:tDato);
var
  nue,ant,act:lista;
begin
   new (nue);
   nue^dato:=dato;
   ant:=l;
   act:=l;
   while(act<>nil)do begin
    ant:=act;
    act:=act^.sig;
   end;
   if(ant=act)then
      l:=nue
   else
     ant^.sig:=nue;
   nue^.sig:=act;
end;

procedure insertar(var l:lista; dato:tDato);
var
  nue,ant,act:lista;
begin
   new (nue);
   nue^dato:=dato;
   ant:=l;
   act:=l;
   while(act<>nil)and(act^.dato<dato)do begin
    ant:=act;
    act:=act^.sig;
   end;
   if(ant=act)then
      l:=nue
   else
     ant^.sig:=nue;
   nue^.sig:=act;
end;






begin   {


           type

               ptr=^integer;

           var
            p,q:ptr;
            begin

            new(p);
            p^:=2;
            writeln(p^);
            q:=p;
            writeln(q^);
            dispose(p);
            writeln(q^);


















            const
                 MAX=1000;
           type
               rango=1..MAX;    /'a'..'z';
               vector=array[rango]of integer;

           var
              v:vector;
           procedure cargarVector(var v:vector;var dimL:integer);//se dispone implementado
           begin
           end;














             for i:=1 to DIMF do
                readln(v[i]);


            readln(v[i]);
            dimL:=1;
            while(dimL<DIMF)and(v[dimL]<>CORTE)do begin
               dimL:=dimL+1;
               readln(v[i]);

            end;




            for i:=1 to DIMF do begin
                modulo1(v[i]);
                modulo2(v[i]);

             leoReg(r);
              while(r.sitio<>CORTE)do begin
                 sitioAct:=r.sitio;
                 while(r.sitio<>CORTE)and((r.sitio==sitioAct))do begin

                 //hago
                 leoreg(r);
                 end;
                 //informo o calculo agrupado
              end;



        with reg do
             campo1
             end
        procedure parteA(var c:char; var cumpleA:boolean);

        if((c>='a')and(c<='z'))or(()and())

        total:=1;
        for i:=1 to num do
           total*=i


           mocoProceso();
           if(mocoFuncion())then begin
       read(car);
       while(car=' ')do
          read(car);
       while(car<>'*')do begin

           while(car<>'*')and(car<>' ')do begin
              //hago
              read(car);
           end;


           while(car=' ')do
                read(car);
       end;




       read(num);
       while(num<>0)and(cumple)do begin
           dig:=num mod 10;
           //uso el dig;
           num:=num div 10;

       end;





}
     max1:=-1; max2:=-1;
     min1:=9999; min2:=9999;

     for i:=1 to  MAX do begin
       write('Ingrese un numero entero: ');
       readln(num);
       if(num>max1)then begin
         max2:=max1;
         pmax2:=pmax1;
         max1:=num;
         Pmax1:=i;
       end
       else
           if(num>Max2)then begin
             Pmax2:=i;
              max2:=num;
           end;

      if(num<min1)then begin
         min2:=min1;
         pmin2:=pmin1;
         min1:=num;
         pmin1:=i;
      end
      else
          if(num<min2)then begin
             min2:=num;
             pmin2:=i;
          end;

     end;
     writeln('El primer maximo es: ', max1, ' ', pmax1);
      writeln('El segundo maximo es: ', max2, ' ', pmax2);
      writeln('El primer minimo es: ', min1, ' ', pmin1);
      writeln('El segundo minimo es: ', min2, ' ', pmin2);

  readkey;
end.

