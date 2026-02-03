pipeline {
    // This are pre-build steps
    agent {
        node{
            label 'Agent-1'
        }
    }
    environment {
        COURSE="jenkins"
        appVersion = ""
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    // This are Build steps
    stages {
        stage('Read Version'){
            steps{
                script{
                    
                    def packageJSON = readJSON file: 'package.json'
                    appVersion = packageJSON.version
                    echo "app version: ${appVersion}"
                    
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    sh """
                        npm install
                    """
                }
            }
        }
        stage('Build Image') {
            steps {
                script {
                    sh """
                        docker build -t catalogue: ${appVersion} .
                        docker images
                    """
                }
            }
        }
        stage('Test'){
            steps{
                script{
                    sh """
                        echo "testing"
                    """
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh """
                        echo "deploying"
                    """
                }
                
            }
        }
    }
    // This are post build steps
    post {
        always {
            echo "I'm the end"
            cleanWs()
        }
        success{
            echo    "Im the success"
        }
        failure{
            echo    "im the failure"
        }
    }
}