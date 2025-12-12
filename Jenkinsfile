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
            sh 'docker build . --tag ttl.sh/palmapp:2h'
        }
    }

    stage('push docker image') {
        steps {
            sh 'docker push ttl.sh/palmapp:2h'
        }
    }

    stage('deploy to Kubernets') {
        steps {
            withKubeConfig(credentialsId: 'myapikey', serverUrl: 'https://kubernetes:6443') {
                // sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f pods.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
  }
  
}
