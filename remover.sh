#!/bin/bash
echo $1
echo "Removing Skill $1"
cd /opt/mycroft/skills && rm -rf $1
cd /opt/mycroft/skills/ui/skills && rm -rf $2 
