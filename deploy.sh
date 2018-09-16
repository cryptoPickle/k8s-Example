# Build
docker build -t owned/multi-client:latest -t owned/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t owned/multi-server:latest -t owned/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t owned/multi-worker:latest -t owned/multi-worker:$SHA -f ./worker/Dockerfile ./worker


# Push
docker push owned/multi-client:latest
docker push owned/multi-server:latest
docker push owned/multi-worker:latest

docker push owned/multi-client:$SHA
docker push owned/multi-server:$SHA
docker push owned/multi-worker:$SHA


#  apply k8s
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=owned/multi-server:$SHA
kubectl set image deployments/client-deployment server=owned/multi-client:$SHA
kubectl set image deployments/worker-deployment server=owned/multi-worker:$SHA

