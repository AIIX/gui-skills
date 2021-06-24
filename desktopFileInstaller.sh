#!/bin/bash

if [ ! -n "$1" ];then
    echo "### DeskopFile Installer Error: Missing main (skill folder) parameter!"
    sleep 2
    exit 1
fi


if [ ! -d "~/.local/share/applications" ]; then
    cd ~/.local/share/
    mkdir -p applications
fi
if [ ! -d "~/.local/share/icons" ]; then
    cd ~/.local/share/
    mkdir -p icons
fi

if cd $1 
then
echo "INFO - Skill folder $1"
echo "INFO - Installing Desktop Files"
if [ -d "res/icon" ]; then
    cd res/icon
    cp -r * ~/.local/share/icons
    cd $1
fi
cd res/desktop
cp -r * ~/.local/share/applications
echo "INFO - Desktop File Installed"
else 
    echo "### DeskopFile Installer Error: Cannot change direcory!"
    sleep 2
fi