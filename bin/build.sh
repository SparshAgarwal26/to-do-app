#!/bin/bash

# This is the order of arguments
build_folder=$1
ecr_repository_domain=$2
image_tag=$3
image_name=$4

aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin $ecr_repository_domain

docker build -t $image_name $build_folder

docker tag $image_name:$image_tag $ecr_repository_domain/$image_name:$image_tag
# Push image
docker push $ecr_repository_domain/$image_name:$image_tag