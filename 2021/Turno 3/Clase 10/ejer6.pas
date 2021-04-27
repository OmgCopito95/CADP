{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.).La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}
program ejer;
type
	string20=string[20];

	micro = record
		marca:string20;{La información de los microprocesadores se lee de forma consecutiva por marca de}
		linea:string20;
		cant_nucleos:integer;
		velo_nucleos:integer;
		tamanio:integer;
	end;
	
	procedure carga(var p:micros);
		begin
			writeln('Ingrese la cantidad de cores, marca, linea, velocidad del reloj y tamanio (nm).');
			readln(p.cant_nucleos);
			if (p.cant_nucleos > 0) then begin
				readln(p.marca);
				readln(p.linea);
				readln(p.velo_nucleos);
				readln(p.tamanio);
			end;
		end;
//corregir modulo
	procedure maximo(p:micros; var marca1, marca2:string20; var cant_nucleos1, cant_nucleos2:integer);
		begin
			if (p.cant_nucleos > cant_nucleos1) then begin
				cant_nucleos2:=cant_nucleos1;
				marca2:=marca1;
				cant_nucleos1:=p.cant_nucleos;
				marca1:=p.marca;
			end
			else
			if (p.cant_nucleos > cant_nucleos2) then begin
				cant_nucleos2:=p.cant_nucleos;
				marca2:=p.marca;
			end;
		end;	

	var
		producto:micros;
		marca1, marca2, actual:string20;
		cant_nucleos1, cant_nucleos2, cant_multinucleo:integer;
	begin
	        cant_multinucleo:=0;
		cant_nucleos1:=0;
		cant_nucleos2:=0;

		carga(producto);

		while (producto.cant_nucleos > 0) do begin

			actual:=producto.marca;
                        cantProc14 := 0; //se resetea cuando cambia de marca

			while (producto.cant_nucleos > 0) and (actual = producto.marca) do begin{entra en una marca}

                                //----------- modularizar ->    procedure
				if (producto.cant_nucleos > 2) and (producto.tamanio <= 22) then begin
					write('La Marca y linea de todos los procesadores de mas de 2');
					writeln(' cores con transistores de a lo sumo 22 nm es ',producto.marca,' y ', producto.linea);
				end;
                                //--------------------------------

				if (producto.tamanio = 14) then   //cuenta la cant de proc de 14nm de una misma marca
                                        cantProc14 := cantProc14 +1;

				if (producto.cant_nucleos > 1) and (producto.velo_nucleos <= 2) then
					cant_multinucleo := cant_multinucleo+1;

				carga(producto);
			end;{sale de la marca}

                        maximo(cantProc14, actual , marca1, marca2, cant_nucleos1, cant_nucleos2);
		end;
		writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm es ',marca1,' y ',marca2);
		write('La Cantidad de procesadores multicore de Intel o AMD, cuyos relojes alcancen');
		writeln(' velocidades de al menos 2 Ghz. ',cant_multinucleo);
		readln();
	end.






















