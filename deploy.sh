#!/bin/bash

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

tar cvzf deploy.sh app.js test.robot
scp -pr deploy.sh root@192.168.1.125:/root/deploy/.

eval `ssh-agent -k`