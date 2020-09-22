pipeline{
        agent any
        environment {
            app_version = 'v1'
            rollback = 'true'
        }
        stages{
            stage('Install Docker and Docker-Compose'){
                        steps{
                                sh '''
                                curl https://get.docker.com | sudo bash
                                sudo usermod -aG docker $(whoami)
                                sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                                sudo chmod +x /usr/local/bin/docker-compose 
                                '''
                        }
                }
            stage('Build frontend Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            image = docker.build("arguedjoker/frontend")
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
                            image = docker.build("arguedjoker/backend")
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
                            image = docker.build("arguedjoker/database")
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
                    sh "sudo docker-compose pull && sudo DB_PASSWORD=${DB_PASSWORD} docker-compose up -d"
                }
            }
        }    
}
