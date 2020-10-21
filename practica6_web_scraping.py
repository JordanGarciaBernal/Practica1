#!/usr/bin/python3
import os,os.path,time,requests,re
from bs4 import BeautifulSoup as bs
Campeones=[]
print("Obteniendo la informacion sobre los campeones de LOL espero un momento...")
time.sleep(2)
patron = re.compile(r'gPUACV">.[A-Za-z]{0,25}\s?.[A-Za-z]{0,25}?</span>|gPUACV">.[A-Za-z]</span>|gPUACV">.[A-Za-z]{0,25} y .[A-Za-z]{0,25}</span>|gPUACV">.[A-Za-z]{0,25}.\s.[A-Za-z]{0,25}?</span>')
page = requests.get("https://euw.leagueoflegends.com/es-es/champions/")
soup = bs(page.content, 'html.parser')
a = str(soup)
fa = patron.findall(a)
for Campeon in fa[0:]:
	Campeon = Campeon[8:]
	Campeon = Campeon[:-7]
	Campeones.append(Campeon)
s=0
#directorio_actual=os.getcwd()
while s==0:
	os.system("cls")
	print("Eliga una opcion:\n1.Mostrar campeones de la A a la Z\n2.Mostrar campeones de la Z a la A\n3.Mostrar el numero de campeones\n4.Salir")
	op = str(input())
	if op=="1":
		s1 = 0
		os.system("cls")
		c = 1
		Campeones.sort()
		for Campeon in Campeones:
			print(c,".",Campeon)
			c = c+1
		while s1==0:
			print("¿Desea guardarlo en un txt?(1.Si,2.No)")
			op1 = str(input())
			if op1=="1":
				c = 1
				print("Introduzca como se llamara el archivo")
				archivo = str(input())
				file=open(archivo+".txt","a")
				for Campeon in Campeones:
					c = str(c)
					file.write(c)
					file.write(".")
					file.write(Campeon+"\n")
					c = int(c)
					c = c+1
				file.close()
				input("Presione enter para volver al menu")
				s1=1
			elif op1=="2":
				input("Presione enter para volver al menu")
				s1=1
			else:
				print("Error, introduzca una opcion valida")
	elif op=="2":
		s1 = 0
		os.system("cls")
		c = 1
		Campeones.sort(reverse=True)
		for Campeon in Campeones:
			print(c,".",Campeon)
			c = c+1
		while s1==0:
			print("¿Desea guardarlo en un txt?(1.Si,2.No)")
			op1 = str(input())
			if op1=="1":
				c = 1
				print("Introduzca como se llamara el archivo")
				archivo = str(input())
				file=open(archivo+".txt","a")
				for Campeon in Campeones:
					c = str(c)
					file.write(c)
					file.write(".")
					file.write(Campeon+"\n")
					c = int(c)
					c = c+1
				file.close()
				input("Presione enter para volver al menu")
				s1=1
			elif op1=="2":
				input("Presione enter para volver al menu")
				s1=1
			else:
				print("Error, introduzca una opcion valida")
	elif op=="3":
		os.system("cls")
		print(len(Campeones),"campeones")
		input("Presione enter para volver al menu")
	elif op=="4":
		print("Saliendo....")
		time.sleep(2)
		s=1
		os.system("cls")
	else:
		print("Error, opcion no valida, introduzca una opcion valida")
		input("Presione enter para volver al menu")