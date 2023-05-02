pipeline {
    agent any

    stages {
        stage('Update Version') {
            steps {
                script {
                    def files = findFiles(glob: '*.xml')
                    files.each { file ->
                        def xml = new XmlParser().parse(file)
                        def currentVersion = xml.getVersion()
                        def newVersion = incrementVersion(currentVersion)

                        // Update the version in the XML file
                        xml.version = newVersion
                        def writer = new StringWriter()
                        new XmlNodePrinter(new PrintWriter(writer)).print(xml)
                        file.setText(writer.toString())

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
