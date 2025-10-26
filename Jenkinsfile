pipeline {
  agent any
  options { timestamps() }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Docker Build') {
  steps {
    powershell 'pwd; ls'
    powershell 'Write-Host "--- docker-compose.yml ---"; Get-Content -Raw docker-compose.yml'
    powershell 'docker compose config'   
    powershell 'docker compose build'
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
