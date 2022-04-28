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
        sh "terraform plan -out=plan -no-color "                      
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