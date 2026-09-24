pipeline {

    agent any

    tools {
        maven 'maven 3.9'
    }

    environment {
        TOMCAT_HOST = '172.31.5.174'
        TOMCAT_USER = 'ubuntu'
        TOMCAT_PATH = '/opt/tomcat/webapps'
    }

    stages {

        // =========================
        // CHECKOUT
        // =========================
        stage('Checkout') {
            steps {
                git branch: 'dev',
                    url: 'https://github.com/ramasamy361/tomcat-maven-demo.git'
            }
        }

        // =========================
        // BUILD
        // =========================
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        // =========================
        // UNIT TEST
        // =========================
        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }

            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }

        // =========================
        // SONARQUBE ANALYSIS
        // =========================
        stage('SonarQube Analysis') {
            steps {

                withSonarQubeEnv('SonarQube') {

                    withCredentials([
                        string(
                            credentialsId: 'sonarqube-token',
                            variable: 'SONAR_TOKEN'
                        )
                    ]) {

                        sh '''
                            mvn sonar:sonar \
                            -Dsonar.projectKey=devops-demo \
                            -Dsonar.host.url=$SONAR_HOST_URL \
                            -Dsonar.token=$SONAR_TOKEN
                        '''
                    }
                }
            }
        }

        // =========================
        // QUALITY GATE
        // =========================
        stage('Quality Gate') {
            steps {

                timeout(
                    time: 10,
                    unit: 'MINUTES'
                ) {

                    waitForQualityGate(
                        abortPipeline: true
                    )
                }
            }
        }

        // =========================
        // DEPLOY TO NEXUS
        // =========================
        stage('Deploy to Nexus') {
    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'nexus-credentials',
                usernameVariable: 'NEXUS_USER',
                passwordVariable: 'NEXUS_PASSWORD'
            )
        ]) {
            sh '''
                mkdir -p "$HOME/.m2"

                cat > "$HOME/.m2/settings.xml" <<EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.2.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.2.0 https://maven.apache.org/xsd/settings-1.2.0.xsd">
    <servers>
        <server>
            <id>nexus</id>
            <username>${NEXUS_USER}</username>
            <password>${NEXUS_PASSWORD}</password>
        </server>
    </servers>
</settings>
EOF

                echo "Deploying artifact to Nexus..."

                mvn deploy \
                -DskipTests \
                -DaltDeploymentRepository=nexus::default::http://18.206.237.229:8081/repository/maven-releases/ \
                --settings "$HOME/.m2/settings.xml"
            '''
        }
    }
}

        // =========================
        // DEPLOY TO TOMCAT
        // =========================
        stage('Deploy to Tomcat') {
    steps {
        sshagent(['tomcat-ssh']) {
            sh '''
                echo "Deploying application to Tomcat"

                # Upload WAR to temporary location
                scp -o StrictHostKeyChecking=no \
                    target/tomcat-maven-demo.war \
                    ubuntu@172.31.5.174:/tmp/tomcat-maven-demo.war

                # Remove old deployment and copy new WAR
                ssh -o StrictHostKeyChecking=no \
                    ubuntu@172.31.5.174 \
                    "sudo rm -rf /opt/tomcat/webapps/tomcat-maven-demo /opt/tomcat/webapps/tomcat-maven-demo.war && \
                     sudo mv /tmp/tomcat-maven-demo.war /opt/tomcat/webapps/tomcat-maven-demo.war"

                echo "Deployment completed successfully"
            '''
        }
    }
}
        // =========================
        // VERIFY DEPLOYMENT
        // =========================
        stage('Verify Deployment') {
            steps {

                sh '''
                    echo "Waiting for Tomcat deployment..."
                    sleep 15

                    echo "Checking application..."

                    curl -f \
                    http://${TOMCAT_HOST}:8080/tomcat-maven-demo/
                '''
            }
        }
    }

    // =========================
    // POST ACTIONS
    // =========================
    post {

        success {
            echo '================================='
            echo 'APPLICATION DEPLOYED SUCCESSFULLY'
            echo '================================='
        }

        failure {
            echo '================================='
            echo 'DEPLOYMENT FAILED'
            echo 'Check Jenkins console output.'
            echo '================================='
        }
    }
}
