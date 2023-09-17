#!/bin/bash

#grep "rtc_time" /proc/driver/rtc | awk '{print "hora:"$3}'
#grep "rtc_date" /proc/driver/rtc | awk '{print "fecha:"$3}'

# Lo que hacemos con este comando es leer el tiempo desde /proc/uptime, este es el tiempo encendido del sistema
#y lo resta al tiempo actual del sistema que se obtiene desde systime(), luego usamos strftime para dar formato al resultado com una cadena 

awk 'BEGIN {now =systime()-/proc/uptime; print strftime("Estamos a :%Y-%m-%d  y la hora es: %H:%M:%S", now)}' /proc/uptime
