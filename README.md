# 이미지 빌드
```sh
docker build . --tag ntrust-worker
```

#컨테이너 실행
```sh
docker run -d \
-e WORKER_ID=ntwork1 \
-e MQ_URL=amqp://ntrust:solif@172.17.0.1:50001/ntrust?heartbeat=10 \
-e MONGO_URL=mongodb://172.17.0.1:50003 \
-e MONGO_DB=ntrust2 \
-e PYTHONIOENCODING=utf-8 \
-v /work:/work \
--hostname ntwork1 \
--name ntwork1 \
--restart=always \
ntrust-worker
```
1. [ntrust-admin](https://github.com/KPF-newstrust/ntrust-admin)가 먼저 구현된 상태를 전제로 합니다. 앞서 구현된 MQ, Mongo와 연동되기 떄문입니다.
2. `ntwork1`로 명시된 3개의 필드는 컨테이너를 늘리면서 뒤의 숫자도 바꿔줍니다. 워커를 병렬적으로 운영하기 위함입니다.
3. `172.17.0.1`은 도커 컨테이너의 IP 주소입니다. 도커가 설치된 OS에서 `ifconfig docker0` 명령어로 확인할 수 있습니다.
4.  MQ와 Mongo의 포트번호는 ntrust-admin의 [도커 설정](https://github.com/KPF-newstrust/ntrust-admin/blob/master/docker-compose.yml)과 일치합니다.
5. admin과 worker가 제대로 연동되었다면 다음 페이지에서 API를 테스트해 볼 수 있습니다. http://{호스트}:50000/admin/lab/postag