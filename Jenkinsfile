pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the project'
                sh 'xcodebuild -resolvePackageDependencies'
                sh 'xcodebuild -packageID TLUI -scheme TLUI build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the project'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the project'
            }
        }
    }
}
