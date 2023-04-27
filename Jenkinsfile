pipeline {
  agent any

  stages {
    stage('Update version') {
      steps {
        script {
          def xmlFiles = sh(
            script: 'find . -type f -name "*.xml"',
            returnStdout: true
          ).trim().split('\n')

          xmlFiles.each { xmlFile ->
            def currentVersion = sh(
              script: "xmlstarlet sel -t -v '/project/version' ${xmlFile}",
              returnStdout: true
            ).trim()

            def newVersion = currentVersion.tokenize('.').with {
              "${it[0]}.${it[1].toInteger() + 1}.0"
            }

            sh "sed -i 's/${currentVersion}/${newVersion}/g' ${xmlFile}"
          }
        }
      }
    }
  }
}
