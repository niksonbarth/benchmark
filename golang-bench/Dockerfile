FROM golang:stretch

ENV GO111MODULE=on
ENV GIN_MODE=release

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

EXPOSE 8000
ENTRYPOINT ["/app/golang-bench"]