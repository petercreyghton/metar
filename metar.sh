#!/bin/sh

# get metar page and filter info
curl -Ls http://knmi.nl/nederland-nu/luchtvaart/vliegveldwaarnemingen | tr "\n" "|" | grep -o '<pre.*</pre>' | tr "|" "\n" | grep -v "<pre" |grep -v "pre>" |grep -v "ZCZC"| while read line; do echo -n "$line"; if [ "$line" == "" ]; then echo ""; fi ; done | tr -s " " > data.txt


for i in eham ehdl ehlw ehbk eheh ehgg ehwo ehrd ehgr ; do 
    line="$(date +"%F %H:%M:%S") $(cat data.txt |grep -i $i)"
    echo "$line"
done
