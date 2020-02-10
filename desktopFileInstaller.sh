#!/bin/bash
if [ ! -d "~/.local/share/applications" ]; then
    cd ~/.local/share/
    mkdir applications
fi
if [ ! -d "~/.local/share/icons" ]; then
    cd ~/.local/share/
    mkdir icons
fi
cd $1
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
