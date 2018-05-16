#!/bin/bash

if [ -e /work/ntrust-worker ]
then
  cd /work/ntrust-worker
  git pull
else
  cd /work
  git clone https://github.com/KPF-newstrust/ntrust-worker.git
fi

while : ; do
  cd /work/ntrust-worker
  ./basic_measure_worker.py
  retcode=$?

  if [ $retcode -ne 99 ]; then
      break
  fi
  git pull
done

