#!/bin/bash

sshpass -p vagrant ssh vagrant@192.168.0.118
cd app
cd ServerLab1SD
sh hello.sh
