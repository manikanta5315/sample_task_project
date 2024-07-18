pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                git branch: 'master' , url:'https://github.com/manikanta5315/sample_task_project.git'
            }
        }
        stage('building image') {
            steps {
                bat '''
                docker build -t projectimage1 .
                '''

            }
        }
        stage('run test') {
            steps{
            bat '''
            docker run -d --name projectcontainer1 -p 8070:80 projectimage1
            docker tag projectimage1 manikanta5315/projectnew
            '''
            }
        }
        stage('push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'manikanta5315-dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
                    bat 'echo %password% |docker login -u %username% -p %password%'
                    bat 'docker push  manikanta5315/projectnew'
                }
            }

        }
    }
}
