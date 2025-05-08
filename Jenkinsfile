pipeline {
    agent any
    tools {
        maven 'maven' // or whatever name you've set in Jenkins
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Checkout code') {
            steps {
                 checkout scm
            }
        }
    }    
}
