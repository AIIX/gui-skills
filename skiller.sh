#!/bin/bash
cd /opt/mycroft/skills
if [ -z "$2" ]
then
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
else
  cd /opt/mycroft/skills/ && rm -rf $2
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}') 
  cd /opt/mycroft/skills/ && mv $oname.* $2
fi
