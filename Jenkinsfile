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
                   sshCommand(){
                       sh "scp -o StrictHostKeyChecking=no higher_object.yaml application-pod.yaml root@10.8.0.201/root/"
                       script{
                           try{
                               sh "ssh root@10.8.0.201 kubectl apply -f ."
                           }catch(error){
                               sh "ssh root@10.8.0.201 kubectl create -f ."
                           }
                       }
                  }
               }
          }
    }
 }

def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
