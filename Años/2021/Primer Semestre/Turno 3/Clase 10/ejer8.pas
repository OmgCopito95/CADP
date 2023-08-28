{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un 

código único, un título, el docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, 
el nombre de la escuela y la localidad a la que pertenecen. 

Cada escuela puede presentar más de un proyecto. La información se ingresa ordenada consecutivamente por localidad y, 
para cada localidad, por escuela. Realizar un programa que lea la información de los proyectos hasta que se ingrese el
 proyecto con código -1 (que no debe procesarse), e informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}
program ejer;
type
	string20=string[20];

	datos=record
		dni:integer;
		nombre_profe:string20;
		apelli_profe:string20;
		email:string20;
	end;

	proyecto=record
		codigo:integer;
		titulo:string20;
		docente:datos;
		cant_alumnos:integer;
		nombre_escue:string20;
		localidad:string20;
	end;

	procedure carga_docente(var d:datos);
		begin
			writeln('Ingrese el docente coordinador (DNI, nombre y apellido, email)');
			readln(d.dni);
			readln(d.nombre_profe);
			readln(d.apelli_profe);
			readln(d.email);
		end;

	procedure cargar(var p:proyecto);
		begin
			writeln('Ingrese el codigo y el titulo del proyecto.');
			readln(p.codigo);
			if (p.codigo <> -1) then begin
				readln(p.titulo);
				carga_docente(p.docente);
				writeln('Ingrese la cantidad de alumnos que participan del proyecto, nombre de la escuela y la localidad.');
				readln(p.cant_alumnos);
				readln(p.nombre_escue);
				readln(p.localidad);
			end;
		end;

	procedure maximo(cant_alumnos:integer; nombre_escue:string20; var max1, max2:integer; var nom1, nom2:string20);
		begin
			if (cant_alumnos > max1) then begin
				max2:=max1;
				nom2:=nom1;
				max1:=cant_alumnos;
				nom1:=nombre_escue;
			end
			else
			if (cant_alumnos > max2) then begin
				max2:=cant_alumnos;
				nom2:=nombre_escue;
			end;
		end;

	function parimpar(num:integer):boolean;
		var
			cantpar, cantimpar, num1:integer;
		begin
			num1:=0;
			cantimpar:=0;
			cantpar:=0;
			while (num <> 0) do begin
				num1:= num mod 10;
				if ((num1 mod 2) = 0) then
					cantpar:=cantpar+1
				else
					cantimpar:=cantimpar+1;
				num:= num div 10;	 
			end;
			if (cantpar = cantimpar) then
				parimpar:=true
			else
				parimpar:=false;	
		end;

	function chequeo_localidad(localidad:string20):boolean;
		begin
			chequeo_localidad:=(localidad = 'loma');{en loma va daireaux}
		end;	

	var
	presentaciones:proyecto;
	cant_localidad, cant_escuela, max1, max2:integer;
	actual, nom1, nom2, actual_escuela:string20;
	begin
		max1:=0; 
		max2:=0;
		cant_escuela:=0;
		cargar(presentaciones);
             while(presentacion.codigo <> -1)do begin


		actual:=presentaciones.localidad;
                cant_localidad:=0;//se resetea cuando cambio de localidad

		while (presentaciones.codigo <> -1) and (actual = presentaciones.localidad) do begin{localidad}

			cant_escuela:=cant_escuela+1; //total de escuelas de la convocatoria
			actual_escuela:=presentaciones.nombre_escue;
                        cant_localidad:=cant_localidad+1; //total de escuelas por localidad

                        cantAlumnos:=0;

			while (presentaciones.codigo <> -1) and (actual_escuela = presentaciones.nombre_escue) do begin {escuela}
                                cantAlumnos:=cantAlumnos + presentaciones.cant_alumnos; //sumo la cant total de alumnos de la escuela

				if (chequeo_localidad(presentaciones.localidad)) then begin
					if (parimpar(presentaciones.codigo)) then begin
						write('El Titulo de los proyectos de la localidad de Daireaux cuyo codigo posee');
						writeln(' igual cantidad de digitos pares e impares es ',presentaciones.titulo);
					end;
				end;
			end;{cambio de escuela}
                        maximo(cantAlumnos, actual_escuela, max1, max2, nom1, nom2);


		end;{cambio de localidad}
                writeln('La cantidad de escuelas por cada localidad es ',cant_localidad);

             end;
             //CUANDO TERMINO DE LEER TODOS LOS DATOS
             writeln('Cantidad total de escuelas que participan en la convocatoria 2020 es ', cant_escuela);
             writeln('Los nombres de las dos escuelas con mayor cantidad de alumnos participantes es ',nom1,' y ', nom2);
          end;
        end.
