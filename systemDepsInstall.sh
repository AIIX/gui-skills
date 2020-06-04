#!/bin/bash
cd ~/mycroft-core
source .venv/bin/activate
cd /tmp
python3 handle_sys_deps.py /opt/mycroft/skills/$1
