#!/bin/zsh

zparseopts -D  -A opts -- s l:

DIRNAME=$(dirname $0)
TARGET=$1
TARGETS=(sbx stg kanto)
CONNECTIONS=$(nmcli --fields=NAME,UUID,ACTIVE,STATE -t c show | awk -F: -f $DIRNAME/nmcliJson.awk  | hjson -j)

function is_enabled()
{
    if [ `echo $CONNECTIONS | jq --arg c $1 '.[$c].enabled'` = '"yes"' ]; then
        echo "true"
    fi
}

for i in $TARGETS; do
    if [ $(echo $CONNECTIONS | jq ".$i.enabled") = '"yes"' ]; then
       echo " $i"
       exit;
    fi
done
echo ""
