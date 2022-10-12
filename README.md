# webserver commands
```
cargo init webserver
```
```
docker build -t webserver
```
```
docker images
```
```
docker run -p 8080:3030 --rm --name web1 webserver
```
```
docker stop web1
```

Dockerfile.v0 -> build size = 2.84GB

Dockerfile -> build size = 73.1MB
