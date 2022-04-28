pipeline {
  agent { label 'jenkins'}

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
        sh "terraform init"                      
        sh "terraform apply -auto-approve"  
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}