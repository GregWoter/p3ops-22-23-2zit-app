node {
    stage "Build"
    sh "sudo docker-compose build"

    stage "Tests"
    sh "dotnet restore src/Server/Server.csproj"

    stage "Deployment"
    sh "sudo docker-compose up -d"
}