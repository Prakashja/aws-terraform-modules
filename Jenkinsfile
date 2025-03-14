pipeline {
    agent any
    parameters {
      string defaultValue: 'apply', description: "apply the changes", name: 'plan', trim:false
      string defaultValue: 'dev', description: "apply the changes", name: 'environment', trim:false
    }
    options {
     ansiColor('xtrem')
    }
    stages{
          stage('terraform fmt'){
          steps{
          script {
          withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
            def environment = params.environment
            sh '''
            echo "The parameter value is: ${environment}"
            cd environment/${environment}/
            terraform fmt
            '''
          }
          }
          }
          }
      stage('terraform init'){
      steps{
      script {
      withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        def environment = params.environment
        sh '''
        echo "The parameter value is: ${environment}"
        cd environment/${environment}/
        terraform init
        '''
      }
      }
      }
      }
    stage('terraform plan'){
    steps{
    script {
    withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
      def environment = params.environment
      sh '''
      echo "The parameter value is: ${environment}"
      cd environment/${environment}/
      terraform plan
      '''
    }
    }
    }
    }
    stage('Terraform Apply Approval') {
  steps {
    timeout(time: 1, unit: 'MINUTES') {
      input(message: 'Do you want to apply Terraform changes?', ok: 'Proceed')
    }
  }
}
        stage('terraform apply'){
        steps{
        script {
        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
          def environment = params.environment
          sh '''
          echo "The parameter value is: ${environment}"
          cd environment/${environment}/
          terraform apply --auto-approve
          '''
        }
        }
        }
        }
    }
}
