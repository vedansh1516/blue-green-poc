pipeline {
    agent any

    stages {
        stage('check Version') {
            steps {
                script {
                    echo "vedansh"
                    sh "ls"
                    sh "pwd"
                    // check if pom.xml and package.json files exist in the current working directory
                    if (new File("./pom.xml").exists()) {
                        println "hello"
                    }
                    if (new File("./package.json").exists()) {
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
