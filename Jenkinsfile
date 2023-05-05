pipeline {
    agent any

    stages {
        stage('check Version') {
            steps {
                script {
                    echo "vedansh"
                    // check if pom.xml and package.json files exist in the current working directory
                    if (new File("pom.xml").exists()) {
                        echo "hello"
                    }
                    if (new File("package.json").exists()) {
                        println "bye"
                    }
                    else {
                        echo "no file found"    
                    }

                    }
                }
            }
        }
    }
