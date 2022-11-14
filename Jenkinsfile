pipeline{
       agent any
 
           
    stages{

    
        
        stage("install dependencies"){
            parallel{
                    stage("install Frontend dependencies"){
                            agent {
                            docker {
                                image 'node:16-alpine'
                                args '-u root:root'
                            }
                        }

                        steps{
                         
                        dir('./frontend'){

                              sh 'npm install' 
                          
                        }

                        }
                    }
                    stage("install backend dependencies"){
                            agent {
                            docker {
                                image 'node:16-alpine'
                                args '-u root:root'
                            }
                        }

                        steps{
                            sh 'npm install '
                        }
                    }
                }
     
        }
        stage("Test"){
          
          parallel{
            stage("Test Front end"){
                            agent {
                            docker {
                                image 'node:16-alpine'
                                args '-u root:root'
                            }
                        }


                steps{

                dir('./frontend'){
                    sh 'npm run test'
                }
                }
            }
             stage("Test backend"){
                            agent {
                            docker {
                                image 'node:16-alpine'
                                args '-u root:root'
                            }
                        }

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
                    agent {
                    docker {
                        image 'node:16-alpine'
                        args '-u root:root'
                    }
                }

                dir('./frontend'){
                    sh 'npm run build'
                }
                }
            }
             stage("build backend"){
                    agent {
                    docker {
                        image 'node:16-alpine'
                        args '-u root:root'
                    }
                }

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