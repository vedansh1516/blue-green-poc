pipeline {
    agent any

    stages {
        stage('Update Version') {
            steps {
                script {
                    def folderPath = '.' // use the current directory
                    sh "head -50 pom.xml"
                    // Iterate over each .xml file in the folder
                    def xmlFiles = findFiles(glob: "${folderPath}/**/*.xml") // ** matches all subdirectories
                    xmlFiles.each { file ->
                        def xml = new XmlParser().parseText(file.getText())

                        // Find the version element in the XML and update its value
                        def version = xml.version.text()
                        def newVersion = incrementVersion(version)
                        xml.version.value = newVersion

                        // Write the updated XML back to the file
                        def writer = new FileWriter(file)
                        new XmlNodePrinter(new PrintWriter(writer)).print(xml)
                        writer.close()
                    }
                    sh "head -50 pom.xml"
                }
            }
        }
    }
}

def incrementVersion(version) {
    def parts = version.split(/\./)
    def patchVersion = parts[2].toInteger() + 1
    return "${parts[0]}.${parts[1]}.${patchVersion}"
}
