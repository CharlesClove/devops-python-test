pipeline {
    agent any

    stages {
        stage('Clone repository'){
            steps{
                checkout scm
            }
        }
        
        stage("build"){
            steps{
                echo 'building the app..'
                def imgName = "my-app-by-jenkins:${env.BUILD_NUMBER}"
                app = docker.build(imgName, '.')
                echo "Docker image '${imageName}' built successfully!"
            }
        }
        stage("test"){

            steps{
                echo 'testing the app..'
                app.inside{
                    sh 'echo "test passed"'
                }
            }
        }
        stage("deploy"){
    
            steps{
                echo 'deploying the app..'
                docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds'){
                    app.push()
                }
                echo "Docker image pushed (if configured to do so)."
            }
        }
                stage("Run Docker Container (Optional)") {
            steps {
                script {
                    // Example of running the built image temporarily
                    // This is more common in 'deploy' stages.
                    // Ensure the container is given a unique name if run multiple times.
                    sh "docker run --rm --name my-app-container-${env.BUILD_NUMBER} ${app.id}"
                    echo "Docker container could be run here if desired."
                }
            }
        }
    }
  
}
