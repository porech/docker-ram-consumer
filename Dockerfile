FROM golang:1.23.3 AS builder
COPY src/ /app
WORKDIR /app
RUN go build -o /app/docker-ram-consumer

FROM scratch
COPY --from=builder /app/docker-ram-consumer /docker-ram-consumer
CMD ["/docker-ram-consumer"]
