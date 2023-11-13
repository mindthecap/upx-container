# upx-container
Containerized UPX running in apline. By default it's searching for /app/main.

# Common usage (based on golang)

    FROM golang:latest as build
    WORKDIR /app
    COPY src .
    RUN CGO_ENABLED=0 go build -p 4 -ldflags="-s -w" -o main . 

    FROM upx-container as compressor 
    WORKDIR /app
    COPY --from=build /app/main /app/main

    FROM scratch
    WORKDIR /app
    COPY --from=compressor /app/main .
    CMD ["main"]