#!/bin/bash
echo "INFO - Cleaning Desktop File For $1"
if cd /opt/mycroft/skills/$1
then
cd /opt/mycroft/skills/$1/res/desktop/
desktopFileName = "*.desktop"
echo "Info - Removing Skill Desktop File $desktopFileName"
rm ~/.local/share/applications/$desktopFileName
fi
