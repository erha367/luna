package logic

import (
	"context"

	"luna/user/rpc/internal/svc"
	"luna/user/rpc/types/user"

	"github.com/zeromicro/go-zero/core/logx"
)

type GetUserLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
	logx.Logger
}

func NewGetUserLogic(ctx context.Context, svcCtx *svc.ServiceContext) *GetUserLogic {
	return &GetUserLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
		Logger: logx.WithContext(ctx),
	}
}

func (l *GetUserLogic) GetUser(in *user.IdReq) (*user.UserInfoReply, error) {
	// todo: add your logic here and delete this line
	one, err := l.svcCtx.UserModel.FindOne(l.ctx, in.Id)
	if err != nil {
		return nil, err
	}
	return &user.UserInfoReply{
		Id:     one.Id,
		Name:   one.UserNickname,
		Number: `2`,
		Gender: `male`,
	}, nil
}
