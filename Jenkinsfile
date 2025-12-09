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
            sh 'docker build . --tag myapp'
        }
    }

    // stage('deploy') {
    //         steps {
    //             withCredentials([sshUserPrivateKey(credentialsId: 'myapp', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
    //                 sh 'scp -o StrictHostKeyChecking=no -i ${KEYFILE}  main ${USERNAME}@target:~'
    //             }
    //         }
    // }
  }
  
}
