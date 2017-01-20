#!/bin/sh
 
curl -Ls http://knmi.nl/nederland-nu/luchtvaart/vliegveldwaarnemingen \
    | tr "\n" "|" \
    | grep -o '<pre.*</pre>' \
    | tr "|" "\n" \
    | grep -v "<pre" |grep -v "pre>" \
    |grep -v "ZCZC" \
    | while read line; do \
        echo -n "$line"; \
        if [ "$line" == "" ]; \
        then echo ""; \
        fi ; \
    done \
    | tr -s " " \
    | sort -k3 \
\
    | grep -i -e eham -e ehdl -e ehlw -e ehbk -e eheh -e ehgg -e ehwo -e ehrd -e ehgr \
    | while read line; do echo $(date +"%F %H:%M:%S") $line; done


