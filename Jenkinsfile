pipeline{
        agent any
        environment {
            app_version = 'v1'
            rollback = 'false'
        }

        stages{

            stage('Install Docker and Docker-Compose'){
                steps{
                        sh '''
                        ssh ubuntu@ip-172-30-0-80 bin/bash <<EOF
                        curl https://get.docker.com | sudo bash
                        sudo usermod -aG docker $(whoami)
                        sudo apt update
                        sudo apt install
                        sudo apt install -y curl jq
                        version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
                        sudo chmod 666 /var/run/docker.sock
EOF                                 
                        '''                        
                }
            }
            

            stage('Clone repository and cd into directory'){
                steps{
                    script{
                            sh '''
                            ssh ubuntu@ip-172-30-0-80 <<EOF
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
                            ssh ubuntu@ip-172-30-0-80 <<EOF
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
                            ssh ubuntu@ip-172-30-0-80 <<EOF
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
                            ssh ubuntu@ip-172-30-0-80 <<EOF
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
                    ssh ubuntu@ip-172-30-0-80 <<EOF
                    cd sfia2
                    export DATABASE_URI=${DATABASE_URI}
                    export TEST_DATABASE_URI=${TEST_DATABASE_URI} 
                    export SECRET_KEY=${SECRET_KEY} 
                    export MYSQL_ROOT_PASSWORD={DB_PASSWORD} 
                    docker-compose pull && docker-compose up -d
                    docker-compose logs
EOF
                    '''
                }
            }
        }
    }     
     