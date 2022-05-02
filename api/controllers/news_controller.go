package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"informatica.uniroma2.eu/api/models"
)

func GetNews(w http.ResponseWriter, r *http.Request) {
	news, err := models.GetNews()

	if err != nil {
		fmt.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	res, err := json.Marshal(news.Items)

	if err != nil {
		fmt.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	fmt.Fprintf(w, "%+v", string(res))
}
