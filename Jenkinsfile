pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building JP Guitars WebApp..."'
            }
        }
        stage('Lint Python files') {
            steps {
                withPythonEnv('python3.8') {
                    sh 'pip install -r requirements.txt'
                    sh 'pylint --disable=R,C,W1203 *.py'
                }
            }
        }
        stage('Lint HTML files') {
            steps {
                sh 'tidy -q -e templates/*.html'
            }
        }
        stage('Lint CSS main file') {
            steps {
                sh 'npm install --save-dev stylelint stylelint-config-standard'
                sh 'npx stylelint "static/main.css"'
            }
        }
        stage('Lint JS main file') {
            steps {
                sh 'npm install eslint --save-dev'
                sh 'npx eslint "static/main.js"'
            }
        }                   
        stage('Lint Dockerfile') {
            agent {
                docker {
                    image 'hadolint/hadolint:latest'
                }
            }            
            steps {
                sh 'hadolint --ignore DL3013 Dockerfile'
            }
        }                         
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jpguitars_app .'
            }
        }
        stage('Docker Image Vulnerability Scan') {
            steps {
                sh 'trivy image jpguitars_app'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                    sh 'docker tag jpguitars_app jlessey/jpguitars'
                    sh 'docker push jlessey/jpguitars'
                }
            }
        }    
    }
}