pipeline {
    agent any
    environment {
        PATH = "/usr/local/bin:$PATH"
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        sh "${GIT_EXECUTABLE} clone https://github.com/DANIONE1/dk.git"
                    } catch (Exception e) {
                        echo "Error al clonar el repositorio: ${e.message}"
                        currentBuild.result = 'FAILURE'
                        error('Failed to clone the repository')
                    }
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        sh 'docker build -t mypythonapp .'
                    } catch (Exception e) {
                        sh 'docker logs pythonapp'
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
                        docker stop pythonapp || true
                        docker rm pythonapp || true
                        docker run -d -p 5000:5000 --name=pythonapp mypythonapp
                        '''
                    } catch (Exception e) {
                        sh 'docker logs pythonapp'
                        throw e
                    }
                }
            }
        }
    }
    post {
        always {
            sh "docker rm -f pythonapp || true"
        }
    }
}
