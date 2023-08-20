pipeline {
    agent any
    stages {
        stage('Static Analysis / Linting') {
            steps {
                script {
                    // Static Analysis
                    sh 'dotnet build -p:RunCodeAnalysis=true'
                }
            }
            }
    stage('Deletion old containers') {
        steps {
                script {
                    sh "sudo docker-compose down"
                }
            }
}    
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
                    sh "dotnet restore tests/Domain.Tests/Domain.Tests.csproj"
                    sh "dotnet test tests/Domain.Tests/Domain.Tests.csproj"
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
