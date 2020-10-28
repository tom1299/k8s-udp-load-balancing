FROM golang:1.8.1-alpine

# Add all source code
COPY ./server ./src/udp/

RUN echo 0 > /tmp/healthy

# Indicate the binary as our entrypoint
ENTRYPOINT go run ./src/udp/server.go

# Expose your port
EXPOSE 10001


