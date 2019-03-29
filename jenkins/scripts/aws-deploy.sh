aws ecs create-cluster --cluster-name ${CLUSTER_NAME} --region ap-southeast-1

aws ecs register-task-definition --cli-input-json file://fargate-task.json --region ap-southeast-1

aws ecs list-task-definitions --region ap-southeast-1

aws ecs create-service --region ap-southeast-1 --cluster ${CLUSTER_NAME} --service-name fargate-service --task-definition cgiprofessionalnetcoreservices --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-013b8f104c865d1f3],securityGroups=[sg-0c3dcc6c87347e55c],assignPublicIp=ENABLED}"

