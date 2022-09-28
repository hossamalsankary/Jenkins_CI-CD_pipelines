pipeline{
    agent any
    stages{
        stage("install dependencies"){
            steps{
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
                sh 'npm run Build'
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