package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
	"net/http"
	"os"
	"todolist-clean-architecture/common"
	"todolist-clean-architecture/middleware"
	ginitem "todolist-clean-architecture/modules/item/transport/gin"
)

func main() {
	dsn := os.Getenv("DB_CONN_STR")
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatalln(err)
	}

	r := gin.Default()
	r.Use(middleware.Recovery())
	/*
		Có 3 cách sử dụng Middleware
		Cách 1 :
		r.Use(middleware.Recovery())
	*/

	v1 := r.Group("/v1")
	/*
		Cách 2:
		v1 := r.Group("/v1",middleware.Recovery())
	*/
	{
		items := v1.Group("/items")
		{
			/*
				Cách 3:
				items.POST("", middleware.Recovery(), ginitem.CreateItem(db))
			*/
			items.POST("", ginitem.CreateItem(db))
			items.GET("", ginitem.ListItem(db))
			items.GET("/:id", ginitem.GetItem(db))
			items.PATCH("/:id", ginitem.UpdateItem(db))
			items.DELETE("/:id", ginitem.DeleteItem(db))
		}
	}

	r.GET("/ping", func(c *gin.Context) {
		/*fmt.Println([]int{}[0])*/
		go func() {
			defer common.Recovery()
			fmt.Println([]int{}[0])
		}()
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.Run(":3030")
}
