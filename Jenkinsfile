pipeline {
  agent any
  options { timestamps() }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Validate Compose') {
      steps {
        powershell 'docker compose config'
      }
    }

    stage('Docker Build') {
      steps {
        powershell '''
          $env:BUILD_REV = $env:GIT_COMMIT
          docker compose build --pull
        '''
      }
    }

    stage('Deploy') {
      steps {
        powershell '''
          $env:BUILD_REV = $env:GIT_COMMIT
          docker compose up -d --force-recreate --remove-orphans
          docker image prune -f
        '''
      }
    }
  }

  post {
    success { echo 'App: http://localhost:8081' }
  }
}
