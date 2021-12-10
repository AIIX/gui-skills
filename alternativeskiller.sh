#!/bin/bash

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
 elif [ -x /opt/mycroft-core/start-mycroft.sh ] ;then
    cd /opt/mycroft-core|| exit
    MYCROFT_CORE=/opt/mycroft-core
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

if [ ! -n "$1" ];then
    echo "### AlternativesKiller Error: Missing main (name) parameter!"
    sleep 2
    exit 1
fi

# skills default path, is important
cd /opt/mycroft/skills
if [ -z "$2" ]
##Stage1 New Skill
then
  cd $MYCROFT_CORE || exit
  source .venv/bin/activate
  oname=$(echo $1 | awk -F"/" '{print $5}')
  echo "INFO - Installing GUI Skill: $oname"
  rm nohup.out
  nohup msm install $1
  cat nohup.txt
##Stage2 Replace Orginal Skill
else
  cd /opt/mycroft/skills/ && rm -rf $2
  cd ~/mycroft-core
  source .venv/bin/activate
  rm nohup.out
  nohup msm install $1
  cat nohup.txt
  oname=$(echo $1 | awk -F"/" '{print $5}')
  gname=$(echo $2 | awk -F"." '{print $1}')
  cd /opt/mycroft/skills/ && mv $oname.* $2
fi
 
