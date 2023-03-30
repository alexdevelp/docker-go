FROM golang:alpine AS build

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o api main.go

FROM scratch

# FROM alpine:3.9 
# RUN apk add ca-certificates

WORKDIR /app

COPY --from=build /app/api ./

# EXPOSE 8000

CMD ["./api"]