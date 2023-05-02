pipeline {
    agent any
    stages {
        stage('Update version') {
            steps {
                script {
                    def folderPath = '.'
                    def xmlFiles = findFiles(glob: "*.xml")
                    echo "XML files found: ${xmlFiles.collect { it.path }}"

                    xmlFiles.each { file ->
                        def xml = readFile(file.path)
                        def parser = new XmlParser()
                        def root = parser.parseText(xml)

                        def version = root.version.text()
                        def newVersion = incrementVersion(version)

                        echo "Updating version from ${version} to ${newVersion} in ${file.path}"

                        root.version.replaceBody(newVersion)

                        def writer = new StringWriter()
                        def xmlWriter = new XmlNodePrinter(new PrintWriter(writer))
                        xmlWriter.preserveWhitespace = true
                        xmlWriter.print(root)

                        writeFile(file.path, writer.toString())
                    }
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
