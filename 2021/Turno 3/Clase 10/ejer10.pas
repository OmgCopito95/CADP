{10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. Al finalizar la
lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países.
}
program ejer;
type
	string20=string[20];
	meses=1..12;

	planta=record
		nombre_cien:string20;
		prome_vida:meses;
		tipo_planta:string20;
		clima:string20;
		paises:string20;
	end;

procedure carga(var p:plantas);
	begin
		write('Ingrese el paise donde se las encuentra, su nombre cientifico,');
		writeln(' tiempo promedio de vida (en meses), tipo de planta y clima');
		readln(p.paises);
		if (p.paises <> 'zzz') then begin
			readln(p.nombre_cien);
			readln(p.prome_vida);
			readln(p.tipo_planta);
			readln(p.clima);
		end;	
	end;

	procedure menor_tipo(tipo_planta:string20; cant_tipo:integer; var min_nombre:string20; var minimo:integer);
		begin
			if (cant_tipo < minimo) then begin
				minimo:=cant_tipo;
				min_nombre:=tipo_planta;
			end;
		end;

	function vida_promedio(cant_vida:integer; cant_tipo:integer):real;
		begin
			vida_promedio:=cant_vida/cant_tipo;
		end;

	procedure maximo(nombre_cien:string20; prome_vida:integer; var max1, max2:integer; var nom1, nom2:string20);	
		begin
			if (prome_vida > max1) then begin
				max2:=max1;
				nom2:=nom1;
				max1:=prome_vida;
				nom1:=nombre_cien;
			end
			else if (prome_vida > max2) then begin
				max2:=prome_vida;
				nom2:=nombre_cien;
			end;
		end;

	function plantas_argentina(paises, clima:string20):boolean;
		begin
			plantas_argentina:=((paises = 'argentina') and (clima = 'subtropical'));
		end;

	procedure cant_paises(nombre_cien:string20; var cant_tipo, max_paises:integer; var nombre_paises:string20);
		begin
			if (cant_tipo > max_paises) then
				max_paises:=cant_tipo;
				nombre_paises:=nombre_cien;
		end;	

	var
		especie:plantas;
		minimo, cant_tipo, cant_vida, max1, max2, max_paises:integer;
		actual, min_nombre, actual_pais, nom1, nom2, nombre_paises:string20;
		resultado:real;

	begin
		max1:=-1;
		max2:=-1;
		minimo:=200;
		max_paises:=0;

        for(i:=1 to 320)do begin //cada iteracion es una especie

		  carga(especie);

		  while (especie.paises <> 'zzz') do begin  //corte de lectura

			  actual:=especie.tipo_planta;
			  writeln('cambio de planta inicio');{chequeo}
                          cant_vida:= 0;
                          cant_tipo:=0;
                          cantPaises:=0;
			  while (especie.paises <> 'zzz') and (actual = especie.tipo_planta) do begin

				  actual_pais:=especie.paises;

				  maximo(especie.nombre_cien, especie.prome_vida, max1, max2, nom1, nom2);

				  while (especie.paises <> 'zzz') and (actual_pais = especie.paises) do begin

					  //if (especie.tipo_planta = actual) then
					  cant_tipo:=cant_tipo+1;

					  cant_vida:=cant_vida+especie.prome_vida;

					  if (plantas_argentina(especie.paises, especie.clima)) then begin
						  write('Los nombres de las plantas nativas de Argentina que se ');
						  writeln(' encuentran en regiones con clima subtropical es ', especie.nombre_cien);
					  end;

					  carga(especie);
					  writeln('el tercer while');{chequeo}
					  writeln(cant_tipo);{chequeo}
					  writeln(cant_vida);{chequeo}

				  end; //cambio de pais

                                  cantPaises:=cantPaises+1; //cuenta la cant de paises donde esta la planta
				  menor_tipo(especie.tipo_planta, cant_tipo, min_nombre, minimo);

			  end; //cambio tipo planta
                          cant_paises(especie.nombre_cien, cantPaises, max_paises, nombre_paises);

			  writeln('cambio de planta fin y sale function');
			  writeln('El tiempo promedio de vida de las plantas ',actual,' es de ',vida_promedio(cant_vida, cant_tipo):4:2);
		  end;

        end;    //final del for
        writeln('El tipo de planta con menor cantidad de plantas ',min_nombre);
        writeln('El nombre cientifico de las dos plantas mas longevas es ',nom1,' y ', nom2);
        writeln('El nombre de la planta que se encuentra en mas paises es ',max_paises);
end.
