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
        stage('Lint CSS files') {
            steps {
                sh 'npm install --save-dev stylelint stylelint-config-standard'
                sh 'npx stylelint "static/main.css"'
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