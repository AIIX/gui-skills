#!/bin/bash
cd $1
echo "INFO - Installing GUI Skill Branch"
git fetch
git checkout $2 && git reset --hard origin/$2
echo "INFO - Mycroft GUI Branch Installed"
