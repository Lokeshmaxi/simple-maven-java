pipeline {
    agent any

    stages {
        stage('git') {
            steps {
                echo ''
            }
        }
        stage('Build') {
            steps {
                sh 'mvnw clean install -DskipTests'
            }
        }
    }    
}
