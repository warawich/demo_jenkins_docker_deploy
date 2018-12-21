node{
    stage('Git Checkout'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '129104b3-9f7a-48b7-85af-1e3b7150ba28', url: 'https://github.com/warawich/demo_jenkins_docker_deploy.git']]])
    }
    stage('Build Docker Image'){   
        sh 'docker build -t wich_node:1.0.0 .'
    }
    stage('Push to Docker Hub'){
        withCredentials([usernamePassword(credentialsId: 'DockerHub2', passwordVariable: 'DockerPass', usernameVariable: 'DockerUser')]) {
            sh "docker login -u ${DockerUser} -p ${DockerPass}"
        }
        sh 'docker tag wich_node:1.0.0 wichtrue/wich_node:1.0.0'
        sh 'docker push wichtrue/wich_node:1.0.0'
    }
    stage('Deploy Container on Dev Server'){
        def cmd = 'docker run -it -d --rm -p 3002:3000 --name test wichtrue/wich_node:1.0.0'
        def rmcmd = 'docker rm -f test'
        sh "ssh root@192.168.1.125 ${cmd}" 
        sh "ssh root@192.168.1.125 ${cmd}"
    }
       stage('Deploy Git file on Dev Server'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '129104b3-9f7a-48b7-85af-1e3b7150ba28', url: 'https://github.com/warawich/pipelinetest']]])
        sh 'pwd'
        sh 'ls -l'
        sh 'sh ./deploy.sh'
    }
}