#!/bin/bash


if [ ! -n "$1" ];then
    echo "### Remover Error: Missing main (skill name) parameter!"
    exit 1
fi

echo "INFO - Removing Skill $1"
if cd /opt/mycroft/skills/$1 2>/dev/null
then
cd /opt/mycroft/skills && rm -rf $1
oname=$(echo $1 | awk -F"." '{print $1}')
  if (cd /opt/mycroft/skills/ui/skills/$oname) > /dev/null 2>&1
  then
    cd /opt/mycroft/skills/ui/skills && rm -rf $oname 
    echo "INFO - Removed $oname"
  else
    echo "INFO - Removed $1"
  fi
else
    echo "INFO - Skill $1 not installed or not found"
    sleep 2
fi
