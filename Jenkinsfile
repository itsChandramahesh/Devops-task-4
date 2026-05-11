pipeline {
    agent any

    environment {
        IMAGE_NAME = "yourdockerhubusername/python-app"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Clone Repository') {
            steps {

                git branch: 'main',
                url: 'https://github.com/itsChandramahesh/Devops-task-4.git'

            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Docker Login') {
            steps {

                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {

                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

    }
}
