package routes

import (
	"github.com/gorilla/mux"

	"informatica.uniroma2.eu/api/controllers"
)

func RegisterRoutes(router *mux.Router) {
	router.HandleFunc("/api/data/{cdl}/{year}/teacher", controllers.GetAllTeachers).Methods("GET")
	router.HandleFunc("/api/data/{cdl}/{year}/class", controllers.GetAllClasses).Methods("GET")
	router.HandleFunc("/api/data/{cdl}/{year}/calendar/{semester}", controllers.GetCalendarBySemester).Methods("GET")
}
