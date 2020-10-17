function Crear-Carpetas{

param($Direccion1,$Carpeta_principal1)

New-Item -Path $Carpeta_principal1 -ItemType Directory -ErrorAction SilentlyContinue
Set-Location -Path $PSScriptRoot
#Get-Location
Get-Content $Direccion1 | ForEach-Object { 
    if($_ -match $regex){ 
     $N_carpeta = $PSScriptRoot
     $N_carpeta = $N_carpeta + "\" + $Carpeta_principal1 + "\" + $_
     New-Item -Path $N_carpeta -ItemType Directory -ErrorAction SilentlyContinue
    } 
} 
}

Write-Host "Programa que crea una carpeta por cada renglon que
haya en un txt especificado por el usuario, ademas de especificarse
el nombre de la carpeta en la cual se guardaran las subcarpetas."
$cont = 1
do{
    $Direccion = Read-Host "Introduzca la ruta del txt"
    $Direccion = $Direccion + ".txt"
    if (Test-Path $Direccion){
        #Write-Host 'Hacer algo con la carpeta'
        $cont = 0
    }else{
        Write-Host 'La ruta especificada no existe, o el archivo no existe, '
        Continue
    }
}while ( $cont -eq 1 )
$Carpeta_principal = Read-Host "Introduzca el nombre de la carpeta que contendra las demas subcarpetas"
Crear-Carpetas -Direccion1 $Direccion -Carpeta_principal1 $Carpeta_principal
