package models

import (
	"fmt"
)

type Class struct {
	Code          string         `json:"code"`
	Name          string         `json:"name"`
	Sector        string         `json:"sector"`
	CouresYear    int            `json:"coures_year"`
	Year          string         `json:"year"`
	Cfu           int            `json:"cfu"`
	Teachers      []teacher      `json:"teachers"`
	Prerequisites []prerequisite `json:"prerequisites"`
}

func GetClasses(year string, cdl string) ([]Class, error) {
	var classes []Class

	query := fmt.Sprintf(
		"select class.*, class_offered.year, class_offered.cfu "+
			"from class, class_offered "+
			"where class.code = class_offered.class "+
			"and class_offered.year = '%s';",
		year,
	)

	db := GetDbByCdl(cdl)
	rows, err := db.Query(query)

	if err != nil {
		return make([]Class, 0), err
	}

	for rows.Next() {
		var c Class
		rows.Scan(
			&c.Code,
			&c.Name,
			&c.Sector,
			&c.CouresYear,
			&c.Year,
			&c.Cfu,
		)
		prerequisites, _ := GetPrerequisites(c.Code, cdl)
		c.Prerequisites = prerequisites

		teachers, _ := GetTeachersByClass(c.Code, year, cdl)
		c.Teachers = teachers

		classes = append(classes, c)
	}

	if len(classes) == 0 {
		return make([]Class, 0), nil
	}
	return classes, nil
}

type prerequisite struct {
	Code       string `json:"code"`
	Name       string `json:"name"`
	Sector     string `json:"sector"`
	CouresYear int    `json:"coures_year"`
}

func GetPrerequisites(code string, cdl string) ([]prerequisite, error) {
	var prerequisites []prerequisite

	query := fmt.Sprintf(
		"select prerequisite.prerequisite as code, class.name, class.sector, class.course_year "+
			"from prerequisite, class "+
			"where prerequisite.prerequisite = class.code "+
			"and prerequisite.class = '%s';",
		code,
	)

	db := GetDbByCdl(cdl)
	rows, err := db.Query(query)

	if err != nil {
		return make([]prerequisite, 0), err
	}

	for rows.Next() {
		var prereq prerequisite
		rows.Scan(
			&prereq.Code,
			&prereq.Name,
			&prereq.Sector,
			&prereq.CouresYear,
		)
		prerequisites = append(prerequisites, prereq)
	}

	if len(prerequisites) == 0 {
		return make([]prerequisite, 0), nil
	}

	return prerequisites, nil
}

type teacher struct {
	Id        int    `json:"id"`
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
}

func GetTeachersByClass(code string, year string, cdl string) ([]teacher, error) {
	var teachers []teacher

	query := fmt.Sprintf(
		"select teacher.id, teacher.firstname, teacher.lastname "+
			"from teach, teacher "+
			"where teach.teacher = teacher.id "+
			"and teach.class = '%s' "+
			"and teach.year = '%s';",
		code,
		year,
	)

	db := GetDbByCdl(cdl)
	rows, err := db.Query(query)

	if err != nil {
		return make([]teacher, 0), err
	}

	for rows.Next() {
		var t teacher
		rows.Scan(
			&t.Id,
			&t.FirstName,
			&t.LastName,
		)
		teachers = append(teachers, t)
	}

	return teachers, nil
}
