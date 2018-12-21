#!/bin/bash

eval `ssh-agent`
ssh-add ${PWD}/.ssh/id_rsa

tar czf deploy.sh app.js test.robot
scp -pr deploy.sh root@192.168.1.125:/root/deploy/.

eval `ssh-agent -k`