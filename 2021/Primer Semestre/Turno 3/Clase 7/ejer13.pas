program ejer;

function peso(A:char):boolean;
	var
		ok:boolean;
	begin
		if (A <> '$') then
			ok:=true
		else
			ok:=false;
		peso:=ok;	
	end;

procedure secuencia_1(var verifica:boolean; var cant:integer);
	var
		A:char;
	begin
		writeln('Ingrese un caracter');
		readln(A);
		while (A <> '%') and (verifica) do begin
			if (a='$') then
				verifica:=false
			else
				cant:=cant+1;
				writeln('Ingrese un caracter');
				readln(A);
		end;	
	end;

procedure secuencia_2(var verifica:boolean; cant:integer);
	var
		B:char;
		cant2, arroa:integer;
	begin
		arroa:=0;
		cant2:=0;
		writeln('Ingrese un caracter');
		readln(B);
		while (B <> '*') and (cant2 <= cant) and (arroa <= 3) do begin
			cant2:=cant2+1;
			if (B = '@') then	
				arroa:=arroa+1;	
			writeln('Ingrese un caracter');
			readln(B);
		end;


	end;

var
	verifica:boolean;
	cant:integer;
begin
	cant:=0;
	verifica:=true;
	secuencia_1(verifica, cant);
	writeln(cant);
	if (verifica) then
		secuencia_2(verifica,cant)
	else
		writeln('A no cumplio');	
	readln();
	end.







 program Hello;
procedure cumpleA (var ok:boolean; var LongA:integer); //verifico si se ok la secuencia de A -en la que no existe el carácter ‘$’-
var
    c:char;
begin
    longA:=0;
    writeln ('Ingrese la primer secuencia de caracteres:');
    readln(c);
    while ((c <>'%') and (ok)) do begin //mientras no llegue al final de la secuencia y ok siga en true
        if (c = '$') then //si existe $ cambio el valor de ok a false
            ok:=false //asi cambio el valor del while y evito seguir procesando
        else begin
            longA:=longA+1;
            readln(c); // si no había $ sigo leyendo...
        end;
    end;
end;

procedure cumpleB(var ok:boolean; longA:integer);
var
    c:char;
    arroba, longB:integer;
begin
    arroba:=0;
    longB:=0;
    writeln ('Ingrese la segunda secuencia de caracteres:');
    readln(c);
    while ((c<>'*') and (ok)) do begin
        longB:=longB+1;
        if (c='@') then
            arroba:=arroba+1;
        if ((longB>longA) or (arroba >3)) then
            ok:=false
        else
           readln(c);
    end;
end;
var
    car:char;
    ok:boolean;
    longA:integer;
begin
    ok:=true;
    cumpleA(ok, longA);
    if ok then begin//entonces se cumplió A porque ok sigue en true
        cumpleB (ok, longA);//bueno acá necesito resolver el tema de las consonantes...
        if (ok) then //se cumplió la secuencia de B porque ok sigue en true
            writeln('¡Se cumplió la secuencia!')
        else writeln('¡NO se cumplió la secuencia B!');
    end
    else writeln('¡NO se cumplió la secuencia A!');
end.






















