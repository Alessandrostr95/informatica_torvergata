package models

import (
	"os"

	"github.com/mmcdole/gofeed"
)

type News struct {
	Id      int64  `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
	Author  string `json:"author"`
	Date    string `json:"date"`
	Link    string `json:"link"`
}

func GetNews() (*gofeed.Feed, error) {
	file, _ := os.Open("data/news.xml")
	defer file.Close()
	fp := gofeed.NewParser()
	feed, _ := fp.Parse(file)
	return feed, nil
}
