pipeline {
    agent any
     
    environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Maven Build') {
            steps {
                sh 'chmod +x mvnw'
                sh './mvnw clean install -DskipTests -Denforcer.skip=true'
            }
        }
        stage('Docker Initialize'){
             def dockerHome = tool 'docker'
             env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('Docker Build') {
            agent any
            steps {
               sh 'docker build -t lokeshmaxi/simple-java-ap:test1 .'
            }
        }
        // stage('Docker Push') {
        //     steps {
        //          checkout scm
        //     }
        // }
    }    
}
