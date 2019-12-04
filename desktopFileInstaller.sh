#!/bin/bash
if [ ! -d "~/.local/share/applications" ]; then
    cd ~/.local/share/
    mkdir applications
fi
cd $1
echo "INFO - Skill folder $1"
echo "INFO - Installing Desktop Files"
cd res/desktop
cp -r * ~/.local/share/applications
echo "INFO - Desktop File Installed"
