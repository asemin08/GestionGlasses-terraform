pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoValidation', defaultValue: false, description: 'Lancer automatiquement le Terraform apply après le plan ? (Par défault activer)')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Voulez vous détruire votre instance Terraform en cours ?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        MYRESTO_SSH           = credentials('MYRESTO_SSH')
        GIT_PATH = "https://github.com/asemin08/GestionGlasses-terraform.git"
        GIT_BRANCH = "main"
    }


    stages {
        
	    stage('clean workspace') {
            steps {
                deleteDir()
            }
        }

        stage('source clone and checkout the branch') {
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: "*/${GIT_BRANCH}"]],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    submoduleCfg: [],
                    userRemoteConfigs: [[
                        url: "${GIT_PATH}"
                    ]]
                ])
            }
        }
           
        stage('Terraform init') {
            steps {     
                dir(".aws"){
                    withCredentials([file(credentialsId: 'MYRESTO_SSH', variable: 'MyResto')]) {
                        sh 'cp $MyResto MyResto.pem'
                    }
                }
                dir("app") {
                        sh'terraform init -input=false'
                }
            }
        }

        stage('Terraform Plan') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                dir("app") {
                    sh "terraform plan -input=false -out tfplan "
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }

        stage('Terraform validation') {
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
                        ef plan = readFile 'tfplan.txt'
                        input message: "Voulez vous vraiment appliquer le plan?",
                        parameters: [text(name: 'Plan', description: 'Regarder le plan', defaultValue: plan)]
                    }
                }
            }
        }

        stage('Terraform Apply') {
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
        
        stage('Terraform Destroy') {
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
