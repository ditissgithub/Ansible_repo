pipeline{
    
    agent any
    environment{
          DOCKER_TAG = getDockerTag()
    }
    
    stages{
    
          stage("Build Docker Image"){
                
              steps{
                   sh "docker build . -t ditissdocker/myappk8s:$(DOCKER_TAG) "
              }
          }
          stage("DockerHub Push"){
              
              steps{
                  withCredentials([string(credentialsID: 'docker-hub', variable: 'dockerHubPwd')]){
                      sh "docker login -u ditissdocker -p ${dockerHubPwd}"
                      sh "docker push ditissdocker/myappk8s:${DOCKER_TAG}"
                  }
               }
          }
          stage("Deploy to k8s"){
              
              steps{
                   sh "chmod + changeTag.sh"
                   sh "./changeTag.sh ${DOCKER_TAG}"
               }
          }
    }
 }

def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
