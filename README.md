# demo_jenkins_docker_deploy
Contain with 
- jenkinfile
- Dockerfile

Run Jenkins Docker 
- docker run -it -d \
  -v /root/jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 8080:8080 \
  -p 50000:50000 \
  jenkinsci/blueocean
