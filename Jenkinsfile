pipeline {
    agent any
    stages {
    stage('Build') {
        steps {
                script {
                    sh "sudo docker-compose build"
                }
            }
}
 stage('Tests') {
        steps {
                script {
                    sh "dotnet restore src/Server/Server.csproj"
                }
            }
}
    stage('Deployment') {
        steps {
                script {
                    sh "sudo docker-compose up -d"
                }
            }
}
}
}