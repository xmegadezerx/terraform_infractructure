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
        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) 
        {
        sh "terraform init"                      
        sh "terraform apply -auto-approve"  
        } 
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}