pipeline {
  agent any
  options { timestamps() }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Validate Compose') {
      steps {
        powershell 'docker compose version'
        powershell 'docker compose config'   // fail sớm nếu YAML sai
      }
    }

    stage('Docker Build') {
      steps {
        powershell 'docker compose build'
      }
    }

    stage('Deploy') {
      steps {
        powershell '''
          docker compose up -d
          docker image prune -f
        '''
      }
    }
  }

  post {
    success { echo 'App: http://localhost:8081' }
  }
}
