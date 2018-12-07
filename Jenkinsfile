node{
    stage('Git Checkout'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '129104b3-9f7a-48b7-85af-1e3b7150ba28', url: 'https://github.com/warawich/demo_jenkins_docker_deploy.git']]])
    }
    stage('Build Docker Image'){   
        sh('docker build -t wich_node:1.0.0 .')
    }
}