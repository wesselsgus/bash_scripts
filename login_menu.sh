#!/bin/bash

title="Easy SSH"
items=("Nucleus" "Homer" "Lisa" "ose-comsol-01" "ose-comsol-02")
prompt="Select connection"

nucleus () {
	echo ""
	echo "Connecting to Nucleus...."
	ssh nucleus
}

homer () {
	echo ""
	echo "Connecting to Homer...."
	ssh homer
}

lisa () {
	echo ""
	echo "Connecting to Lisa"
	ssh lisa
}

ose-comsol-01 () {
	echo ""
	echo "Connecting to ose-comsol-01"
	ssh comsol1
}

ose-comsol-02 () {
        echo ""
        echo "Connecting to ose-comsol-02"
        ssh comsol2
}


while item=$(zenity --title="$title" --text="$prompt" --list \
               --column="Hosts" "${items[@]}")
do
    case "$item" in
        "${items[0]}") nucleus echo "Connecting to Nucleus";;
        "${items[1]}") homer echo "Connecting to Homer ";;
        "${items[2]}") lisa echo "Connecting to Lisa";;
	"${items[3]}") ose-comsol-01 "Connecting to ose-comsol-01";;
	"${items[4]}") ose-comsol-02 "Connecting to ose-comsol-02";;
        *) echo "Ooops! Invalid option.";;
    esac
done


