pipeline{
    agent any
    parameters{
        string(name: 'destroyEnv', defaultValue: '$HOME', description: 'print home') 
           }
    stages{
        stage("install dependencies"){
            steps{
                sh '${prams.destroyEnv}'
                sh 'exit 1'
                sh 'npm install -f'
            }
            post{
                always{
                    echo "========Done========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("Test"){
            steps{
                echo 'I Have no test Here'
            }
            post{
                always{
                    echo "========Done========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("Build"){
            steps{
                sh 'npm run build'
            }
            post{
                always{
                    echo "========Done========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("Build Docker Image"){
            steps{
                sh 'docker compose up -d'
            }
            post{
                always{
                    echo "========Done========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
   stage("smoke-test"){
            steps{
                sh 'docker stop server'
            }
            post{
                always{
                    echo "========Done========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}