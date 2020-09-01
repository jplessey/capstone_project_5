pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh 'echo "Deploying JP Guitars WebApp..."'
            }
        }
        stage('Deploy to AWS EKS Cluster') {
                steps {
                withAWS(region:'us-west-2',credentials:'aws-static') {
                    sh 'aws eks --region us-west-2 update-kubeconfig --name jpguitars-webapp'
                    sh 'kubectl apply -f jpapp_k8s_deployment.yaml'
                    sh 'kubectl get pods'
                }
            }    
        }
        stage('Add Service to Deployment') {
                steps {
                withAWS(region:'us-west-2',credentials:'aws-static') {
                    sh 'kubectl expose deployment/jpguitars-deployment --type="LoadBalancer" --port=80 --target-port=80'
                    sh 'kubectl describe service jpguitars-deployment'
                }
            }
        }                                                           
    }
}