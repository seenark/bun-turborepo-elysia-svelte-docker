local-docker-compose := "./production/docker-compose.yaml"
minio-local-docker-compose := "./production/docker-compose-minio.yaml"
backend-dockerfile := "./production/Dockerfile.backend"
web-dockerfile := "./production/Dockerfile.web"

web-up-local:
    docker compose -f {{local-docker-compose}} up -d web

web-down-local:
    docker compose -f {{local-docker-compose}} down web

backend-up-local:
    docker compose -f {{local-docker-compose}} up -d backend

backend-down-local:
    docker compose -f {{local-docker-compose}} down backend

web-build-local:
    docker compose -f {{local-docker-compose}} build web --no-cache

# web-build-prod:
#     docker compose -f {{local-docker-compose}} build web

backend-build-local:
    docker compose -f {{local-docker-compose}} build backend --no-cache

backend-build-prod $TAG:
    docker build --platform=linux/amd64 -f {{backend-dockerfile}} -t $TAG .

web-build-prod $TAG:
    docker build --platform=linux/amd64 -f {{web-dockerfile}} -t $TAG .
    
minio-up-local:
    docker compose -f {{minio-local-docker-compose}} up -d
    
pipeline-build-debug-container: 
    docker build --memory=1g --memory-swap=1g -t iipm:debug -f ./debug-pipeline/pipeline.dockerfile . 
    
pipeline-run-debug-container:
    docker run -it --memory=4g --memory-swap=4g --memory-swappiness=0 --cpus=4 --entrypoint=/bin/bash iipm:debug 
