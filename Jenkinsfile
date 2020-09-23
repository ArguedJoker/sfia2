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
                                ssh rpscdevelopments@34.89.103.14 <<EOF
                                curl https://get.docker.com | sudo bash
                                sudo usermod -aG docker $(whoami)
                                sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                                sudo chmod +x /usr/local/bin/docker-compose
EOF                                 
                                '''
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

            stage('Tag & Push frontend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image.push("${env.app_version}")
                            }
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

            stage('Tag & Push backend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image.push("${env.app_version}")
                            }
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
                            docker build -t arguedjoker/database .
EOF
                            '''
                        }
                    }
                }          
            }

            stage('Tag & Push database Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image.push("${env.app_version}")
                            }
                        }
                    }
                }          
            }

            stage('Build nginx Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            image = docker.build("nginx:latest")
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
