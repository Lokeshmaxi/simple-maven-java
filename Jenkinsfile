pipeline {
    agent any
    tools {
        maven 'maven' // or whatever name you've set in Jenkins
    }
     environment {
        DOCKER_IMAGE = 'simple-java-ap'  // Name of the Docker image
        // DOCKER_TAG = 'latest'           // Tag for the Docker image (could be dynamic like git commit hash)
        REGISTRY = 'docker.io'          // Docker Hub or other registry
        REPOSITORY = 'lokeshmaxi'       // Your Docker Hub username or private registry repo
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Test Docker') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def gitCommit = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    docker.build("${REPOSITORY}/${DOCKER_IMAGE}:${gitCommit}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin ${REGISTRY}"
                        // Push the image to Docker Hub or a private registry
                        sh "docker push ${REPOSITORY}/${DOCKER_IMAGE}:${gitCommit}"
                    }
                }
            }
        }

        // stage('Checkout code') {
        //     steps {
        //          checkout scm
        //     }
        // }
    }    
}
