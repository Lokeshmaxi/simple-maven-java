pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'git config --global --add safe.directory '*''
                sh 'mvnw clean install -DskipTests'
            }
        }
    }    
}
