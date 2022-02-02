pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TOTO_SSH              = credentials('TOTO_SSH')
    }


    stages {
        stage('init') {
            steps {
//                 withCredentials([file(credentialsId: 'MY_RESTO_KEY', variable: 'my-private-key')]) {
// //                    sh "cd ./.aws/"
//                    sh "pwd"
//                 writeFile file: '.aws/private.pem', text: readFile(my_private_key)
// //                    sh "cp ${my-private-key} .aws/"
//                    sh "ls -la"
//                 }       
                dir(".aws"){
                    withCredentials([file(credentialsId: 'TOTO_SSH', variable: 'my-private-key')]) {
                       sh "cp -v \$my-private-key MyResto.pem"
                    }
//                   withCredentials([sshUserPrivateKey(credentialsId: 'TEST_SHH', variable: 'FILE')]) {
//                       sh 'echo $FILE > MyResto.pem'
//                   }
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
                   equals expected: true, actual: params.autoApprove
               }
               not {
                    equals expected: true, actual: params.destroy
                }
           }
           
                
            

           steps {
              dir("app") {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
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
