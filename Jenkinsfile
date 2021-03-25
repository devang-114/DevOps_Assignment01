pipeline {
    agent any
    tools {
      maven "maven"
    }
    stages {
      stage("code checkout") {
        steps {
          git url: 'https://github.com/devang-114/DevOps_Assignment01.git'
        }
      }
      stage("code build") {
        steps {
          bat "mvn clean install package"
        }
      }
      stage("code test") {
        steps {
          bat "mvn test"
        }
      }
      stage("Sonar Analysis") {
        steps {
          withSonarQubeEnv("SonarQube") {
            bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar"
          }
        }
      }
       
	    /*
        stage("Quality Gate") {
steps {
timeout(time: 30, unit: 'MINUTES') {
waitForQualityGate abortPipeline: true
}
}
}
*/
        stage("Upload to artifactory") {
        steps {
          rtMavenDeployer (
            id: "deployer",
            serverId: "artifactory-server",
            releaseRepo: "dev.devops.assignment",
            snapshotRepo: "dev.devops.assignment"
          )
          rtMavenRun (
            pom: "pom.xml",
            goals: "clean install",
            deployerId: "deployer"
          )
          rtPublishBuildInfo (
            serverId: "artifactory-server"
          )
        }
      }
	    /*
	stage('Build Image')
	{
		steps
		{
			bat "docker build -t assignment04container:${BUILD_NUMBER} ."
		}
	}
	stage ("Docker Deployment")
	{
	steps
	{
		bat "docker run --name assignment04container -d -p 9050:8080 assignment04image:${BUILD_NUMBER}"
		}
	}
	*/
	 stage("Deploy"){
            steps{
               deploy adapters: [tomcat7(credentialsId: 'user-tomcat', path: '', url: 'http://localhost:8084/')], contextPath: 'addition', war: '**/*.war'
            }
        }
}

    post {
      always {
        bat "echo always"
      }
      success {
        bat "echo success"
      }
      failure {
        bat "echo failure"
      }
    }
  }
