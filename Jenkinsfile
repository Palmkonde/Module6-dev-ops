pipeline {
  agent any
  
  tools {
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
            sh 'npm test'
        }
    }

    stage('Build Docker Image') {
        steps {
            sh 'docker build --tag ttl.sh/palmapp:1h .'
        }

    }

    stage('Push Docker Image') {
        steps {
            sh 'docker push ttl.sh/palmapp:1h'        
        }
    }

    stage('Deploy') {
        parallel {
            stage('Deploy to target') {
                steps {
                    withCredentials([sshUserPrivateKey(credentialsId: 'targetkey', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
                        sh """
                            ansible-playbook --inventory ./target/host.ini \
                            -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" \
                            --private-key ${KEYFILE} ./target/playbook.yml
                        """
                    }
                }
            }

            stage('Deploy to docker') {
               steps {
                    withCredentials([sshUserPrivateKey(credentialsId: 'dockerkey', keyFileVariable: 'KEYFILE', usernameVariable: 'USERNAME')]) {
                        sh "ssh -o StrictHostKeyChecking=no -i ${KEYFILE} ${USERNAME}@docker 'docker pull ttl.sh/palmapp:1h'"
                        sh "ssh -o StrictHostKeyChecking=no -i ${KEYFILE} ${USERNAME}@docker 'docker rm -f myapp || true'"
                        sh "ssh -o StrictHostKeyChecking=no -i ${KEYFILE} ${USERNAME}@docker 'docker run --rm -dit --name myapp -p 4444:4444 ttl.sh/palmapp:1h'"
                    }
                }         
            }

            stage('Deploy to k8s') {
               steps {
                    withKubeConfig(credentialsId: 'kubetoken', serverUrl: 'https://kubernetes:6443') {
                        sh 'kubectl apply -f ./kubernetes/'
                    }
                }         
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
