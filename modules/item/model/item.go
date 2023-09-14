package model

import (
	"errors"
	"todolist-clean-architecture/common"
)

const (
	EntityName = "Item"
)

var (
	ErrTitleIsBlank = errors.New("title cannot be blank!")
	ErrItemDeleted  = errors.New("item is deleted!")
)

type TodoItem struct {
	common.SQLModel
	Title       string      `json:"title" gorm:"column:title;"`
	Description string      `json:"description" gorm:"column:description;"`
	Status      *ItemStatus `json:"status" gorm:"column:status;"`
}

func (TodoItem) TableName() string { return "todo_items" }

type TodoItemCreation struct {
	Id int `json:"-" gorm:"column:id;"`
	/*
		Example Error - Create Item Function (create_item,create_item_handler,create_new_item)
		Title       string      `json:"title" gorm:"column:titlee;"`
	*/
	Title       string      `json:"title" gorm:"column:title;"`
	Description string      `json:"description" gorm:"column:description;"`
	Status      *ItemStatus `json:"status" gorm:"column:status;"`
}

func (TodoItemCreation) TableName() string { return TodoItem{}.TableName() }

type TodoItemUpdate struct {
	Title       *string     `json:"title" gorm:"column:title;"`
	Description *string     `json:"description" gorm:"column:description;"`
	Status      *ItemStatus `json:"status" gorm:"column:status;"`
}

func (TodoItemUpdate) TableName() string { return TodoItem{}.TableName() }
