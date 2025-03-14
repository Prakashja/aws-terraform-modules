pipeline {
    agent any
    parameters {
      sting defaultValue: 'apply', description: "apply the changes", name: 'plan', trim:false
    }
    stages{
      stage('terraform init'){
        terraform init
      }
    }
}
