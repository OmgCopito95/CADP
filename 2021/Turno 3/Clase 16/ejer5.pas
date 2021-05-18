{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada 
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa 
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program ejer;
type
	string20=string[20];

	producto=record
		codigo:integer;
		descripcion:string20;
		stock_actual:integer;
		stock_minimo:integer;
		precio:real;
	end;

	lista=^nodo;

	nodo=record
		dato:producto;
		sig:lista;
	end;
procedure leer_producto(var p:producto);
	begin
		writeln('Ingrese el codigo del producto');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			writeln('Ingrese la descripcion del producto');
			readln(p.descripcion);
			writeln('Ingrese el stock actual');
			readln(p.stock_actual);
			writeln('ingrese el stock minimo y el precio');
			readln(p.stock_minimo);
			readln(p.precio);
		end;
	end;
procedure agregaradelante(var sp:lista; p:producto);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=p;
		nue^.sig:=sp;
		sp:=nue;
	end;

procedure carga(var sp:lista);
	var
		p:producto;
	begin
		leer_producto(p);
		while (p.codigo <> -1) do begin
			agregaradelante(sp, p);
			leer_producto(p);
		end;
	end;


    //al menos -> como minimo
    //a lo sumo -> como maximo

                                      //le puedo mandar solo los dos campos que uso
	procedure descomposicionDelCodigo(p:producto);
		var
			cant_par, digito:integer;
		begin
				cant_par:=0;
				while (p.codigo <> 0) and (cant_par < 3) do begin
					digito:=p.codigo mod 10;
					if (digito mod 2 = 0) then
						cant_par:=cant_par+1;
					p.codigo:=p.codigo div 10;
				end;
				if (cant_par = 3) then
					writeln('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares ', p.descripcion);

		end;
                                   //le puedo mandar solo los dos campos que uso
	procedure actualizarDosMinimos(p:producto;var min1,min2:real; var cod1,cod2:integer);
		begin
				if (p.precio < min1) then begin
					min2:=min1;
					cod2:=cod1;
					min1:=p.precio;
					cod1:=p.codigo;
				end
				else
					if (p.precio < min2) then begin
						min2:=p.precio;
						cod2:=p.codigo;
				    end;
		end;

    procedure recorrerLista(l:lista);
    var

    begin
        minimo1:=9999;
		minimo2:=9999;
		cod2:=0;
		cod1:=0;
        while(l<>nil)do begin  //recorre 1 vez la lista

            //a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
            //hacerlo funcion
            if (l^.dato.stock_actual < l^.dato.stock_minimo) then
					cant_minimo:=cant_minimo+1;

           //b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
            descomposicionDelCodigo(l^.dato);  //1.imprimir la descripcion en el proc
                                               //2.generar una nueva lista con las descripciones. despues al final imprimo

            //c. Código de los dos productos más económicos.
            actualizarDosMinimos(l^.dato,min1,min2,codigo1,codigo2);

            l:=l^.sig;
        end;
        //imprimir los dos minimos
        //calcular porcentaje
    end;


	var
		super_produc:lista;
	begin
		super_produc:=nil;
	carga(super_produc);
    recorrerLista(super_produc);

	porcentaje_producto(super_produc);
	descripcion_par(super_produc);
	produc_economico(super_produc);

	readln();
	end.
