pipeline {
  agent any

  tools {
    go '1.24.1'
  }

  stages {
    state('test') {
        steps {
            sh 'go test -v ./...'
        }
    }
    stage('build') {
      steps {
        sh 'go build main.go'
      }
    }
  }
  
}
