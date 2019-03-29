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
    stage('Run Container Local') {
      steps {
        sh 'bash ./jenkins/scripts/run-container.sh'
        sh 'bash ./jenkins/scripts/cleanup-containers.sh'
        input(message: 'Is the cleanup done', ok: 'Yes')
      }
    }
    stage('AWS Deploy/Extended Email') {
      steps {
        emailext(subject: '${JOBNAME} - $BUILD_ID} - Approval Task', body: 'The pipeline for  ${JOB_NAME} has been completed pre proccessing task successfully, needs to be approved befor eits being eployed to AWS environment. To continue approval click <a href=\'{BUILD_URL}\'>here</a>', from: 'soumaz07@gmail.com')
        input(message: 'Would you like to continue deploy ro AW ECS Cluster', ok: 'Yes. Please!')
        sh 'bash ./jenkins/scripts/aws-deploy.sh'
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