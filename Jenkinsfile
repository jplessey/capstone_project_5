pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building JP Guitars WebApp..."'
            }
        }
        stage('Build Docker Image - test') {
            steps {
                sh 'docker build -t jpguitars_app .'
            }
        }    
    }
}