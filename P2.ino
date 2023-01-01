/////




////////////////////////////
// Generated with a lot of love//
// with TUNIOT FOR ESP8266     //
// Website: Easycoding.tn      //
/////////////////////////////////
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define alarme 12
#define lamp1 2
#define lamp2 4
WiFiClient espClient;
PubSubClient client(espClient);

void reconnectmqttserver() {
while (!client.connected()) {
Serial.print("Attempting MQTT connection...");
String clientId = "ESP8266Client-";
 clientId += String(random(0xffff), HEX);
if (client.connect(clientId.c_str())) {
Serial.println("connected");
  client.subscribe("projet1/site1/alarme/alarme");
    client.subscribe("projet1/site1/lamp1/lamp1");
      client.subscribe("projet1/site1/lamp2/lamp2");
} else {
Serial.print("failed, rc=");
Serial.print(client.state());
Serial.println(" try again in 5 seconds");
delay(5000);
}
}
}

void callback(char* topic, byte* payload, unsigned int length) {

  if (strcmp(topic,"projet1/site1/alarme/alarme")==0){
     String MQTT_DATA = "";
  for (int i=0;i<length;i++) {
   MQTT_DATA += (char)payload[i];}
   Serial.println(MQTT_DATA);
   if (MQTT_DATA == "ON") {
    digitalWrite(alarme,HIGH);
    Serial.println("alarme ON");
  }
   if (MQTT_DATA == "OFF") {
    digitalWrite(alarme,LOW);
    Serial.println("alarme OFF");

  }
  
  }

   if (strcmp(topic,"projet1/site1/lamp1/lamp1")==0){
     String MQTT_DATA = "";
  for (int i=0;i<length;i++) {
   MQTT_DATA += (char)payload[i];}
   Serial.println(MQTT_DATA);
   if (MQTT_DATA == "ON") {
    digitalWrite(lamp1,HIGH);
    Serial.println("lamp1 ON");
  }
   if (MQTT_DATA == "OFF") {
    digitalWrite(lamp1,LOW);
    Serial.println("lamp1 OFF");

  }
  
  }

   if (strcmp(topic,"projet1/site1/lamp2/lamp2")==0){
     String MQTT_DATA = "";
  for (int i=0;i<length;i++) {
   MQTT_DATA += (char)payload[i];}
   Serial.println(MQTT_DATA);
   if (MQTT_DATA == "ON") {
    digitalWrite(lamp2,HIGH);
    Serial.println("lamp2 ON");
  }
   if (MQTT_DATA == "OFF") {
    digitalWrite(lamp2,LOW);
    Serial.println("lamp2 OFF");

  }
  
  }


  }



void setup() {
  // put your setup code here, to run once:
  pinMode(alarme, OUTPUT);
  pinMode(lamp1, OUTPUT);
  pinMode(lamp2, OUTPUT);

  Serial.begin(9600);
  WiFi.disconnect();
  delay(3000);
  Serial.println("START");
   WiFi.begin("iPhone de yacine","00000000");
  while ((!(WiFi.status() == WL_CONNECTED))){
    delay(300);
    Serial.print("..");

  }
  Serial.println("Connected");
  Serial.println("Your IP is");
  Serial.println((WiFi.localIP().toString()));
  client.setServer("172.20.10.4", 1883);
  client.setCallback(callback);




}

void loop() {
  // put your main code here, to run repeatedly:
if (!client.connected()) {
    reconnectmqttserver();
    }
    delay(2000);
    int sensorValue = analogRead(A0);
  // print out the value you read:
  Serial.print("Luminosity: ");
  Serial.println(sensorValue);
  client.publish("projet1/site1/photoresistence/luminosity", String(sensorValue).c_str(), true); //publication de l'intensité limineuse sur le topic de la lumiere
  if (sensorValue < 10){
    client.publish("projet1/site1/lamp1/lamp1", "ON", true);
    Serial.println("LAMP 1 ON");
    }
    if (sensorValue > 20){
      client.publish("projet1/site1/lamp1/lamp1", "OFF", true);
      Serial.println("LAMP 1 OFF");
    }
   
    client.loop(); 
}
