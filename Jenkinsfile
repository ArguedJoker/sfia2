pipeline{
        agent any
        environment {
            app_version = 'v1'
            rollback = 'false'
        }
        stages{
            stage('Install Docker and Docker-Compose'){
                steps{
                    sshagent(['af3c8a26-65ac-4852-9693-a8572cfe5e37']) {
                        sh '''
                        ssh ubuntu@172.30.0.149 <<EOF
                        curl https://get.docker.com | sudo bash 
                        sudo usermod -aG docker $(whoami)
                        sudo apt update
                        sudo apt install -y curl jq
                        version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
                        sudo chmod 666 /var/run/docker.sock
EOF
                        '''
                    }
                }
            }
            stage('clone repository and cd into directory'){
                steps{
                    sh '''
                    ssh -t ubuntu@172.30.0.149 <<EOF
                    git clone https://github.com/ArguedJoker/sfia2.git
                    cd sfia2
EOF
                    '''
                }
            }    
            stage('Build Frontend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh -t ubuntu@172.30.0.149 <<EOF
                            cd ~/sfia2/frontend
                            docker build -t frontend . 
EOF
                            '''
                        }
                    }
                }          
            }
            stage('Build Backend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh ubuntu@172.30.0.149<<EOF
                            cd ~/sfia2/backend
                            docker build -t backend . 
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Build Database Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            sh '''
                            ssh ubuntu@172.30.0.149<<EOF
                            mkdir ~/sfia2/database
                            cd ~/sfia2/database
                            docker build -t mysql . 
EOF
                            '''
                        }
                    }
                }          
            }
            stage('Deploy App'){
                steps{
                    sh '''
                    ssh ubuntu@172.30.0.149 <<EOF
                    cd ~/sfia2
                    export TEST_DATABASE_URI=$TEST_DATABASE_URI
                    export DATABASE_URI=$DATABASE_URI
                    export SECRET_KEY=$SECRET_KEY
                    export MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
                    docker-compose up -d
EOF
                    '''
                }
            }
            stage('Setting up Testing environment with docker and docker-compose'){
                steps{
                    sh'''
                    ssh ubuntu@ip-172-30-0-98 <<EOF
                    curl https://get.docker.com | sudo bash 
                    sudo usermod -aG docker $(whoami)
                    sudo apt update
                    sudo apt install -y curl jq
                    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    sudo chmod +x /usr/local/bin/docker-compose
                    sudo chmod 666 /var/run/docker.sock
                    rm -rf ~/sfia2
                    git clone https://github.com/ArguedJoker/sfia2.git
EOF
                    '''
                }
            }
            stage('Front end Testing'){
                steps{
                    sh '''
                    ssh ubuntu@ip-172-30-0-98 <<EOF
                    cd ~/sfia2
                    export TEST_DATABASE_URI="$TEST_DATABASE_URI"
                    export DATABASE_URI="$DATABASE_URI"
                    export SECRET_KEY="$SECRET_KEY"
                    export MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"
                    docker-compose up -d
                    sleep 20
                    cd frontend/tests
                    docker-compose exec -T frontend pytest --cov application > frontendpytest.txt                                      
EOF
                    '''
                }
            }
            stage('Back end Testing'){
                steps{
                    sh '''
                    ssh ubuntu@ip-172-30-0-98 <<EOF
                    cd ~/sfia2
                    export TEST_DATABASE_URI="$TEST_DATABASE_URI"
                    export DATABASE_URI="$DATABASE_URI"
                    export SECRET_KEY="$SECRET_KEY"
                    export MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"
                    docker-compose up -d
                    sleep 20
                    cd backend/tests
                    docker-compose exec -T backend pytest --cov application > backendpytest.txt                                       
EOF
                    '''
                }
            }
        }
}  
