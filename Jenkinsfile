node {
    stage('Build') {
    sh "sudo docker-compose build"
}
 stage('Deployment') {
    sh "dotnet restore src/Server/Server.csproj"
}
 stage('Build') {
    sh "sudo docker-compose up -d"
}
}