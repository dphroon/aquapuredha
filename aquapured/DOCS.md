# Configuration options

### [AQUACONTROLD] (required)
 - Header- don't remove.

### LOG_LEVEL=DEBUG_SERIAL (required)
 - The log level. [DEBUG_SERIAL, DEBUG, INFO, NOTICE, WARNING, ERROR]
   Pick the highest level, and all levels below will be sent to log.
   So, NOTICE also prints WARNING & ERROR, DEBUG_SERIAL would print everything possible

### SWG_DEVICE_ID = 0x50 (required)
 - 0x50 is Jandy normal SWG, 0xB0 is Zodiac Tri SWG with Chem (Ph,ORP)

### WEB_DIRECTORY=./aquapured/web/ (required)
 - don't change. Internal web files path.

### WEB_PORT=80 (required)
 - TCP socket port for accessing web control.

### SERIAL_PORT=/dev/ttyUSB0 (required)
 - The serial port to access RS485 devices. I recommend using /dev/serial/by-id rather than /dev/tty***

### MQTT_ADDRESS = mqttserver:1883 (required)
### MQTT_USER = someuser (required)
### MQTT_PASSWD = somepass (required)
### MQTT_TOPIC = aquapured (required)
 - MQTT settings. MQTT_ADDRESS is ip address with the port, ie. 192.168.1.1:1883  
   MQTT_USER and MQTT_PASSWD are the user and password.  
   MQTT_TOPIC is the device topic

