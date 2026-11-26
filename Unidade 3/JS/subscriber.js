const mqtt = require("mqtt");
const client = mqtt.connect(`mqtt://${process.env.MQTT_HOST || "localhost"}:1883`);

client.on("connect", () => {
  console.log("Conectado ao broker");
  client.subscribe("lab/temperatura");
});

client.on("message", (topic, message) => {
  console.log(`${topic}: ${message.toString()}`);
});