pipeline {
    agent any

    stages {
        stage('check Version') {
            steps {
                script {
                    // check if pom.xml and package.json files exist in the current working directory
                    File file = new File("pom.xml")
                    if (file.exists()) {
                        println "hello"
                    }
                    File file2 = new File("package.json")
                    if (file2.exists()) {
                        println "vye"
                    }

                    }
                }
            }
        }
    }
