# luna 基于go-zero开发的web微服务体系框架
## 环境准备
```api
(base) yangsen@bogon:~/codes/luna(main⚡) » goctl -v
goctl version 1.4.0 darwin/amd64

(base) yangsen@bogon:~/codes/luna(main⚡) » go version                                                                                                                  2 ↵
go version go1.18.4 darwin/amd64

(base) user/api [main●] » etcd --version
etcd Version: 3.5.4
Git SHA: 08407ff76
Go Version: go1.18.1
Go OS/Arch: darwin/amd64
```
## 启动命令
```
(base) user/api [main●] » go run user.go -f etc/user-api.yaml
Starting server at 0.0.0.0:8888...

(base) ┌─[yangsen@bogon] - [~/codes/luna/search] - [五  2 24, 14:03]
└─[$]> go run search.go -f etc/search-api.yaml
Starting server at 0.0.0.0:8889...
```
## 请求demo
```api
#用户登录
curl -X POST \
  http://127.0.0.1:8888/user/login \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 4e967be6-207e-4f0d-a1ed-b7044bf9361f' \
  -d '{"username":"yangsen","password":"12345678"}'
  
  #使用搜索
  curl -X GET \
  'http://127.0.0.1:8889/search/do?name=%E4%BC%A0%E5%A5%87' \
  -H 'authorization: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzcxNDQ0NDMsImlhdCI6MTY3NzE0Mzg0MywidXNlcklkIjoxfQ.W3dbwScB6dH7Bw1ZXGxirVfUfh0ulRm3v1rtfVJZLGw' \
  -H 'cache-control: no-cache' \
  -H 'postman-token: d97bc8e8-d538-72a9-46ef-4f3b34c1aacb'
```
