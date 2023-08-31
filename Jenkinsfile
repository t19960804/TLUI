pipeline {
    agent any

    parameters {
        booleanParam(name: 'RUN_Deploy', defaultValue: false)
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
                expression {
                    echo "Info - Build And Test Are Success: ${currentBuild.resultIsBetterOrEqualTo('SUCCESS')}"
                    echo "Info - RUN_Deploy: ${params.RUN_Deploy}"
                    return currentBuild.resultIsBetterOrEqualTo('SUCCESS') && params.RUN_Deploy
                }
            }
            steps {
                echo 'Deploying the project'
            }
        }
    }
}
