FROM alpine:3.21.2
RUN apk add upx
WORKDIR /app
CMD ["upx", "--ultra-brute", "-qq", "/app/main"]
