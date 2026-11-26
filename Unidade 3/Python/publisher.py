import os
import time
import random
import paho.mqtt.client as mqtt

client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
client.connect(os.getenv("MQTT_HOST", "localhost"), 1883)
client.loop_start()

while True:
    temp = round(random.uniform(20, 30), 1)
    client.publish("lab/temperatura", temp)
    print("Publicado:", temp)
    time.sleep(2)