package config

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

var db_triennale *sql.DB
var db_magistrale *sql.DB

func Connect() {
	d1, err := sql.Open("mysql", "informatica:mu99Db6JWwWXAeLK@tcp(localhost:3306)/informatica_triennale?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		panic(err)
	}
	db_triennale = d1

	d2, err := sql.Open("mysql", "informatica:mu99Db6JWwWXAeLK@tcp(localhost:3306)/informatica_magistrale?charset=utf8&parseTime=True&loc=Local")
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
