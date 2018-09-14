#!/bin/bash
echo $1
echo "Removing Skill $1"
cd /opt/mycroft/skills && rm -rf $1
oname=$(echo $1 | awk -F"." '{print $1}')
cd /opt/mycroft/skills/ui/skills && rm -rf $oname 
echo "Removed $oname"
