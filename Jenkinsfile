pipeline{
    
    agent any 
    
    stages {
        
        stage('Git Checkout'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/madhavi33/demo-counter-app.git'
                }
            }
        }
        stage('UNIT testing'){
            
            steps{
                
                script{
                    
                    sh 'mvn test'
                }
            }
        }
        stage('Integration testing'){
            
            steps{
                
                script{
                    
                    sh 'mvn verify -DskipUnitTests'
                }
            }
        }
        stage('Maven build'){
            
            steps{
                
                script{
                    
                    sh 'mvn clean install'
                }
            }
        }
        stage('Static code analysis'){
            
            steps{
                
                script{
                    
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        
                        sh 'mvn clean package sonar:sonar'
                    }
                   }
                    
                }
            }
            stage('Quality Gate Status'){
                
                steps{
                    
                    script{
                        
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
                    }
                }
            }
        
            stage('upload war file to nexus'){
                
                steps{
                    
                    script{
                      nexusArtifactUploader artifacts:
                         [
                         
                           [
                              artifactId: 'springboot', 
                              classifier: '', 
                              file: 'target/Uber.jar', 
                              type: 'jar'
                           ]
                       ], 
                       credentialsId: 'nexus-auth', 
                       groupId: 'com.example', 
                       nexusUrl: 'http://13.233.89.129:8081', 
                       nexusVersion: 'nexus3', 
                       protocol: 'http', 
                       repository: 'demoapp-release', 
                       version: '1.0.0'

                    }

                }
            }

        }
        
}