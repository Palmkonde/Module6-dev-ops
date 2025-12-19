pipeline {
  agent any
  
  tool {
    nodejs 'node24'
  }


  stages {
    stage('Install packages') {
        steps {
            sh 'npm install'
        }
    }


    stage('Test') {
        steps {
            sh 'node --test'
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
