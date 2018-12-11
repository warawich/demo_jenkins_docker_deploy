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
        sh 'docker tag wichnode:1.0.0 wichtrue/wich_node:1.0.0'
        sh 'docker push wichtrue/wich_node:1.0.0'
    }
}