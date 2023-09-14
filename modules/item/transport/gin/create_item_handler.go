package ginitem

import (
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"net/http"
	"todolist-clean-architecture/common"
	"todolist-clean-architecture/modules/item/biz"
	"todolist-clean-architecture/modules/item/model"
	"todolist-clean-architecture/modules/item/storage"
)

func CreateItem(db *gorm.DB) func(*gin.Context) {
	return func(c *gin.Context) {
		var data model.TodoItemCreation

		if err := c.ShouldBind(&data); err != nil {
			c.JSON(http.StatusBadRequest, common.ErrInvalidRequest(err))

			return
		}
		store := storage.NewSQLStore(db)
		business := biz.NewCreateItemBiz(store)
		if err := business.CreateNewItem(c.Request.Context(), &data); err != nil {
			c.JSON(http.StatusBadRequest, err)
			return
		}
		c.JSON(http.StatusOK, common.SimpleSuccessResponse(data.Id))
	}
}
