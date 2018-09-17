#!/bin/bash
echo "INFO - Removing Skill $1"
if cd /opt/mycroft/skills/$1
then
cd /opt/mycroft/skills && rm -rf $1
oname=$(echo $1 | awk -F"." '{print $1}')
  if cd /opt/mycroft/skills/ui/skills/$oname
  then
    cd /opt/mycroft/skills/ui/skills && rm -rf $oname 
    echo "INFO - Removed $oname"
  else
    echo "INFO - Skill $oname GUI not found"
  fi
else
echo "INFO - Skill $1 not installed or not found"
fi
