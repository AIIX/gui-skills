#!/bin/bash
$1
cd ~/mycroft-core
source .venv/bin/activate
msm install $1
