pipeline {
    agent any
    
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
                        // https://linuxhint.com/jenkinsfile-when-expression/
                        // https://stackoverflow.com/questions/71615991/jenkins-pipeline-parameter-being-evaluated-to-previous-value
                        // Warning > 不可以使用parameters來當作flag, 因為設定好的defaultValue只會在下一次的Jenkins建置才會執行, 當前這次的建置反而會讀取上一次的defaultValue
                        // Workaround > 要升版本再改成true
                        return true
                    }
                }
            }
            steps {
                script {
                    echo 'Deploying the project'
                    def projectPath = "/Users/t19960804/Desktop/TLUI"
                    def readmePath = "${projectPath}/README.md"
                    def newVersion = "1.1.2"
                    
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
