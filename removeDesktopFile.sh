#!/bin/bash
echo "INFO - Cleaning Desktop File For $1"
if cd /opt/mycroft/skills/$1
then
cd /opt/mycroft/skills/$1/res/desktop/
echo "Fetching Desktop File Name"
desktopFileName="*.desktop"
founddname=$(echo $desktopFileName)
echo "Info - Removing Skill Desktop File $founddname"
rm ~/.local/share/applications/$founddname
fi
