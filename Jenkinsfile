pipeline {
    agent any

    stages {
        stage('Update XML versions') {
            steps {
                script {
                    def folderPath = '/path/to/xml/files'
                    def versionRegex = /<version>([0-9]+)\.([0-9]+)\.([0-9]+)<\/version>/
                    def versionIncrement = 1

                    def xmlFiles = findFiles(glob: "*.xml")

                    xmlFiles.each { file ->
                        def fileContents = readFile(file.path)
                        def currentVersion = fileContents =~ versionRegex

                        if (currentVersion) {
                            def newVersion = currentVersion[0][0].split('.').collect { Integer.parseInt(it) } // split current version into list of integers
                            newVersion[2] += versionIncrement // increment the patch version by 1
                            newVersion = newVersion.join('.') // join the list back into a string

                            def newFileContents = fileContents.replaceAll(versionRegex, newVersion)

                            writeFile(file.path, newFileContents) // overwrite the file with the updated version
                        }
                    }

                    sh "head -50 pom.xml" // commit changes
                }
            }
        }
    }
}
