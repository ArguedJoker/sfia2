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
                    ssh -o "StrictHostKeyChecking=no" ubuntu@172.30.0.149 <<EOF
                    curl https://get.docker.com | sudo bash 
                    sudo usermod -aG docker $(whoami)
                    sudo apt update
                    sudo apt install -y curl jq
                    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    sudo chmod +x /usr/local/bin/docker-compose
                    sudo chmod 666 /var/run/docker.sock
                    rm -rf ~/sfia2
                    git clone --single-branch --branch development https://github.com/ArguedJoker/sfia2.git
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
                            docker login --username="$DOCKER_USER" --password="$DOCKER_PASS"
                            docker build -t arguedjoker/frontend .
                            docker push arguedjoker/frontend
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
                            docker login --username="$DOCKER_USER" --password="$DOCKER_PASS"
                            docker build -t arguedjoker/backend .
                            docker push arguedjoker/backend
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
            stage('Front end Testing'){
                steps{
                    sh '''
                    ssh -t ubuntu@172.30.0.149 <<EOF
                    cd ~/sfia2
                    export TEST_DATABASE_URI="$TEST_DATABASE_URI"
                    export DATABASE_URI="$DATABASE_URI"
                    export SECRET_KEY="$SECRET_KEY"
                    export MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"
                    export BACKEND_URL="$BACKEND_URL"
                    docker-compose down
                    docker-compose build
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
                    ssh -t ubuntu@172.30.0.149 <<EOF
                    cd ~/sfia2
                    export TEST_DATABASE_URI="$TEST_DATABASE_URI"
                    export DATABASE_URI="$DATABASE_URI"
                    export SECRET_KEY="$SECRET_KEY"
                    export MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"
                    export BACKEND_URL="$BACKEND_URL"
                    docker-compose down
                    docker-compose build
                    docker-compose up -d
                    sleep 20
                    cd backend/tests
                    docker-compose exec -T backend pytest --cov application > backendpytest.txt                                       
EOF
                    '''
                }
            }
            stage('Production Deployment'){
                steps{
                    withAWS(credentials: 'aws', region: 'eu-west-2') {
                    sh '''
                    aws eks get-token --cluster-name sfia2
                    aws eks update-kubeconfig  --name sfia2
                    kubectl apply -f infra/yml/
                    kubectl rollout restart deployment frontend backend
                    '''
                    }
                }
            }
        }
}  