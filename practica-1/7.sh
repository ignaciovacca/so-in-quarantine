#!/bin/bash
#Un escritor tiene organizados los capítulos de su próximo libro en distintos archivos de
#texto plano en un mismo directorio, y le ha solicitado ayuda para concatenar el contenido
#de cada uno de ellos en un único archivo final llamado libro.txt, de modo tal que éste
#último contenga el texto de todos los otros archivos, uno luego del otro. Puede asumir que
#los archivos de los capítulos tienen nombres alfabéticamente ordenados: capitulo-01.txt,
#capitulo-02.txt, ..., capitulo-48.txt, por ejemplo.

if [ -f libro.txt ]; then rm libro.txt; fi

for f in `find "." -mindepth 1 -maxdepth 1 -type f -name "*.txt" | sort`
do
	cat $f | tr -d '\n' >> libro.txt
done
exit 0

