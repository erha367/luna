package handler

import (
	"net/http"

	"github.com/zeromicro/go-zero/rest/httpx"
	"luna/search/internal/logic"
	"luna/search/internal/svc"
)

func pingHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		l := logic.NewPingLogic(r.Context(), svcCtx)
		err := l.Ping()
		if err != nil {
			httpx.Error(w, err)
		} else {
			httpx.Ok(w)
		}
	}
}
