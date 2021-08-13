#!/bin/bash
cd $1
echo "INFO - Skill folder $1"
echo "INFO - Updating GUI Skill"
git pull
echo "INFO - Updating Requirements"
if [ -d /opt/mycroft/.venv/bin/ ]; then
  source /opt/mycroft/.venv/bin/activate
else
  source ~/mycroft-core/.venv/bin/activate
fi
pip install -r requirements.txt
echo "INFO - Installed Requirements"
echo "INFO - Refreshing Skill"
touch __init__.py
echo "INFO - Skill Update Completed"
