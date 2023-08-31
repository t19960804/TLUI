pipeline {
    agent any

    parameters {
        booleanParam(name: 'RUN_Deploy', defaultValue: true)
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Building the project'
                sh 'xcodebuild -resolvePackageDependencies'
                sh 'xcodebuild -scheme TLUI -destination "platform=iOS Simulator,name=iPhone 14" build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the project'
                sh 'xcodebuild -scheme TLUI -destination "platform=iOS Simulator,name=iPhone 14" test'
            }
        }
        stage('Deploy') {
            when {
                allOf {
                    expression {
                        echo "Info - Build And Test Are Success : ${currentBuild.resultIsBetterOrEqualTo('SUCCESS')}"
                        return currentBuild.resultIsBetterOrEqualTo('SUCCESS')
                    }
                    expression {
                        echo "Info - RUN_Deploy : ${params.RUN_Deploy}"
                        return params.RUN_Deploy
                    }
                }
            }
            steps {
                script {
                    echo 'Deploying the project'
                    def projectPath = "/Users/t19960804/Desktop/TLUI"
                    def readmePath = "${projectPath}/README.md"
                    def newVersion = "1.0.7"
                    
                    sh """
                    git config --global user.name 't19960804'
                    git config --global user.email 't19960804@gmail.com'
                    
                    perl -i -pe 's/Version-[0-9]+\\.[0-9]+\\.[0-9]+/Version-${newVersion}/g' '${readmePath}'
                    
                    cd '${projectPath}'
                    git add .
                    git commit -m 'Update Version To ${newVersion}'
                    git push -u origin main
                    
                    git config --global core.sshCommand 'ssh -i ~/.ssh/id_ed25519'
                    
                    latestCommit=\$(git rev-parse HEAD)
                    
                    git tag ${newVersion} \${latestCommit}
                    git push -u origin --tags
                    """
                }
            }
        }
    }
}
