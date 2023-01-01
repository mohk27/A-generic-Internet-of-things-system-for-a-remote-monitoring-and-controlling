import paho.mqtt.client as mqttClient
import time
from pathlib import Path
from database import *

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print ("Connected to broker")
        global connected  #Use global variable
        connected  = True #Signal connection 
    else:

        print ("Connection failed")

def on_message(client, userdata, message):
    var=message.payload.decode("utf-8")
    var=var.split("_")
    print("Topic:",message.topic)
    print ("Message received: ",var)
    print(var[0])
    adddata(message.topic,var[0])
    
def on_publish(client,userdata,result):             #create function for callback
    print("data published \n")


broker="172.20.10.4"
connected  = False #global variable for the state of the connection
port  = 1883
user  = ""
password  = ""
client  = mqttClient.Client("Python")  #create new instance
client.username_pw_set(user, password=password)  #set username and password
client.on_connect = on_connect  #attach function to callback
client.on_message = on_message  #attach function to callback-
client.on_publish = on_publish 
print("Connecting to broker", broker)
client.connect(broker, port=port) #connect to broker
client.loop_start()
while connected != True: #wait for connection
    time.sleep(0.1)
client.subscribe("#")
try:
    while True:
        time.sleep(1)
        fichier = open("C:/wamp64/www/iot/actionneur.txt", "r") #read topic and value in the file
        data = fichier.readline()
        temp=data.split("_")
        topic=temp[0]
        value=temp[1]
        client.publish(topic,value) #publish the value in the topic         

except KeyboardInterrupt:
    print ("exiting")
    client.disconnect()
    client.loop_stop()
