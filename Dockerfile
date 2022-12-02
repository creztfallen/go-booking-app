FROM golang:alpine AS builder

WORKDIR /build

ADD go.mod .

COPY . .

RUN go build -o booking main.go

FROM alpine

WORKDIR /build

COPY --from=builder /build/booking /build/booking

CMD ["./booking"]