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
                echo 'Deploying the project'
            }
        }
    }
}
