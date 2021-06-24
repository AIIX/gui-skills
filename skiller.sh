#!/bin/bash

if [ ! -n "$1" ];then
    echo "### SKiller Error: Missing main (folder) parameter!"
    exit 1
fi

if [ "x86_64" = "$(uname -m)" ] ;then
    LIB="/usr/lib64"
else
    LIB="/usr/lib"
fi

 if [ -x $LIB/mycroft-core/start-mycroft.sh ] ;then
    cd $LIB/mycroft-core || exit
    MYCROFT_CORE=$LIB/mycroft-core
 elif [ -x /var/lib/mycroft-core/start-mycroft.sh ] ;then
    cd /usr/share/mycroft-core|| exit
    MYCROFT_CORE=/var/lib/mycroft-core
 elif [ -x /usr/share/mycroft-core/start-mycroft.sh ] ;then
    cd /usr/share/mycroft-core|| exit
    MYCROFT_CORE=/usr/share/mycroft-core
 elif [ -x $HOME/mycroft-core/start-mycroft.sh ];then
    cd "$HOME/mycroft-core" || exit
    MYCROFT_CORE=$HOME/mycroft-core
 else
    FIND=$(find $HOME -maxdepth 5 -type f -name start-mycroft.sh -print -quit)
    if [ -n "$FIND" ];then
	SOURCE="${FIND}"
	DIR="$( dirname "$SOURCE" )"
	echo "Found MyCroft Core Install Here: $DIR"
	MYCROFT_CORE=$DIR
    else
	echo " ###### Missing Mycroft installation.... exiting ######## "
	exit
    fi
 fi

# skills default path, is important
cd /opt/mycroft/skills
if [ -z "$2" ]
##Stage1 New Skill
then
  cd $MYCROFT_CORE || exit
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}')
  if (cd /opt/mycroft/skills/$oname.*/ui/) > /dev/null 2>&1 
  then
     echo "INFO - Installing GUI Skill: $oname"
     cd /opt/mycroft/skills/$oname.*/ui/ && mkdir -p /opt/mycroft/skills/ui/skills/$oname/ && mv * /opt/mycroft/skills/ui/skills/$oname
     echo "INFO - Mycroft GUI Skill: $oname Installed"
  else
     echo "INFO - Skill: $oname doesn't have an UI folder skiping UI installation"
     echo "INFO - Mycroft Skill: $oname Installed"
  fi
##Stage2 Replace Orginal Skill
else
  cd /opt/mycroft/skills/ && rm -rf $2
  cd $MYCROFT_CORE
  source .venv/bin/activate
  msm install $1
  oname=$(echo $1 | awk -F"/" '{print $5}')
  gname=$(echo $2 | awk -F"." '{print $1}')
  cd /opt/mycroft/skills/ && mv $oname.* $2
  if (cd /opt/mycroft/skills/$2/ui/) > /dev/null 2>&1
  then
    echo "INFO - Installing GUI Skill: $gname"
    cd /opt/mycroft/skills/$gname.*/ui/ && mkdir -p /opt/mycroft/skills/ui/skills/$gname/ && mv * /opt/mycroft/skills/ui/skills/$gname
    echo "INFO - Mycroft GUI Skill: $gname Installed"
  else
     echo "INFO - Skill: $gname doesn't have an UI folder skiping UI installation"
     echo "INFO - Mycroft Skill: $gname Installed"
  fi
fi
