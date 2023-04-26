pipeline {
     agent any
  
    stages {
        stage("Delete old ECR images"){
            steps{
                    script {
                        sh '''bash test.sh'''
                }
            }
        }
    }
}
