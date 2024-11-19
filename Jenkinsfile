pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x build.sh'

                // Build the Docker image using the build script
                sh './build.sh'
            }
        }

        stage('Deploy') {
            steps {
                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Deploy the Docker image using the deploy script
                sh './deploy.sh'
            }
        }
    }
}
