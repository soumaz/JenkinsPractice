pipeline {
  agent any
  stages {
    stage('Prepare Images/Shell Script') {
      steps {
        sh 'bash ./jenkins/scripts/prepare-image.sh'
      }
    }
    stage('Clean Pruned Images/ Shell Script') {
      steps {
        sh 'bash ./jenkins/scripts/cleanup-images.sh'
      }
    }
    stage('Push Image/Shell Script') {
      steps {
        sh 'bash ./jenkins/scripts/push-images.sh'
      }
    }
  }
  environment {
    HOME = '.'
    DOCKER_HUB_USER = 'soumaz'
    DOCKER_HUB_PASSWORD = 'engine'
    CONTAINER_PORT = '80'
    HOST_PORT = '80'
    DBCONN_STRING = 'ZGF0YSBzb3VyY2U9aW9tZWdhc3Fsc2VydmVydjIuZGF0YWJhc2Uud2luZG93cy5uZXQ7dXNlciBpZD1pb21lZ2FhZG1pbjtwYXNzd29yZD1QcmVzdGlnZTEyMztpbml0aWFsIGNhdGFsb2c9aW9tZWdhc3FsZGF0YWJhc2V2Mjs='
    CONTAINER_NAME = 'restservices'
    CLUSTER_NAME = 'soumaz-cluster'
  }
}