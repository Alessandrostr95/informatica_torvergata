package controllers

import (
	"net/http"
	// "database/sql"
	// _ "github.com/go-sql-driver/mysql"
)

func TestHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("prova test"))
}

// func GetTeachers(w http.ResponseWriter, r *http.Request) {
// 	var teachers []models.Teacher

// 	rows, err := config.GetDB().Query("SELECT * FROM teacher")

// 	if err != nil {
// 		fmt.Println(err)
// 		fmt.Fprintln(w, err)
// 		return
// 	}

// 	for rows.Next() {
// 		var teacher models.Teacher
// 		rows.Scan(
// 			&teacher.Id,
// 			&teacher.FirstName,
// 			&teacher.LastName,
// 			&teacher.Qualification,
// 			&teacher.Office,
// 			&teacher.Phone,
// 			&teacher.Mail,
// 			&teacher.Website,
// 		)
// 		teachers = append(teachers, teacher)
// 		fmt.Fprintln(w, teacher)
// 	}

// 	fmt.Println(teachers)
// 	w.Header().Set("Content-Type", "application/json")
// 	w.WriteHeader(http.StatusOK)
// }
