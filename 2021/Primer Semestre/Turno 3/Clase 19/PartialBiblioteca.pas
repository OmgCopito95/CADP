//EJERCICIO 14 PRACTICA 7

{ 14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:

A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.

B) Calcular e informar el día del mes en que se realizaron menos préstamos.

C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.}

program biblioteca;
const
     max = 31; // 31 dias, marzo 2020
type
     rangoDias = 1..max;

// registro de prestamo
     prestamo = record
         nro_prestamo: integer;
         isbn: integer;
         nro_socio: integer;
         dia_prestamo: rangoDias;
     end;
// punto A, informacion solicitada
     InfoS = record
         isbn: integer;
         cantidad: integer;
     end;

// vector contador para los dias
     v_dias = array [rangoDias] of integer;

// lista de informacion solicitada
     lista = ^nodo;
     nodo = record
         dato: InfoS;
         sig: lista;
     end;

{PROCEDURES}
procedure LeerPrestamo (var p: prestamo);
begin
     write ('Ingrese ISBN: ');
     readln (p.isbn);
     if (p.isbn <> -1) then
     begin
         write ('Ingrese numero de prestamo: ');
         readln (p.nro_prestamo);
         write ('Ingrese numero de socio: ');
         readln (p.nro_socio);
         write ('Ingrese dia');
         readln (p.dia_prestamo);
     end;
end;

procedure InicializarVector (var v: v_dias);
var
    i: rangoDias;
begin
     for i := 1 to max do
         v[i] := 0;
end;

procedure InsertarOrdenado (var v: v_dias);

begin
    
end;

// punto B, calcula el minimo
procedure CalcularMinimo (v:v_dias);
var
     i,min: rangoDias;
begin
     min := 9999;
     for i := 1 to max do
     begin
         if (v[i] < min) then
         begin
             min := v[i];
             dia_min := dia;
         end;
     end;
     writeln('informar dia',dia_min)
end;

// punto C, calcula y devuelve el porcentaje
function Porcentaje (cant, total: integer): real;
begin
    Porcentaje := ((cant * 100) / total);
end;

procedure Procesar (var l: lista; var v: v_dias; var cant, total: integer);
var
     p: prestamo;
     info: InfoS;
begin
     LeerPrestamo (p);
     while (p.isbn <> -1) do
     begin
         info.isbn := p.isbn;
         info.cantidad := 0;
         while (p.isbn <> -1) and (p.isbn = info.isbn) do
         begin
             info.cantidad := (info.cantidad + 1);
             v[p.dia] := (v[p.dia] + 1);
             if (((p.nro_prestamo MOD 2) = 1) and ((p.nro_socio MOD 2) = 0)) then
                 cant := (cant + 1);
             total := (total + 1);
             LeerPrestamo (p);
         end;
         InsertarOrdenado(l,info);
     end;

end;

// VAR MAIN PROGRAM
var
     l: lista;
     cant, total: integer;
     v: v_dias;
begin
     l := NIL;
     cant := 0;
     total := 0
     InicializarVector (v);
     Procesar (l,v);
     CalcularMinimo (v);
     write ('Porcentaje de prestamos impar y socio par: ', Porcentaje (cant, total));
end.
