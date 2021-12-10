#!/bin/bash

if [ ! -n "$1" ];then
    echo "### Dektop File Remove Error: Missing main (filename) parameter!"
    sleep 2
    exit 1
fi


echo "INFO - Cleaning Desktop File For $1"
if cd /opt/mycroft/skills/$1
then
cd /opt/mycroft/skills/$1/res/desktop/
echo "Fetching Desktop File Name"
desktopFileName="*.desktop"
founddname=$(echo $desktopFileName)
echo "Info - Removing Skill Desktop File $founddname"
rm ~/.local/share/applications/$founddname
else 
    echo "### DeskopFile Remover Error: Cannot change direcory!"
    sleep 2

fi
