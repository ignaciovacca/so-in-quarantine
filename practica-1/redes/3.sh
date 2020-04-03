#!/bin/bash
#Desarrolle un script que reciba en su entrada estándar una lista de hosts e imprima en su
#salida estándar únicamente aquellos que tienen el puerto 80 abierto. Cuando un host no
#tiene el puerto 80 abierto, netcat tardará varios segundos en determinar que la conexión
#no se puede establecer


function usage() {
	echo "Modo de uso: 3.sh HOST... "
}

if [ $# -lt 1 ]
then
	usage
	exit -1
fi

for host in $*
do	
	`nc -z -w1 $host 80 2>/dev/null`
	if [ $? -eq 0 ] #Si es 0 tiene el puerto abierto, si es 1 no
	then
		printf "$host "
	fi
done
exit 0
