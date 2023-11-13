FROM alpine:latest
RUN apk add upx
WORKDIR /app
CMD ["upx", "--ultra-brute", "-qq", "/app/main"]