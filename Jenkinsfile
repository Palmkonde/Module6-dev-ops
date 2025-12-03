pipeline {
  agent any

  tools {
    go '1.24.1'
  }

  stages {
    stage('build') {
      step {
        sh 'go build main.go'
      }
    }
  }
  
}
