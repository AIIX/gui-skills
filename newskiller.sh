#!/bin/bash
cd /opt/mycroft/skills
if [ -z "$2" ]
##Stage1 New Skill
then
  cd ~/mycroft-core
  source .venv/bin/activate
  oname=$(echo $1 | awk -F"/" '{print $5}')
  echo "INFO - Installing GUI Skill: $oname"
  msm install $1
##Stage2 Replace Orginal Skill
else
  cd /opt/mycroft/skills/ && rm -rf $2
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}')
  gname=$(echo $2 | awk -F"." '{print $1}')
  cd /opt/mycroft/skills/ && mv $oname.* $2
fi
