FROM dlang2/ldc-ubuntu:1.14.0

WORKDIR /app

COPY . .

RUN dub build

EXPOSE 8000
ENTRYPOINT ["dub", "run"]
