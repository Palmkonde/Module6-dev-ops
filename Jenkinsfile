pipeline {
  agent any

  tools {
    go '1.24.1'
  }

  stage('build') {
    step {
      sh 'go build main.go'
    }
  }
}
