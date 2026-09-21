# Tomcat Maven DevOps Demo

A simple working Java Servlet WAR project for practicing:

- Git/GitHub
- Maven
- Jenkins
- SonarQube
- Nexus Repository
- Apache Tomcat
- CI/CD

## Project flow

GitHub -> Jenkins -> Maven Build/Test -> SonarQube -> Nexus -> Tomcat

## 1. Build locally

Requirements:

- JDK 8+
- Maven 3.8+
- Apache Tomcat 9

Run:

```bash
mvn clean test package
```

WAR file:

```text
target/tomcat-maven-demo.war
```

## 2. Run on Tomcat

Copy the WAR file into Tomcat's `webapps` directory:

```bash
cp target/tomcat-maven-demo.war $CATALINA_HOME/webapps/
```

Start Tomcat:

Linux:
```bash
$CATALINA_HOME/bin/startup.sh
```

Windows:
```bat
%CATALINA_HOME%\bin\startup.bat
```

Open:

```text
http://localhost:8080/tomcat-maven-demo/hello
```

## 3. Jenkins

Create a Pipeline job and connect this GitHub repository.

The included `Jenkinsfile` performs:

1. Checkout
2. Maven test/package
3. SonarQube analysis
4. Archive WAR
5. Deploy WAR to Tomcat

### Jenkins credentials/environment

Configure these Jenkins environment variables or credentials:

```text
TOMCAT_HOST
TOMCAT_USER
TOMCAT_PASSWORD
```

Example:

```text
TOMCAT_HOST=192.168.1.100
```

Do not commit real passwords to GitHub.

## 4. Tomcat Manager

For automated deployment, enable the Tomcat Manager application and create a user with the `manager-script` role.

Example `tomcat-users.xml`:

```xml
<role rolename="manager-script"/>
<user username="jenkins" password="CHANGE_ME" roles="manager-script"/>
```

Use a strong password in your lab.

## 5. Nexus

To publish the WAR to Nexus, add a `distributionManagement` section to `pom.xml` and configure Maven credentials in Jenkins.

Example:

```xml
<distributionManagement>
    <repository>
        <id>nexus-releases</id>
        <url>http://NEXUS_HOST:8081/repository/maven-releases/</url>
    </repository>
    <snapshotRepository>
        <id>nexus-snapshots</id>
        <url>http://NEXUS_HOST:8081/repository/maven-snapshots/</url>
    </snapshotRepository>
</distributionManagement>
```

Then:

```bash
mvn deploy
```

For a real environment, store credentials in Jenkins/Maven `settings.xml`, not in source code.

## 6. GitHub commands

Create an empty GitHub repository named:

```text
tomcat-maven-demo
```

Then:

```bash
git init
git branch -M main
git add .
git commit -m "Initial Tomcat Maven DevOps project"
git remote add origin https://github.com/YOUR_USERNAME/tomcat-maven-demo.git
git push -u origin main
```

## Expected result

After deployment:

```text
http://TOMCAT_HOST:8080/tomcat-maven-demo/hello
```

You should see:

Tomcat Maven DevOps Demo

Application is running successfully.
# tomcat-maven-demo
