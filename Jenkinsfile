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
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod 666 /var/run/docker.sock
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
                            docker build -t arguedjoker/frontend .
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
                            docker build -t arguedjoker/backend .
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Build database Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh rpscdevelopments@34.89.103.14 <<EOF
                            cd sfia/database
                            docker build -t arguedjoker/mysql .
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
                    sudo chmod 666 /var/run/docker.soc
EOF
                    '''
                }
            }
        } 
}      