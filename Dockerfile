FROM golang:1.11 AS builder

# Magic line, notice in use that the lib name is different!
RUN apt-get update && apt-get install -y gcc-aarch64-linux-gnu

# Add your app and do what you need to for dependencies
ADD . /go/src/hello-app
WORKDIR /go/bin/hello-app
RUN CGO_ENABLED=1 CC=aarch64-linux-gnu-gcc GOOS=linux GOARCH=arm64 go build -o hello-app /go/src/hello-app

# Final stage - pick any old arm64 image you want
FROM multiarch/ubuntu-core:arm64-bionic

LABEL org.opencontainers.image.authors="richard@holzeis.me"
LABEL org.opencontainers.image.source="https://github.com/holzeis/hello-k8s-app"

WORKDIR /root/

COPY --from=builder /go/bin/hello-app .

ENV PORT 8080
CMD ["./hello-app"]
