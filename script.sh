#!/bin/bash
declare -r SERVER_HOST_IP=('localhost' '142.250.64.142')

while :
do

for i in "${SERVER_HOST_IP[@]}"
    do        
        curl http://${i}:3000 -w ", %{http_code}"
        if [ $? -eq 0 ]
        then
        STATE="$(curl http://${i}:3000 -w"#%{http_code}")"
        sFileDate="$(date +"%d/%m/%y#%H:%M:%S#${i}#online")#$STATE"
        echo $sFileDate>>info.log
        else 
        date +"%d/%m/%y#%H:%M:%S#${i}#offline">>info.log
        fi
    done
sleep 10
done