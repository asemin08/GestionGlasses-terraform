pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoValidation', defaultValue: true, description: 'Lance automatiquement le Terraform apply après le plan (Par défault activer)')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Voulez vous détruire votre instance Terraform en cours ?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TOTO_SSH              = credentials('TOTO_SSH')
    }


    stages {
        stage('init') {
            steps {  
                dir(".aws"){
                    withCredentials([file(credentialsId: 'TOTO_SSH', variable: 'MyResto')]) {
                        sh 'cp $MyResto MyResto.pem'
                    }
                 dir("app") {
                        sh'terraform init -input=false'
                    }
                }
            }
        stage('Plan') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                dir("app") {
                    sh "ls"
                    sh "terraform plan -input=false -out tfplan "
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoValidation
               }
               not {
                    equals expected: true, actual: params.destroy
                }
           }
           
                
            

           steps {
              dir("app") {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Voulez vous vraiment appliquer le plan?",
                    parameters: [text(name: 'Plan', description: 'Regarder le plan', defaultValue: plan)]
               }
              }
           }
       }

        stage('Apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                dir("app") {
                    sh "terraform apply -input=false tfplan"
                }
            }
        }
        
        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
        
        steps {
          dir("app") {
           sh "terraform destroy --auto-approve"
          }
        }
    }

  }
}
