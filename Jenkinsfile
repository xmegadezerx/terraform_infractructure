pipeline {
  agent any

  tools {
      "terraform"
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

stage('terraforminit') {
      steps {
        sh "terraform init"
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