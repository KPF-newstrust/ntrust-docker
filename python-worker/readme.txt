Build docker images:

	docker build --file Dockerfile_base --tag hqsvr:5000/ntrust-worker-base .

	docker build --file Dockerfile_lib --tag hqsvr:5000/ntrust-worker-lib .

	docker build --file Dockerfile_app --tag hqsvr:5000/ntrust-worker-app:0.3 .

	docker push hqsvr:5000/ntrust-worker-app:0.3

tag setting example:

	docker tag slowalk/ntrust-worker-base hqsvr:5000/ntrust-worker-base

run worker app:

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
