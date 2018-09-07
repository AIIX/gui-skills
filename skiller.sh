#!/bin/bash
cd /opt/mycroft/skills
if [ -z "$2" ]
then
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
else
  cd /opt/mycroft/skills/
  rm -rf $2
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
  mv $1.* $2
fi
