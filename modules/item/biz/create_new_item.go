package biz

import (
	"context"
	"strings"
	"todolist-clean-architecture/modules/item/model"
)

type CreateItemStorage interface {
	CreateItem(ctx context.Context, data *model.TodoItemCreation) error
}

type createItemBiz struct {
	store CreateItemStorage
}

func NewCreateItemBiz(store CreateItemStorage) *createItemBiz {
	return &createItemBiz{store: store}
}

func (biz *createItemBiz) CreateNewItem(ctx context.Context, data *model.TodoItemCreation) error {
	if strings.TrimSpace(data.Title) == "" {
		return model.ErrTitleIsBlank
	}
	if err := biz.store.CreateItem(ctx, data); err != nil {
		return err
	}

	return nil
}
