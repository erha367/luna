package svc

import (
	"github.com/zeromicro/go-zero/rest"
	"github.com/zeromicro/go-zero/zrpc"
	"luna/search/internal/config"
	"luna/search/internal/middleware"
	user "luna/user/rpc/userclient"
)

type ServiceContext struct {
	Config  config.Config
	Example rest.Middleware
	UserRpc user.User
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config:  c,
		Example: middleware.NewExampleMiddleware().Handle,
		UserRpc: user.NewUser(zrpc.MustNewClient(c.UserRpc)),
	}
}
