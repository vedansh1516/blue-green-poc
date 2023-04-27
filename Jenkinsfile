pipeline {
  agent any

  stages {
    stage('Update version') {
      steps {
        sh 'chmod +x update_version.sh && ./update_version.sh'
      }
    }
    stage('Push') {
      steps {
              sshagent(credentials: ['f98af7ed-88ff-4d48-83a5-61420cdb59a4']) {
                sh "git add ."
                sh "git commit -m 'update version'"
                sh "git push"
          }
        }
      }
  }
}
