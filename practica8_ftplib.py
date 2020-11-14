#!/usr/bin/python3
import ftplib
def recursiva():
	Elementos = ftp.nlst()
	Elementosprop = []
	ftp.retrlines('LIST',Elementosprop.append)
	#print(Elementosprop)
	for elemento in Elementos:
		if(Elementosprop[Elementos.index(elemento)].startswith('dr')):
			#print(ftp.nlst())
			#print("Entrando a",Elementosprop[Elementos.index(elemento)])
			#print(elemento)
			ftp.cwd(elemento)
			#print("CHANGE")
			#print(ftp.nlst())
			recursiva()
		else:
			if(elemento.endswith('.txt') or elemento.endswith('.msg') or elemento =="README" or elemento.startswith("README")):
				print("Archivo",elemento,"Descargado")
				with open(elemento, 'wb') as fp:
					ftp.retrbinary(f'RETR '+elemento, fp.write)	
	ftp.cwd("..")

def cliente_ftp_conexion(servidor, nombre_usuario, correo):
	global ftp
	ftp = ftplib.FTP(servidor, nombre_usuario, correo)
	recursiva()
	ftp.quit()

RUTA_SERVIDOR_FTP = 'ftp.us.debian.org'
if __name__ == '__main__':
    cliente_ftp_conexion(servidor=RUTA_SERVIDOR_FTP, nombre_usuario='anonymous',correo='nobody@nourl.com')
