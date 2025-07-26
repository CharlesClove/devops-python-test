
def app

pipeline {
    agent any

    stages {


        stage("build"){
            steps{
                echo 'building the app..'
                script{
                    def imgName = "clovedockerhub/my-app-by-jenkinsssssss:${env.BUILD_NUMBER}"
                    echo "Building Docker image: ${imgName}"
                    app = docker.build(imgName, '.')
                }
            }
        }
        
        stage("test"){
            steps{
                echo 'testing the app..'
                script{
                    app.inside{
                        sh 'echo "Running tests inside the container..."'
                        sh 'echo "test passed"'
                    }
                }
            }
        }
        
        stage("deploy"){

            steps{
                echo 'deploying the app..'
                script{

                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-creds'){
                        app.push()
                    }
                }
                echo "Docker image pushed successfully."
            }
        }
        
        stage("Run Docker Container (Optional)") {
            steps {
                script {
                    sh "docker run --rm --name my-app-container-${env.BUILD_NUMBER} ${app.id}"
                }
            }
        }
    }
}
