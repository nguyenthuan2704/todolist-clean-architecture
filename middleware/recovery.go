package middleware

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"todolist-clean-architecture/common"
)

func Recovery() func(*gin.Context) {
	return func(c *gin.Context) {
		defer func() {
			if r := recover(); r != nil {
				if err, ok := r.(error); ok {
					c.AbortWithStatusJSON(http.StatusInternalServerError, common.ErrInternal(err))
				}
				panic(r)
			}
		}()
		c.Next()
	}
}
