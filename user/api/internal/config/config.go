package config

import (
	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/core/trace"
	"github.com/zeromicro/go-zero/rest"
)

type Config struct {
	rest.RestConf
	//mysql
	Mysql struct {
		DataSource string
	}
	//redis
	CacheRedis cache.CacheConf
	//auth
	Auth struct {
		AccessSecret string
		AccessExpire int64
	}
	Telemetry trace.Config
}
