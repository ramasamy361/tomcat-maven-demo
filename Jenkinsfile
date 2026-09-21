pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        APP_NAME = 'tomcat-maven-demo'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test package'
            }
        }

        stage('SonarQube') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Archive WAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    curl -u "$TOMCAT_USER:$TOMCAT_PASSWORD"                     --upload-file target/tomcat-maven-demo.war                     "http://$TOMCAT_HOST:8080/manager/text/deploy?path=/tomcat-maven-demo&update=true"
                '''
            }
        }
    }

    post {
        success {
            echo 'Build and deployment completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check Jenkins console output.'
        }
    }
}
