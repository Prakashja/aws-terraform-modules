pipeline {
    agent any
    parameters {
      sting defaultValue: 'apply', description: "apply the changes", name: 'plan', trim:false
      sting defaultValue: 'dev', description: "apply the changes", name: 'environment', trim:false
    }
    stages{
      stage('terraform init'){
      steps{
      withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'terraform', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
        def EnvironmentName = params.environment
        sh '''
        cd environment/${EnvironmentName}/
        terraform init
        '''
      }
      }
      }
    }
}
