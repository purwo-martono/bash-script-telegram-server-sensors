# bash-script-telegram-server-sensors

### Modification of telegram-send from [Konstantin Bogomolov](https://bogomolov.tech/Telegram-notification-on-SSH-login/)

### Don't forget to create [telegram-send](https://github.com/purwo-martono/telegram-send) file first

This bash script will check your processors server temperature

In this example I use Ubuntu Server 16.04 (yes, it's old duh! )

As always, update first on your console box
```
$ sudo apt-get update
``

Get the sensors
```
$ sudo apt-get install sensors
```

Create bash script to call sensors and send it to telegram, ofc with [telegram-send](https://github.com/purwo-martono/telegram-send) I mention before 
```
#!/bin/bash

br=$'\n'
ipAddress=$(hostname -I)
lines=""
sensors | grep '^Core\s[[:digit:]]\+:' | (while read line;
do
  IN="$line"
  arrIN=(${IN/ /})
  lines+="${br}${arrIN[0]} ${arrIN[1]}"
done
telegram-send "SENSORS YOUR_SERVER $ipAddress$lines")
```



