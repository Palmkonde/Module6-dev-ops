pipeline {
  agent any

  tools {
    go '1.24.1'
  }

  stages {
    stage('test') {
        steps {
            sh 'go test -v ./...'
        }
    }
    stage('build') {
      steps {
        sh 'go build main.go'
      }
    }

    stage('deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: '4ac431c4-0f8a-4c55-9bd5-1f95f9a8c444', 
                                                    keyFileVariable: 'keyfile')]) {
                    sh 'scp -o StrictHostKeyChecking=no -i "$keyfile"  main laborant@target:~'
                }
            }
    }
  }
  
}
