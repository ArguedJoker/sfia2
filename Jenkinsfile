pipeline{
        agent any
        environment {
            app_version = 'v1'
            rollback = 'false'
        }

        stages{

            stage('Install Docker and Docker-Compose'){
                steps{
                    script{
                        sh '''
                        ssh rpscdevelopments@34.89.103.14 <<EOF
                        curl https://get.docker.com | sudo bash
                        sudo usermod -aG docker $(whoami)
                        sudo apt update
                        sudo apt install -y curl jq
                        version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
EOF                                 
                        '''
                    }                        
                }
            }
            

            stage('Clone repository and cd into directory'){
                steps{
                    script{
                            sh '''
                            ssh rpscdevelopments@34.89.103.14 <<EOF
                            git clone https://github.com/ArguedJoker/sfia2.git
                            cd sfia2
EOF
                            '''
                        }
                    }
                }          

            stage('Build frontend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh rpscdevelopments@34.89.103.14 <<EOF
                            cd sfia2/frontend
                            docker build -t frontend .
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Build backend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh rpscdevelopments@34.89.103.14 <<EOF
                            cd sfia2/backend
                            docker build -t backend .
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Build production database Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh rpscdevelopments@34.89.103.14 <<EOF
                            cd sfia/database
                            docker build -t database .
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Deploy App'){
                steps{
                    sh '''
                    ssh rpscdevelopments@34.89.103.14 <<EOF
                    cd sfia2
                    docker-compose up -d
EOF
                    '''
                }
            }
        }
    }     
     