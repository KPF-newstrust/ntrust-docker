# Worker
## Build docker images:
```sh
docker build --file Dockerfile_base --tag hqsvr:5000/ntrust-worker-base .

docker build --file Dockerfile_lib --tag hqsvr:5000/ntrust-worker-lib .

docker build --file Dockerfile_app --tag hqsvr:5000/ntrust-worker-app:0.3 .

docker push hqsvr:5000/ntrust-worker-app:0.3
```
## tag setting example:
```sh
docker tag slowalk/ntrust-worker-base hqsvr:5000/ntrust-worker-base
```

## Run worker app:
```sh
$ mkdir work1
$ docker run -it \
  -e WORKER_ID=ntwk1 \
  -e PYTHONIOENCODING=utf-8 \
  -v `pwd`/work1:/work \
  --add-host=hqsvr:192.168.1.2 \
  --hostname ntwork1 \
  --name ntwork1 \
  hqsvr:5000/ntrust-worker-app:0.2

$ docker start -ai ntwork1
```

# hqsvr
* hqsvr에는 직접 세팅한 도커 레지스트리와 깃 레지스트리가 있습니다. 
* 도커 레지스트리는 아래 스크립트로 컨테이너를 올린 후에 해당 IP를 hqsvr로 지정해서 이용합니다.
* 깃 레지스트리는 깃허브로 대체할 수 있습니다. 
```
    docker run -d \

     --restart=always \

     -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \

     -p 5000:5000 \

     -v /data/docker/registry:/var/lib/registry \

     --name docker-registry \

     --hostname registry \

     registry
```