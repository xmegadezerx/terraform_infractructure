pipeline {
  agent any

tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }
    
    environment {
        TF_HOME = tool('terraform')
        TP_LOG = "WARN"
        PATH = "$TF_HOME:$PATH"
        ACCESS_KEY = credentials('AWS_ACCESS_KEY_ID')
        SECRET_KEY = credentials('AWS_SECRET_ACCESS_KEY')
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