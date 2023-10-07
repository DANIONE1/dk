pipeline {
    agent any
    environment {
        GIT_EXECUTABLE = '/usr/bin/git'
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
        // ...
        // Otras etapas de tu canalización
        // ...
    }
    post {
        always {
            sh "rm -rf dk"
        }
    }
}
