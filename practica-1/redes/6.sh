#!/bin/bash

#Este script permite al usuario chatear con otra instancia del mismo script. 
#Debe recibir como parametro si va a funcionar como (c)liente o (s)ervidor,
#tambien debera recibir como parametro un nickname para el usuario.
#Para que ande primero se tiene que abrir en el servidor y luego en el cliente

function formatear() {
	while true; do
		read entrada
		echo -e "`date`, $1 says:\n$entrada"
	done 	
}
 
if [ $# -eq 2 ]
then
	if [ $1 == 'c' ]
	then
		cat | formatear $2 | nc localhost 5000
	elif [ $1 == 's' ]
	then
		cat | formatear $2  | nc -l 5000
	fi
	exit 0
else
	echo "Modo de uso: 6.sh MODE('c' o 's') nickname"
	exit 1  
fi
