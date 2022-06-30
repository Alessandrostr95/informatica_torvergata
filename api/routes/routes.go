package routes

import (
	"net/http"
	"os"

	"github.com/gorilla/mux"

	"informatica.uniroma2.eu/api/controllers"
)

func RegisterRoutes(router *mux.Router) {
	router.HandleFunc("/api/data/{cdl}/{year}/teacher", controllers.GetAllTeachers).Methods("GET")
	router.HandleFunc("/api/data/{cdl}/{year}/class", controllers.GetAllClasses).Methods("GET")
	router.HandleFunc("/api/data/{cdl}/{year}/calendar/{semester}", controllers.GetCalendarBySemester).Methods("GET")
	router.HandleFunc("/api/data/news", controllers.GetNews).Methods("GET")
	router.HandleFunc("/api/data/images/{img}", func(w http.ResponseWriter, r *http.Request) {
		path := "static/images/" + mux.Vars(r)["img"]
		if _, err := os.Stat(path); err == nil {
			http.ServeFile(w, r, path)
		} else {
			http.ServeFile(w, r, "static/images/404.png")
		}
		return
	}).Methods("GET")
	router.HandleFunc("/api/data/{cdl}/{year}/exam/{session}", controllers.GetExamsBySession).Methods("GET")
}
