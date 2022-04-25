package config

import "github.com/BurntSushi/toml"

type Config struct {
	User     string
	Password string
	Host     string
	Port     int
}

var conf Config

func init() {
	if _, err := toml.DecodeFile("config/config.toml", &conf); err != nil {
		panic(err)
	}
}

func GetConfig() Config {
	return conf
}
