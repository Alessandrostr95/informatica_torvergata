package models

import (
	"fmt"
)

type Exam struct {
	Code       string `json:"code"`
	Name       string `json:"name"`
	CourseYear int    `json:"course_year"`
	Year       string `json:"year"`
	Session    string `json:"session"`
	Call       int    `json:"call"`
	Type       string `json:"type"`
	Date       string `json:"date"`
	Hour       string `json:"hour"`
	Room       string `json:"room"`
	Cfu        int    `json:"cfu"`
	Sector     string `json:"sector"`
}

func GetExams(year string, cdl string, session string) ([]Exam, error) {
	var exams []Exam

	query := fmt.Sprintf(
		"select exam.class, class.name, class.course_year, exam.year, exam.session, exam.call, exam.type, exam.date, exam.hour, exam.room, class_offered.cfu, class.sector "+
			"from class, class_offered, exam "+
			"where exam.class = class_offered.class "+
			"and exam.year = class_offered.year "+
			"and class_offered.class = class.code "+
			"and exam.year = '%s' "+
			"and exam.session = '%s';",
		year,
		session,
	)

	db := GetDbByCdl(cdl)
	rows, err := db.Query(query)

	if err != nil {
		return make([]Exam, 0), err
	}

	for rows.Next() {
		var e Exam
		rows.Scan(
			&e.Code,
			&e.Name,
			&e.CourseYear,
			&e.Year,
			&e.Session,
			&e.Call,
			&e.Type,
			&e.Date,
			&e.Hour,
			&e.Room,
			&e.Cfu,
			&e.Sector,
		)
		exams = append(exams, e)
	}

	if len(exams) == 0 {
		return make([]Exam, 0), nil
	}
	return exams, nil
}
