pipeline {
    agent any

    stages {

        stage("build"){
            steps{
                echo 'building the app..'
                sh 'apt update'
                sh 'apt install python3'
            }
        }
        stage("test"){

            steps{
                echo 'testing the app..'
                sh 'python3 --version'
            }
        }
        stage("deploy"){
    
            steps{
                echo 'deploying the app..'
            }
        }
    }
  
}
