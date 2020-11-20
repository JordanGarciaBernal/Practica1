#!/bin/bash

echo "Ingrese el nombre de la lista con extension txt que contenga los correos a enviar el mensaje: "
read lista
echo "Ingrese el contenido del mensaje a enviar a los correos: "
read correos


cat $lista | xargs -I {} python practica9_correo.py -l {} -m "$correos"

