package model

import (
	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
)

var _ DemoUsersModel = (*customDemoUsersModel)(nil)

type (
	// DemoUsersModel is an interface to be customized, add more methods here,
	// and implement the added methods in customDemoUsersModel.
	DemoUsersModel interface {
		demoUsersModel
	}

	customDemoUsersModel struct {
		*defaultDemoUsersModel
	}
)

// NewDemoUsersModel returns a model for the database table.
func NewDemoUsersModel(conn sqlx.SqlConn, c cache.CacheConf) DemoUsersModel {
	return &customDemoUsersModel{
		defaultDemoUsersModel: newDemoUsersModel(conn, c),
	}
}
