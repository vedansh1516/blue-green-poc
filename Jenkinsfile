pipeline {
    agent any

    stages {
        stage('Update Version') {
            steps {
                script {
                    def files = findFiles(glob: '*.xml')
                    files.each { file ->
                        def xmlText = file.getText()
                        def xml = new XmlParser().parseText(xmlText)
                        def currentVersion = xml.getVersion()
                        def newVersion = incrementVersion(currentVersion)

                        // Update the version in the XML file
                        xml.version = newVersion
                        file.write(xml.toString())

                        echo "Version in file ${file} updated from ${currentVersion} to ${newVersion}"
                    }
                }
            }
        }
    }
}

// Function to increment the version by 1
def incrementVersion(currentVersion) {
    def parts = currentVersion.tokenize('.')
    def lastPart = parts[parts.size() - 1].toInteger()
    parts[parts.size() - 1] = (lastPart + 1).toString()
    return parts.join('.')
}
