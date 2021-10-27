# About

Run sentiment analysis library for russian language https://github.com/bureaucratic-labs/dostoevsky in docker as web service


# Build and run

```
docker build -t dostoevsky-server .
docker run -d -p 127.0.0.1:10101:8080 --user nobody --restart unless-stopped dostoevsky-server
```

# Dev server

```
docker run --rm -it -p 8080:8080 -v $(pwd)/src/server.py:/opt/server.py dostoevsky-server
```

# Test requests

```
POST http://localhost:8080/
Content-Type: application/json

{
  "data": "я люблю тебя!!",
}
```

```
POST http://localhost:8080/
Content-Type: application/json

{
  "data": "малолетние дебилы"
}
```
