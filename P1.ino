#include <ESP8266WiFi.h>;
#include <PubSubClient.h>;
#include <PubSubClient.h>;
#include "DHT.h";   // Librairie des capteurs DHT
#define wifi_ssid "iPhone de yacine" // ssid du point d'acces
#define wifi_password "00000000" // mot de passe du point d'acces
WiFiClient espclient; 

#define DHTPIN 4  // Pin sur lequelle le capteur DHT est branché

#define PIRPIN 2  // Pin sur lequelle le capteur de mouvement est branché


#define DHTTYPE DHT22     //Définition du type de capteuir = DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE);//  Initiatlisation



#define mqtt_serveur "172.20.10.4"
#define mqtt_user ""
#define mqtt_pwd ""
// format des topics projet/site/nom_de_l_appareil/nom_de_la_mesure
#define temperature_topic "projet1/site1/dht22/Temperature" // topic sur le quel est publier la temperature
#define humidity_topic "projet1/site1/dht22/Humidity" //topic sur le quel est publier l'Humidity
#define movement_topic "projet1/site1/pir/movement" //topic sur le quel est publier la presence de mouvement

PubSubClient client(espclient);

void setup() {
  pinMode(PIRPIN, INPUT);
    Serial.begin(9600);
    dht.begin();
    delay(10);
    setup_wifi();
    delay(5000);
    client.setServer(mqtt_serveur,1883);
}


//Connexion au réseau WiFi
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connexion a ");
  Serial.println(wifi_ssid);

  WiFi.begin(wifi_ssid, wifi_password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("Connexion WiFi etablie ");
  Serial.print("=> Addresse IP : ");
  Serial.print(WiFi.localIP());
}

//Reconnexion
void reconnect() {
  //Boucle jusqu'à obtenur une reconnexion
  while (!client.connected()) {
    Serial.print("Connexion au serveur MQTT...");
    if (client.connect("ESP8266Client", mqtt_user, mqtt_pwd)) {
      Serial.println("Connected");
    } else {
      Serial.print("KO, erreur : ");
      Serial.print(client.state());
      Serial.println(" On attend 5 secondes avant de recommencer");
      delay(5000);
    }
  }
}


void loop() {
   if (!client.connected()) {
    reconnect();
  }
char * sensorID="DHT0001_";
float h = dht.readHumidity();    // Lecture du taux d'humidité
float t = dht.readTemperature();  // Lecture de la température en Celcius
float f = dht.readTemperature(true);  
if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  Serial.print("Humidity: ");
  Serial.print(h);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(t);
  Serial.print(" *C "); 

client.publish(temperature_topic, String(t).c_str(), true);   //Publie la température sur le topic temperature_topic
client.publish(humidity_topic, String(h).c_str(), true);   //Publie la température sur le topic humidity_topic
if (digitalRead(PIRPIN)==1)
{
  client.publish(movement_topic, "1", true); //Publie la presence de mouvement sur le topic 
  client.publish("projet1/site1/alarme/alarme", "ON", true);  //publie sur le topic pour allumer la led 
   Serial.print("Mouvement");
  }
  else{
    client.publish(movement_topic, "0", true); 
    client.publish("projet1/site1/alarme/alarme", "OFF", true);  
    }
    
    Serial.println("wait 0.5 sec...");
    delay(5000);
    client.loop();
}
