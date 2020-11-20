#!/usr/bin/python3
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import json
import argparse

#INICIO MODIFICACION

parser = argparse.ArgumentParser(description = 'Envio de un mensaje a correos listados en un txt')
parser.add_argument('-l', help='Nombre de la lista con extension txt que contiene los correos a los cuales mandar el mensaje')
parser.add_argument('-m', help='Mensaje a enviar a los correos de la lista')
args = parser.parse_args()

correo_remitente =str(args.l)
message = str(args.m)
#FIN MODIFICACION



data = {}
with open('pass.json') as f:
	data = json.load(f)
# create message object instance
msg = MIMEMultipart()


# setup the parameters of the message

msg['From'] = data['user']

msg['To'] = correo_remitente
msg['Subject'] = "Hola"

# add in the message body
msg.attach(MIMEText(message, 'plain'))

#create server
server = smtplib.SMTP('smtp.office365.com:587')

server.starttls()

# Login Credentials for sending the mail
print(data['user'])
server.login(data['user'], data['pass'])

# send the message via the server.
server.sendmail(msg['From'], msg['To'], msg.as_string())

server.quit()

print("successfully sent email to %s:" % (msg['To']))

