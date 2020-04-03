#!/bin/bash

#Desarrolle un script que reciba en su entrada estándar una lista de hosts con el puerto 80
#abierto y, para cada uno, realice un requerimiento HTTP GET a la URI raíz y devuelva el
#valor del campo Content-Length de la respuesta. Deberá ser posible utilizar como entrada
#estándar la salida estándar del script anterior.


read -t 0.5 hosts
for host in $hosts
do
	contentlength=`printf "GET / HTTP/1.1\r\nHost: $host\r\n\r\n" | nc $host 80 | grep "content-length:" -i | cut -d : -f2`
	if [[ ${contentlength} =~ [0-9] ]] ; then
		echo "$host:$contentlength"
	fi
done
exit 0
