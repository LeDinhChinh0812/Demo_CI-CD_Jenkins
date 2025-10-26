pipeline {
  agent any
  options { timestamps() }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Docker Build') {
      steps {
        powershell '''
          docker version
          docker compose version
          docker compose build
        '''
      }
    }

    stage('Deploy (Docker Compose Up)') {
      steps {
        powershell '''
          docker compose up -d
          docker image prune -f
        '''
      }
    }
  }

  post {
    success { echo "App: http://localhost:8081" }
  }
}
