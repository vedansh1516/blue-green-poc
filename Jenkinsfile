import groovy.util.XmlSlurper
pipeline {
    agent any
    stages {
        stage('Update POM version') {
            steps {
                script {
                    def pomFile = readFile 'pom.xml'
                    def rootNode = new XmlSlurper().parseText(pomFile)
                    def versionNode = rootNode.version
                    def currentVersion = versionNode.text()
                    def newVersion = currentVersion.toInteger() + 1
                    versionNode.setValue(newVersion.toString())
                    writeFile file: 'pom.xml', text: groovy.xml.XmlUtil.serialize(rootNode)
                }
            }
        }
    }
}

