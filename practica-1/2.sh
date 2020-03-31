#!/bin/bash
# 2. Implemente un script que reciba como parámetro el nombre de un proceso e informe cada
# 15 segundos cuántas instancias de ese proceso están en ejecución.i

function usage() {
	echo "Modo de uso: 2.sh nombreproceso"
}

if [ $# -lt 1 ]
then
	usage
	exit -1
fi

process_name=$1

for ((;;))
do
	instances=`ps -e | grep $process_name | wc -l`
	echo "Instancias del proceso $process_name: $instances"
	sleep 15
done

exit 0
