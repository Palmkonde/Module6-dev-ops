pipeline {
  agent any

  stages {
    stage('Test') {
        steps {
            nodejs('node24') {
                sh 'node --test'
            }
        }
    }

    // stage('Deploy target') {
    //         steps {
    //             withCredentials([sshUserPrivateKey(credentialsId: 'myapp', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
    //                 sh 'scp -o StrictHostKeyChecking=no -i ${KEYFILE}  main ${USERNAME}@target:~'
    //             }
    //         }
    // }
  }
  
}
