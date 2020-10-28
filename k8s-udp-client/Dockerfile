FROM golang:1.8.1-alpine

# Add all source code
COPY ./client ./src/udp/

# Indicate the binary as our entrypoint
ENTRYPOINT go run ./src/udp/client.go
