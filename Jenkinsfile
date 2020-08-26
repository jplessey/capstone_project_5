pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building JP Guitars WebApp..."'
            }
        }
        // stage('Build Docker Image - test') {
        //     steps {
        //         sh 'docker build -t jpguitars_app .'
        //     }
        // }
        // stage('Push Docker Image') {
        //     steps {
        //         withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
        //             sh 'docker tag jpguitars_app jlessey/jpguitars:latest'
        //             sh 'docker push jlessey/jpguitars:latest'
        //         }
        //     }
        // }    
    }
}