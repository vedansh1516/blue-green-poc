import groovy.util.XmlSlurper
def pomFile = readFile 'pom.xml'
def rootNode = new XmlSlurper().parseText(pomFile)
def versionNode = rootNode.version
def currentVersion = versionNode.text()
def newVersion = currentVersion.tokenize('.').collect { it.toInteger() }.sum() + 1
versionNode.setValue(newVersion.toString())
writeFile file: 'pom.xml', text: groovy.xml.XmlUtil.serialize(rootNode)

pipeline {
    agent any
    stages {
        stage('Update POM version') {
            steps {
                script {
                    sh "ls"
//                     sh "cat pom.xml"

                }
            }
        }
    }
}

