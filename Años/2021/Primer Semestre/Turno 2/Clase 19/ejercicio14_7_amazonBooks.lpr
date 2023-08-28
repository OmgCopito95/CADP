program ejercicio14_7_amazonBooks;

type
  //REGISTRO QUE SOLAMENTE LEO
  prestamo = record
    ...
    ...
  end;

  //REGISTRO DE LA LISTA
  libro = record
    isbn:integeR;
    cant: integeR;
  end;

  //LISTA DEL PUNTO A
  lista = ^nodo;
  nodo = record
    dato: libro;
    sig: lista;
  end;

  vector_contador = array[1..31] of integer; //cuenta cuantos se prestaron por dia


procedure agregarAtras();
begin



end;

procedure calcularMaxEnVector(vc:vector_contador);
begin
   for i:=1 to dimF do begin
      if(v[i]>max)then begin
         max:=v[i];
         pos:=i
      end;

   end;


end;

procedure procesar(var l:lista; var vc:vector_contador);
begin

  leerPrestamo(p);
  totalPrestamos:=0;
  cantidadPuntoC:=0;

  while(p.isbn <> -1)do begin

     isbnActual:=p.isbn;
     cantPrestados:=0;

     while(p.isbn <> -1) and (isbnActual = p.isbn)do begin

        cantPrestados:=cantPrestados+1; //cuenta la cant de veces que se presto un libro

        vc[p.dia]:=vc[p.dia]+1; //sirve para el punto B

        totalPrestamos:= totalPrestamos+1;

        if(p.nroPrestamo MOD 2 = 1) and (p.nroSocio MOD 2 = 0)then //MODULARIZAR
           cantidadPuntoC:=cantidadPuntoC+1;

        leerPrestamo(p);
     end;
     //CAMBIO DE LIBRO
     libro.isbn:= isbnActual
     libro.cant:= cantPrestados;
     agregarAtras(l,libro); //A


  end;
  //TERMINO DE ANALIZAR TODOS LOS PRESTAMOS
  calcularMaxEnVector(vc); //B
  porcentajePuntoC(totalPrestamos,cantidadPuntoC); //C

end;

var
  l:lista;
  p:prestamo;
  libro:libro;
  vc: vector_contador;
begin
  l:=nil;
  incializarVector(vc);
  procesar(l,vc);
end.






//---------------EJERCICIO 7 (incompleto)

  type

    alumno = record
       ...
       ...
       notas: v_notas;
       dimL: integer;
    end;

    v_notas = array [1..24] of real;



    procedure leerAlumno(var a:alumno);
    begin
      readln(a.nroAlumno)
       if(a.nroAlumno <> -1)then begin
          ...
          ...
          a.dimL:=0; //al principio el vector de notas está vacio
          for(i:=1 to 24)do begin
            readln(nota);
            if(nota >= 4)then
               insertarOrdenadoEnElVector(a.notas,nota,a.dimL);
          end;

       end;
    end;




//---------EJERCICIO AMAZON BOOKS (INCOMPLETO)

            l:=nil;
            repeat
                  leerLibro(libro);
                  if(libro.editorial = planeta libros)then begin
                    calcularMinimo(libro.anioEdicion,min);
                    cantEditados:=cantEditado+1;
                    cantTotalVentas:= cantTotalVentas+ libro.cantV;
                    if(libro.canV > 250)then
                       agregarAdelante(l,vectorAreasTema[libro.codigo],libro.cantPaginas)
                  end;

            until ();

            //armo el registro nuevo
            registrEstructuraPuntoA.nombreEditorial:=Planeta libros
            registrEstructuraPuntoA.anioEd:=min;
            registrEstructuraPuntoA.listaDetalles:=l;








