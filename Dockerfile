FROM golang:1.18-buster as builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -v -o basic_go

FROM debian:buster-slim
COPY --from=builder /app/basic_go /app/basic_go

CMD ["/app/basic_go"]
