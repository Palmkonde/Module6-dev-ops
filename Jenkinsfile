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
                withCredentials([sshUserPrivateKey(credentialsId: '9b22f0fe-959a-437f-8af2-9bc42b73e10d', keyFileVariable: 'keyfile', usernameVariable: 'username')]) {
                    sh 'scp -o StrictHostKeyChecking=no -i "$keyfile"  main laborant@target:~'
                }
            }
    }
  }
  
}
