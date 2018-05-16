FROM ubuntu:16.04
LABEL Description="NewsTrust"

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk-headless python3-pip git automake
RUN pip3 install --upgrade pip

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PYTHONIOENCODING=utf-8

VOLUME ["/work"]
# <-- base -->

RUN pip3 install JPype1-py3
RUN pip3 install konlpy
RUN pip3 install pymongo
RUN pip3 install pymysql
RUN pip3 install pika

RUN mkdir -p /opt/mecab

ADD mecab/mecab-0.996-ko-0.9.2.tar.gz /opt/mecab
RUN cd /opt/mecab/mecab-0.996-ko-0.9.2 && \
	./configure && \
	make && \
	make check && \
	make install

ADD mecab/mecab-ko-dic-2.0.1-20150920.tar.gz /opt/mecab
RUN cd /opt/mecab/mecab-ko-dic-2.0.1-20150920 && \
	./autogen.sh && \
	ldconfig && \
	./configure && \
	make && \
	make install

RUN cd /opt/mecab && \
	git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git && \
	cd mecab-python-0.996 && \
	python3 setup.py build && \
	python3 setup.py install

RUN rm -rf /opt/mecab/
# <-- lib -->

RUN apt-get -y install vim-tiny

COPY cmd_start_worker.sh /start_worker.sh
CMD /start_worker.sh
# <-- app -->