import java.nio.file.Files
import java.nio.file.Paths

def cwd = Paths.get("").toAbsolutePath().toString()

pipeline {
    agent any

    stages {
        stage('check Version') {
            steps {
                script {
                    echo "vedansh"
                    sh "ls"
                    sh "pwd"
                    if (Files.exists(cwd.resolve("pom.xml"))) {
                        println("hello")
                    } else if (Files.exists(cwd.resolve("package.json"))) {
                        println("bye")
                    }

                    }
                }
            }
        }
    }
