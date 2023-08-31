pipeline {
    agent any

    environment {
        needUpdateVersion = true
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
                    return currentBuild.resultIsBetterOrEqualTo('SUCCESS') && env.needUpdateVersion == true
                }
            }
            steps {
                echo 'Deploying the project'
            }
        }
    }
}
