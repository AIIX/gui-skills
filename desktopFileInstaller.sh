#!/bin/bash
cd $1
echo "INFO - Skill folder $1"
echo "INFO - Installing Desktop Files"
cd res/desktop
cp -r * ~/.local/share/applications
echo "INFO - Desktop File Installed"
