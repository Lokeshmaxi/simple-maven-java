pipeline {
    agent any
    tools {
        maven 'Maven 3.9.6' // or whatever name you've set in Jenkins
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvnw clean install -DskipTests'
            }
        }
        stage('Checkout code') {
            steps {
                 checkout scm
            }
        }
    }    
}
