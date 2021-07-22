# Home Assistant Add-on for AquapureD daemon 
## (Daemon by sfeakes https://github.com/sfeakes/AquapureD).

Options are stripped down from original daemon (no GPIO control, no Domoticz support, no One-Wire Devices).

There are two expected errors that should appear in the log.
 - Error:  Open file failed '/tmp/aquapure.cache'
 - GPIO Pi: Failed to open '/dev/mem' or '/dev/gpiomem' for GPIO access (are we root?)
 
There is no /tmp/aquapure.cache file in the image - it's not required for it to work.  
The GPIO pins have not been mapped. Requires disabling AppArmor.

It is common to receive the following warnings occasionally due to signal quality/tranmission errors.
- Warning:Serial read timeout
- Warning:BAD PACKET

You may get the following error message occasionally due to signal quality/tranmission errors. Receiving this error frequently and repeatedly (every few seconds) means something is not setup correctly. Check all connections and SWG device protocol. 
- Error:  Too many no-reply from SWG, calling connection dead

All original files are included in the Add-on.

### As per original daemon - this is not a plug and play setup. Some knowledge of electricity and serial communication is required to set this up. 

This is my first attempt at an Add-on/Docker setup - it works for me. Current setup is Zodiac TRiChlorinator SWG connected with 2-wire copper phone cable to a CP2102 USB to UART plugged directly into my Home Assistant instance on a Raspberry Pi 4 Model B.

Next stage is to add in a python script to setup Home Assistant MQTT discovery.

See edited readme.md from aquapured below

-----------------------------------------------------------------------------------------------

## aquapureD  
linux daemon to control Aquapure SWG without the need for a pool control panel.

## Note
This is still in beta mode.

### Currently supported
SWG using Jandy protocol (this is most SWG, including Pentair).
MQTT, Web API, Web Sockets and Basic Web UI

### Web API
#### (note this is HTTP, not HTTPS)
```
http://ip.address:port                              (web ui)
http://ip.address/?command=status                   (return JSON status)
http://ip.address/?command=swg_percent&value=50     (Set SWG Percent to 50)
http://ip.address/?command=swg&value=on             (Set SWG on or off)
```

### MQTT status
#### Status posted.  0=off 1=on, unless otherwise stated
```
aquapured/SWG                (0 off, 2 on and generating salt.)
aquapured/SWG/enabled        (0 off, 2 on but not generating salt - SWG reported no-flow or equiv.)
aquapured/SWG/Percent        (SWG Generating %, i.e. 50, value between 0 and 101. 101 is Boost)
aquapured/SWG/fullstatus     (0 on, 1 no flow, 2 low salt, 4 high salt, 8 clean cell, 9 turning off, 16 high current, 32 low volts, 64 low temp, 128 check PCB, 255 off)
aquapured/SWG/PPM            ( SWG Parts Per Million i.e. 3100)
aquapured/SWG/Boost          ( Boost on or off, 1 or 0)
```
### Make requests over MQTT
#### Add /set to topic and messages are 0=off, 1=on or number between 1 and 100 for percent. 
```
aquapured/SWG/set           (Message is 0 or 1, Not really relevant on many systems, will depend on physical Pump to SWG wiring)
aquapured/SWG/Percent/set   (Message is number between 0 and 100)
aquapured/SWG/Boost/set     (Message is 0 or 1)
```

