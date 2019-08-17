FROM python:3.8.0b3-alpine3.10

RUN  apk add --update --progress \
        musl \
        build-base \
        bash \
        git

RUN pip install -q --no-cache-dir --upgrade pip

RUN pip install twisted

RUN mkdir /app/syncplay -p
RUN git clone https://github.com/Syncplay/syncplay -b v1.6.4a /app/syncplay

EXPOSE 8999
COPY ./entrypoint.sh /entrypoint.sh
WORKDIR /app/syncplay
ENTRYPOINT ["/entrypoint.sh"]