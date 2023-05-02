pipeline {
    agent any

    stages {
        stage('Update Version') {
            steps {
                script {
                    sh "pwd"
                    sh "ls"
                    def folderPath = '/path/to/folder' // Replace with the actual path to the folder

                    // Define the regular expression pattern to match the version string
                    def pattern = '<version>[0-9]+\.[0-9]+\.[0-9]+</version>'

                    // Iterate over each .xml file in the folder
                    def xmlFiles = findFiles(glob: "${folderPath}/*.xml")
                    xmlFiles.each { file ->
                        def content = file.getText()
                        def matcher = pattern.matcher(content)

                        // Find the version string in the file content and increment it by 1
                        if (matcher.find()) {
                            def majorVersion = matcher.group(1).toInteger()
                            def minorVersion = matcher.group(2).toInteger()
                            def patchVersion = matcher.group(3).toInteger()

                            def newVersion = "${majorVersion}.${minorVersion}.${patchVersion + 1}"

                            // Replace the old version string with the new version string in the file content
                            def newContent = content.replaceAll(pattern, newVersion)

                            // Write the updated content back to the file
                            file.write(newContent)
                            sh "cat pom.xml"
                        }
                    }
                }
            }
        }
    }
}
