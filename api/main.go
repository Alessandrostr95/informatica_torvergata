package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/rs/cors"

	"informatica.uniroma2.eu/api/routes"
)

func main() {
	r := mux.NewRouter()
	routes.RegisterRoutes(r)
	http.Handle("/", r)
	fmt.Println("Server is running on port 8080")

	handler := cors.New(
		cors.Options{
			AllowedOrigins: []string{"*"},
		},
	).Handler(r)
	log.Fatal(http.ListenAndServe(":8080", handler))
}
