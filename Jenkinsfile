pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                sh 'echo "Building JP Guitars WebApp..."'
            }
        }
        stage('Lint Python files') {
            agent any
            steps {
                withPythonEnv('python3.8') {
                    sh 'pip install -r requirements.txt'
                    sh 'pylint --disable=R,C,W1203 *.py'
                }
            }
        }
        stage('Lint HTML files') {
            agent any
            steps {
                sh 'tidy -q -e templates/*.html'
            }
        }
        stage('Lint Dockerfile') {
            agent any
            steps {
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }          
        // stage('Lint Dockerfile') {
        //     agent {
        //         docker {
        //             alwaysPull false
        //             image 'hadolint/hadolint:latest-debian'
        //         }
        //     }            
        //     steps {
        //         sh 'hadolint --ignore DL3013 Dockerfile'
        //     }
        // }                          
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