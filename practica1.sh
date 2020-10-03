#!/bin/bash
function apis(){

printf "La IP del dispositivo es: "
curl --GET "https://www.passwordrandom.com/query?command=ip"
printf "\nEl agente del usuario es: \n"
curl --GET "https://www.passwordrandom.com/query?command=useragent"
printf "\nLa contraseña generada es: \n"
curl --GET "https://www.passwordrandom.com/query?command=password"
}

apis


