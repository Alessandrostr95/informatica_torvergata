package models

import (
	"database/sql"
	"fmt"

	"informatica.uniroma2.eu/api/config"
)

type Teacher struct {
	Id            int     `json:"id"`
	FirstName     string  `json:"first_name"`
	LastName      string  `json:"last_name"`
	Qualification string  `json:"qualification"`
	Office        string  `json:"office"`
	Phone         string  `json:"phone"`
	Mail          string  `json:"mail"`
	Website       string  `json:"website"`
	Classes       []class `json:"classes"`
}

var db_triennale *sql.DB
var db_magistrale *sql.DB

func init() {
	config.Connect()
	db_triennale = config.GetDB("triennale")
	db_magistrale = config.GetDB("magistrale")
}

func GetDbByCdl(cdl string) *sql.DB {
	var db *sql.DB
	if cdl == "triennale" {
		db = db_triennale
	} else {
		db = db_magistrale
	}
	return db
}

func GetTeachers(year string, cdl string) ([]Teacher, error) {
	var teachers []Teacher

	db := GetDbByCdl(cdl)
	rows, err := db.Query("SELECT * FROM teacher")

	if err != nil {
		return nil, err
	}

	for rows.Next() {
		var teacher Teacher
		rows.Scan(
			&teacher.Id,
			&teacher.FirstName,
			&teacher.LastName,
			&teacher.Qualification,
			&teacher.Office,
			&teacher.Phone,
			&teacher.Mail,
			&teacher.Website,
		)

		classes, err := GetClassesByTeacherId(teacher.Id, year, cdl)
		if err != nil {
			return make([]Teacher, 0), err
		}
		teacher.Classes = classes
		teachers = append(teachers, teacher)
	}

	if len(teachers) == 0 {
		return make([]Teacher, 0), nil
	}
	return teachers, nil
}

type class struct {
	Code       string `json:"code"`
	Name       string `json:"name"`
	Sector     string `json:"sector"`
	CouresYear int    `json:"coures_year"`
	Year       string `json:"year"`
	Cfu        int    `json:"cfu"`
}

func GetClassesByTeacherId(id int, year string, cdl string) ([]class, error) {
	var classes []class

	query := fmt.Sprintf(
		"select class.*, class_offered.year, class_offered.cfu "+
			"from class, class_offered, teach "+
			"where class.code = class_offered.class "+
			"and class_offered.year = '%s' "+
			"and class_offered.class = teach.class "+
			"and class_offered.year = teach.year "+
			"and teach.teacher = %d;",
		year,
		id,
	)

	db := GetDbByCdl(cdl)
	rows, err := db.Query(query)

	if err != nil {
		return make([]class, 0), err
	}

	for rows.Next() {
		var c class
		rows.Scan(
			&c.Code,
			&c.Name,
			&c.Sector,
			&c.CouresYear,
			&c.Year,
			&c.Cfu,
		)
		classes = append(classes, c)
	}

	if len(classes) == 0 {
		return make([]class, 0), nil
	}
	return classes, nil
}
