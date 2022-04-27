pipeline {
  agent any
  tools {
      terraform "Terraform1.1.9"
  }

  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        checkout scm
      }
    }

    stage('terraform') {
      steps {
        sh "terraform apply -auto-approve plan -no-color"
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}