package svc

import (
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"luna/user/model"
	"luna/user/rpc/internal/config"
)

type ServiceContext struct {
	Config    config.Config
	UserModel model.DemoUsersModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	conn := sqlx.NewMysql(c.Mysql.DataSource)
	return &ServiceContext{
		Config:    c,
		UserModel: model.NewDemoUsersModel(conn, c.CacheRedis),
	}
}
