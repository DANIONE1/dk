pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        sh 'sudo docker build -t mypythonapp .'
                    } catch (Exception e) {
                        sh 'sudo docker logs pythonapp'
                        throw e
                    }
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    try {
                        sh '''
                        sudo docker stop pythonapp || true
                        sudo docker rm pythonapp || true
                        sudo docker run -d -p 5000:5000 --name=pythonapp mypythonapp
                        '''
                    } catch (Exception e) {
                        sh 'sudo docker logs pythonapp'
                        throw e
                    }
                }
            }
        }
    }
    post {
        always {
            sh "sudo docker rm -f pythonapp || true"
        }
    }
}
