package logic

import (
	"context"

	"luna/search/internal/svc"
	"luna/search/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type SearchLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

func NewSearchLogic(ctx context.Context, svcCtx *svc.ServiceContext) *SearchLogic {
	return &SearchLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *SearchLogic) Search(req *types.SearchReq) (resp *types.SearchReply, err error) {
	// 打印一下用户信息
	logx.Infof("userId: %v", l.ctx.Value("userId")) // 这里的key和生成jwt token时传入的key一致
	return &types.SearchReply{
		Name:  "汪汪汪",
		Count: 0,
	}, nil
}
