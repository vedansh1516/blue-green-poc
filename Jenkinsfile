pipeline {
    agent any

    stages {
        stage('check Version') {
            steps {
                script {
                    // check if pom.xml and package.json files exist in the current working directory
   
                    if (fileExists('pom.xml')) {
                        echo "File pom.xml found!"
                    }
                    echo "hello"
                    }
                }
            }
        }
    }
