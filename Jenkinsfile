pipeline {
    agent any

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
