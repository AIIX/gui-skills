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

echo "INFO - Skill folder $1"
echo "INFO - Updating GUI Skill"
echo "INFO - Updating Requirements"
cd $MYCROFT_CORE || exit
source .venv/bin/activate
cd $1
git pull
pip install -r requirements.txt
echo "INFO - Installed Requirements"
echo "INFO - Refreshing Skill"
touch __init__.py
echo "INFO - Skill Update Completed"
