import mysql.connector 
import json
import datetime
def DHT22_Temp_Data(Data):
    print("Datebase run")                                                                                                     
    conn = mysql.connector.connect(host="localhost",user="root",password="", database="database")
    cursor = conn.cursor()
    sensorId="DH0001"
    temperature=Data.decode("utf-8")
    cursor.execute("""INSERT INTO dht22_temp_data (SensorID, Temperature) VALUES(%s, %s)""",[sensorId,temperature])
    conn.close()
    
def DHT22_Hum_Data(Data):                                                                                                   
    conn = mysql.connector.connect(host="localhost",user="root",password="", database="bdd")
    cursor = conn.cursor()
    sensorId="DH0001"
    humidity=Data.decode("utf-8")
    cursor.execute("""INSERT INTO dht22_hum_data (SensorID, Humidity) VALUES(%s, %s)""",[sensorId,humidity])
    conn.close()

    
def adddata(topic,Data):
    var=topic.split("/")
    if (len(var)>1):
        projet=var[0]
        site=var[1]
        app_nom=var[2]
        met_nom=var[3]
        val=Data.decode("utf-8")
        print("Datebase run") 
        conn = mysql.connector.connect(host="localhost",user="root",password="", database="database")
        cursor = conn.cursor()
        conn.autocommit=True
        cursor.execute("""SELECT id FROM appareil WHERE app_nom = %s """,[app_nom])
        row=cursor.fetchone()
        app_id=int(row[0])
        print(app_id)
        date=datetime.datetime.now()   
        cursor.execute("""INSERT INTO `metrique`(`met_nom`, `met_val`, `met_date`, `app_id`) VALUES(%s, %s, %s, %s)""",[met_nom,val,date,app_id])
        conn.close()
        print('success')