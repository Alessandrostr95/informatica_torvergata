package config

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

var db_triennale *sql.DB
var db_magistrale *sql.DB

func Connect() {
	conf := GetConfig()

	uri := fmt.Sprintf("%s:%s@tcp(%s:%d)/informatica_%s?charset=utf8&parseTime=True&loc=Local", conf.User, conf.Password, conf.Host, conf.Port, "triennale")

	d1, err := sql.Open("mysql", uri)
	if err != nil {
		panic(err)
	}
	db_triennale = d1

	uri = fmt.Sprintf("%s:%s@tcp(%s:%d)/informatica_%s?charset=utf8&parseTime=True&loc=Local", conf.User, conf.Password, conf.Host, conf.Port, "magistrale")

	d2, err := sql.Open("mysql", uri)
	if err != nil {
		panic(err)
	}
	db_magistrale = d2
}

func GetDB(cdl string) *sql.DB {
	if cdl == "triennale" {
		return db_triennale
	} else {
		return db_magistrale
	}
}
