// Code generated by goctl. DO NOT EDIT!

package model

import (
	"context"
	"database/sql"
	"fmt"
	"strings"

	"github.com/zeromicro/go-zero/core/stores/builder"
	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/core/stores/sqlc"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
	"github.com/zeromicro/go-zero/core/stringx"
)

var (
	demoUsersFieldNames          = builder.RawFieldNames(&DemoUsers{})
	demoUsersRows                = strings.Join(demoUsersFieldNames, ",")
	demoUsersRowsExpectAutoSet   = strings.Join(stringx.Remove(demoUsersFieldNames, "`id`", "`created_at`", "`create_time`", "`update_at`", "`updated_at`", "`update_time`", "`create_at`"), ",")
	demoUsersRowsWithPlaceHolder = strings.Join(stringx.Remove(demoUsersFieldNames, "`id`", "`created_at`", "`create_time`", "`update_at`", "`updated_at`", "`update_time`", "`create_at`"), "=?,") + "=?"

	cacheDemoUsersIdPrefix = "cache:demoUsers:id:"
)

type (
	demoUsersModel interface {
		Insert(ctx context.Context, data *DemoUsers) (sql.Result, error)
		FindOne(ctx context.Context, id int64) (*DemoUsers, error)
		Update(ctx context.Context, data *DemoUsers) error
		Delete(ctx context.Context, id int64) error
	}

	defaultDemoUsersModel struct {
		sqlc.CachedConn
		table string
	}

	DemoUsers struct {
		Id             int64  `db:"id"`
		UserLogin      string `db:"user_login"`       // 账号
		UserPass       string `db:"user_pass"`        // 密码
		UserNickname   string `db:"user_nickname"`    // 昵称
		UserMobile     string `db:"user_mobile"`      // 手机号
		UserAvatar     string `db:"user_avatar"`      // 头像
		UserCreateTime int64  `db:"user_create_time"` // 创建时间
		UserStatus     int64  `db:"user_status"`      // 状态
	}
)

func newDemoUsersModel(conn sqlx.SqlConn, c cache.CacheConf) *defaultDemoUsersModel {
	return &defaultDemoUsersModel{
		CachedConn: sqlc.NewConn(conn, c),
		table:      "`demo_users`",
	}
}

func (m *defaultDemoUsersModel) Delete(ctx context.Context, id int64) error {
	demoUsersIdKey := fmt.Sprintf("%s%v", cacheDemoUsersIdPrefix, id)
	_, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("delete from %s where `id` = ?", m.table)
		return conn.ExecCtx(ctx, query, id)
	}, demoUsersIdKey)
	return err
}

func (m *defaultDemoUsersModel) FindOne(ctx context.Context, id int64) (*DemoUsers, error) {
	demoUsersIdKey := fmt.Sprintf("%s%v", cacheDemoUsersIdPrefix, id)
	var resp DemoUsers
	err := m.QueryRowCtx(ctx, &resp, demoUsersIdKey, func(ctx context.Context, conn sqlx.SqlConn, v interface{}) error {
		query := fmt.Sprintf("select %s from %s where `id` = ? limit 1", demoUsersRows, m.table)
		return conn.QueryRowCtx(ctx, v, query, id)
	})
	switch err {
	case nil:
		return &resp, nil
	case sqlc.ErrNotFound:
		return nil, ErrNotFound
	default:
		return nil, err
	}
}

func (m *defaultDemoUsersModel) Insert(ctx context.Context, data *DemoUsers) (sql.Result, error) {
	demoUsersIdKey := fmt.Sprintf("%s%v", cacheDemoUsersIdPrefix, data.Id)
	ret, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("insert into %s (%s) values (?, ?, ?, ?, ?, ?, ?)", m.table, demoUsersRowsExpectAutoSet)
		return conn.ExecCtx(ctx, query, data.UserLogin, data.UserPass, data.UserNickname, data.UserMobile, data.UserAvatar, data.UserCreateTime, data.UserStatus)
	}, demoUsersIdKey)
	return ret, err
}

func (m *defaultDemoUsersModel) Update(ctx context.Context, data *DemoUsers) error {
	demoUsersIdKey := fmt.Sprintf("%s%v", cacheDemoUsersIdPrefix, data.Id)
	_, err := m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("update %s set %s where `id` = ?", m.table, demoUsersRowsWithPlaceHolder)
		return conn.ExecCtx(ctx, query, data.UserLogin, data.UserPass, data.UserNickname, data.UserMobile, data.UserAvatar, data.UserCreateTime, data.UserStatus, data.Id)
	}, demoUsersIdKey)
	return err
}

func (m *defaultDemoUsersModel) formatPrimary(primary interface{}) string {
	return fmt.Sprintf("%s%v", cacheDemoUsersIdPrefix, primary)
}

func (m *defaultDemoUsersModel) queryPrimary(ctx context.Context, conn sqlx.SqlConn, v, primary interface{}) error {
	query := fmt.Sprintf("select %s from %s where `id` = ? limit 1", demoUsersRows, m.table)
	return conn.QueryRowCtx(ctx, v, query, primary)
}

func (m *defaultDemoUsersModel) tableName() string {
	return m.table
}