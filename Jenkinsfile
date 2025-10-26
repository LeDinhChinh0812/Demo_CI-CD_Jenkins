pipeline {
agent any


environment {
GIT_CRED = 'github-deploy-key' // credentialsId của SSH private key
}


options {
timestamps()
}



stages {
stage('Checkout') {
steps {
sshagent (credentials: [env.GIT_CRED]) {
checkout([$class: 'GitSCM',
branches: [[name: '*/main']],
userRemoteConfigs: [[
url: 'git@github.com:LeDinhChinh0812/Demo_CI-CD_Jenkins.git',
credentialsId: env.GIT_CRED
]]
])
}
}
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
if (Test-Path -Path ./deploy.ps1) {
./deploy.ps1
} else {
docker compose up -d
docker image prune -f
}
'''
}
}
}


post {
success {
echo "App should be available at http://localhost:8081"
}
always {
archiveArtifacts artifacts: 'docker-compose.yml', fingerprint: true, onlyIfSuccessful: false
}
}
}