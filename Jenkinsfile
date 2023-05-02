pipeline {
    agent any
    stages {
        stage('Update XML versions') {
            steps {
                script {
                    def xmlFiles = findFiles(glob: '*.xml')
                    println "XML files found: ${xmlFiles}"
                    xmlFiles.each { file ->
                        def xml = new XmlParser().parse(file)
                        def version = xml.version.text()
                        println "Old version: ${version}"
                        def newVersion = version.tokenize('.').collect { it.toInteger() }
                        newVersion[2] += 1
                        newVersion = newVersion.join('.')
                        xml.version[0].value = newVersion
                        file.write(new XmlNodePrinter().print(xml))
                        println "New version: ${newVersion}"
                    }
                }
            }
        }
    }
}
