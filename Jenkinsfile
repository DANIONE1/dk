pipeline {
    agent any
    stages {
        stage('Source Code') {
            steps {
                checkout scm
            }
        }
        stage('Docker Image') {
            steps {
                script {
                    try {
                        sh 'docker build -t myJenkins .'
                        sh 'docker stop python-Jenkins || true'
                        sh 'docker rm python-Jenkins || true'
                        sh 'docker run -d -p 5000:5000 --name=python-Jenkins myJenkins'
                    } catch (Exception e) {
                        sh 'docker logs python-Jenkins'
                        throw e
                    }
                }
            }
        }
    }
    post {
        always {
            sh "docker rm -f python-Jenkins || true"
        }
    }
}
