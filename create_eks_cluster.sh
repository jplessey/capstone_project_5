eksctl create cluster \
--name jpguitars-webapp \
--version 1.17 \
--region us-west-2 \
--nodegroup-name jpapp-nodes \
--node-type t2.medium \
--nodes 3 \
--nodes-min 2 \
--nodes-max 2 \
--managed