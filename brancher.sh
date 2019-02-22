#!/bin/bash
cd $1
echo "INFO - Skill folder $1"
echo "INFO - Skill branch $2"
echo "INFO - Installing GUI Skill Branch"
git fetch
git checkout $2 && git reset --hard origin/$2
echo "INFO - Mycroft GUI Branch Installed"
echo "INFO - Installing Requirements Workaround"
source /opt/mycroft/.venv/bin/activate
pip install -r requirements.txt
echo "INFO - Installed Requirements"
