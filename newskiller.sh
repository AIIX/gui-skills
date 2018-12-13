#!/bin/bash
cd /opt/mycroft/skills
if [ -z "$2" ]
##Stage1 New Skill
then
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}')
  if (cd /opt/mycroft/skills/$oname.*/ui/) > /dev/null 2>&1 
  then
     echo "INFO - Installing GUI Skill: $oname"
     cd /opt/mycroft/skills/$oname.*/ && git checkout $3 && git reset --hard origin/$3
     echo "INFO - Mycroft GUI Skill: $oname Installed"
  else
     echo "INFO - Skill: $oname doesn't have an UI folder skiping UI installation"
     echo "INFO - Mycroft Skill: $oname Installed"
  fi
##Stage2 Replace Orginal Skill
else
  cd /opt/mycroft/skills/ && rm -rf $2
  cd ~/mycroft-core
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}')
  gname=$(echo $2 | awk -F"." '{print $1}')
  cd /opt/mycroft/skills/ && mv $oname.* $2
  if (cd /opt/mycroft/skills/$2/ui/) > /dev/null 2>&1
  then
    echo "INFO - Installing GUI Skill: $gname"
    cd /opt/mycroft/skills/$gname.*/ && git checkout $3 && git reset --hard origin/$3
    echo "INFO - Mycroft GUI Skill: $gname Installed"
  else
     echo "INFO - Skill: $gname doesn't have an UI folder skiping UI installation"
     echo "INFO - Mycroft Skill: $gname Installed"
  fi
fi
