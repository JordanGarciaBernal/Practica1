#!/bin/bash
#Inicio del programa
#Inicio decodificado primer archivo
Dir_file=$(find /home -name mystery_img1.txt)
separador=$(md5sum $Dir_file)
IFS=' '
read -a p_separada <<< "$separador"
echo "Proceso de comprobacion MD5"
echo "comparando el MD5 del archivo mystery_img1.txt con el original, porfavor espere...";sleep 2
if [ '5db9862819edb16f9ac0f3b1c406e79d' == $p_separada ];
then
        echo "Se ha verificado que el archivo no este corrupto"
        echo "Decodificando el archivo mystery_img1.txt, porfavor espere..";sleep 2
        cat $Dir_file | base64 --decode > mystery_img1_descifrada.jpg
else
        echo "El archivo esta corrupto, se recomienda volver a descargarlo"
fi
#cat $Dir_file | base64 --decode > mystery_img1_descifrada.jpg
#Fin codificado primera imagen
#Inicio decodificado segundo archivo
Dir_file=$(find /home -name mystery_img2.txt)
separador=$(md5sum $Dir_file)
read -a p_separada <<< "$separador"
echo "comparando el MD5 del archivo mystery_img2.txt con el original, porfavor espere...";sleep 2
if [ 'b091a841da98ca516635f4dfea1dbaf5' == $p_separada ];
then
        echo "Se ha verificado que el archivo no este corrupto"
        echo "Decodificando el archivo mystery_img2.txt, porfavor espere..";sleep 2
        cat $Dir_file | base64 --decode > mystery_img2_descifrada.jpg
else
        echo "El archivo esta corrupto, se recomienda volver a descargarlo"
fi
#cat $Dir_file | base64 --decode > mystery_img2_descifrada.jpg
#Inicio codificado tercer archivo
Dir_file=$(find /home -name fcfm.png)
separador=$(md5sum $Dir_file)
read -a p_separada <<< "$separador"
echo "comparando el MD5 del archivo fcfm.png con el original, porfavor espere...";sleep 2
if [ '4260808329804b5f553cf3e3d5a446c6' == $p_separada ];
then
        echo "Se ha verificado que el archivo no este corrupto"
        echo "Codificando el archivo fcfm.png, porfavor espere..";sleep 2
        cat $Dir_file | base64 > fcfm_codificada.txt
else
        echo "El archivo esta corrupto, se recomienda volver a descargarlo"
fi
#cat $Dir_file | base64 > fcfm_codificada.txt
#Inicio codificado cuarto archivo
Dir_file=$(find /home -name msg.txt)
separador=$(md5sum $Dir_file)
read -a p_separada <<< "$separador"
echo "comparando el MD5 del archivo msg.txt con el original, porfavor espere...";sleep 2
if [ '40744679dff4bf36705c00f9cb815579' == $p_separada ];
then
        echo "Se ha verificado que el archivo no este corrupto"
        echo "Codificando el archivo msg.txt, porfavor espere..";sleep 2
        cat $Dir_file | base64 > msg_codificado.txt
else
        echo "El archivo esta corrupto, se recomienda volver a descargarlo"
fi
#cat $Dir_file | base64 > msg_codificado.txt

