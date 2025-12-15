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
        sh 'go build -o main main.go'
      }
    }

    stage('deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'mykey', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
                    // sh 'ansible-playbook --inventory hosts.ini --private-key ${KEYFILE} playbook.yml '
                    sh '''
                        ansible-playbook --inventory=hosts.ini \
                            --private-key=${KEYFILE} \
                            -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" \
                            playbook.yml 
                    '''
                }
            }
    }
  }
  
}
