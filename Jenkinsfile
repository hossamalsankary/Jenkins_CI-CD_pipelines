pipeline{

  agent {
        docker { image 'node'}
    }
           
    stages{

        stage("install docker"){
            steps{
                sh 'curl -fsSL https://get.docker.com -o get-docker.sh'
                sh 'sh ./get-docker.sh'
            }
        }
        
        stage("install dependencies"){
            parallel{
                    stage("install Frontend dependencies"){
                        steps{
                        dir('./frontend'){
                            sh 'npm install -f'
                        }

                        }
                    }
                    stage("install backend dependencies"){
                        steps{
                            sh 'npm install -f'
                        }
                    }
                }
     
        }
        stage("Test"){
          
          parallel{
            stage("Test Front end"){

                steps{

                dir('./frontend'){
                    sh 'npm run test'
                }
                }
            }
             stage("Test backend"){
                 steps{
                echo 'I Have no test Here'
                 }
            }
          }
        }

        
        stage("Build"){
          
          parallel{
            stage("build Front end"){
                steps{
                dir('./frontend'){
                    sh 'npm run build'
                }
                }
            }
             stage("build backend"){
                 steps{
                  sh 'npm run build'
                 }
            }
          }
        }
        stage("Build Docker Image"){
            steps{
                sh 'docker compose up -d'
            }

        }
         stage("smoke-test(in dev)"){
            steps{
                sh 'curl localhost:5000'
            }
    
        }
  
    }
    post{
             
        success{

              echo "========A executed successfully========"
           sh "docker stop server&&docker system prune --volumes -a -f "
        }
        failure{
            echo "========A execution failed========"          
           sh "docker stop server&&docker system prune --volumes -a -f "
        }
    }
}