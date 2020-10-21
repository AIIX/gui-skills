import yaml
import pako
import subprocess
import re
import sys
from os.path import exists, join, basename, dirname, isfile

print("got path")
print(sys.argv[1])
yml_path = sys.argv[1] + "/" + "manifest.yml"
sys_keys = []
if exists(yml_path):
    print('Reading from manifest.yml')
    with open(yml_path) as f:
        info = yaml.safe_load(f)
        for key in info['dependencies']['system']:
            sys_keys.append(key)
        
        for k in range(len(sys_keys)):
            if sys_keys[k] in info['dependencies']['system'].keys():
                extract_deps = (info['dependencies']['system'].get('all'))
                print("Required To Install: " + extract_deps)
                
                deps = "pako install {0}".format(extract_deps)
                subprocess.run(deps, shell=True)
            else:
                print('a valid manifest.yml not found')

else:
    print('skill path not found')
