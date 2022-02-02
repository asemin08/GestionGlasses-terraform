pipeline {
    agent any

    parameters {
        booleanParam(name: 'autoValidation', defaultValue: true, description: 'Lancer automatiquement le Terraform apply après le plan ? (Par défault activer)')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Voulez vous détruire votre instance Terraform en cours ?')
	choice(
            choices: ['prod' , 'test'],
            description: 'Choisir entre le code de prod ou de test',
            name: 'ENV'
        )
    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        MYRESTO_SSH           = credentials('MYRESTO_SSH')
        GIT_PATH = "https://github.com/asemin08/GestionGlasses-terraform.git"
	GIT_TEST_BRANCH = "with_jenkins"
        GIT_MAIN_BRANCH = "main"
        GIT_BRANCH = "${params.ENV == 'prod' ? GIT_MAIN_BRANCH : GIT_TEST_BRANCH}"
    }


    stages {
        
	    stage('clean workspace') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            steps {
                deleteDir()
            }
        }

        stage('source clone and checkout the branch') {
	   when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
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
		sh 'git branch'
            }
        }
           
        stage('Terraform init') {
	    when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
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
                        def plan = readFile 'tfplan.txt'
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
