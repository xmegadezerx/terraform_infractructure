pipeline {
  agent any
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
 checkout(scm)       
    stage ('Templates Deployment') {
        sh """
          PATH=/bin/terraform
          terraform init"
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