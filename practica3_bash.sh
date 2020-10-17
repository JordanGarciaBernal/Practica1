#!/bin/bash

function Obtener_anime()
{
curld=https://trace.moe/api/search?url=
Anime_completo=$curld$1
#curl -s $Anime_completo > Anime.txt
curl -s $Anime_completo > "$2".txt
}
echo "Script que pide al usuario un URL de una imagen y pone en un archivo de texto la informacion de este"
Condicional=1
while [ $Condicional -ge 1 ]
do
        echo "Introduzca la URL del frame del anime del que desea tener informacion(procure que esta este disponible publicamente): "
        read Anime
        Resultado=$(curl -sIL $Anime | grep '^HTTP' | tail -1 | awk  '{print $2}')
        #echo $Resultado
        if [ $Resultado -ge 200 ] 2>/dev/null;
        then
                Condicional=0
        else
                echo "Error, no exite la URL escrita o esta caida, introduzca otra" 2>/dev/null
        fi
done
echo "Introduza como se llamara el archivo con la informacion del anime(sin espacios): "
read Ruta
Final=$(Obtener_anime $Anime $Ruta)
$Final


