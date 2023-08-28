function EstaOrdenada(l:lista):boolean; //VERIFICA SI LA LISTA ESTA ORDENADA DE MENOR A MAYOR
var
    ordenada: boolean;
    actual,anterior: integer;
begin
    ordenada:=true; //SUPONGO QUE ESTÁ ORDENADA
    actual:=-9999; //LO TENGO QUE INICIALIZAR EN UN NUMERO MUY CHICO ASI AL PRINCIPIO ANTERIOR TOMA UN VALOR
    while (l<>nil) and (ordenada) do begin
        anterior:=actual;
        actual:=l^.num;
        if(anterior > actual) then //VOY COMPARANDO EL ACTUAL CON EL NUMERO ANTERIOR
            ordenada:=false;
        l:=l^.sig;
    end;
    EstaOrdenada:=ordenada;
end;