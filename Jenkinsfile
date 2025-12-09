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

    stage('build docker images') {
        steps {
            sh 'docker build . --tag ttl.sh/palmapp:1h'
            sh 'docker push ttl.sh/palmapp:1h'
        }
    }

    stage('deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'myapp', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
                    sh "ssh -o StrictHostKeyChecking -i ${KEYFILE} ${USERNAME}@docker 'docker pull ttl.sh/palmapp:1h'"
                    sh "ssh -o StrictHostKeyChecking -i ${KEYFILE} ${USERNAME}@docker 'docker run --rm -dit -p 4444:4444 ttl.sh/palmapp:1h'"
                }
            }
    }
  }
  
}
