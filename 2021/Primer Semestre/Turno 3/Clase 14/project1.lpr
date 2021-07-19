// ---------------------------- PUNTEROS ------------------------------ //

  variable que guarda una direccion de memoria dinamica
  tipo de dato simple -> una funcion lo puede retornar
  en memoria estatica ocupa 4 bytes
  en memoria dinamica ocupa -> depende el tipo de dato al cual apunte

  p:=q; ->los dos punteros apuntan a la misma direccion de memoria
  ^ ->acceso al dato que apunta el puntero

 new(p); -> reserva un espacio en memoria dinamica
 dispose(p); ->  libera el espacio de memoria
 p:=nil; -> "inicializa" el puntero

 la memoria dinamica "empieza a ocuparse" cuando hago el new de un puntero
 si no hago el new, no ocupa memoria dinamica, solo estatica





