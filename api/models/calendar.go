package models

import "fmt"

type Calendar struct {
	CourseYear string `json:"coures_year"`
	Name       string `json:"name"`
	Code       string `json:"code"`
	Year       string `json:"year"`
	Semester   int    `json:"semester"`
	Day        int    `json:"day"`
	StartTime  string `json:"start_time"`
	EndTime    string `json:"end_time"`
	Room       string `json:"room"`
	Building   string `json:"building"`
}

func GetCalendar(year, cdl string, semester int) ([]Calendar, error) {
	var calendars []Calendar

	db := GetDbByCdl(cdl)
	query := fmt.Sprintf(
		"select course_year, class.name, calendar.* "+
			"from class, class_offered, calendar "+
			"where calendar.class = class_offered.class "+
			"and calendar.year = class_offered.year "+
			"and class_offered.class = class.code "+
			"and calendar.year = '%s' "+
			"and calendar.semester = %d "+
			"order by class.course_year, day, start_time;",
		year,
		semester,
	)

	res, err := db.Query(query)
	if err != nil {
		return make([]Calendar, 0), nil
	}

	for res.Next() {
		var calendar Calendar
		res.Scan(
			&calendar.CourseYear,
			&calendar.Name,
			&calendar.Code,
			&calendar.Year,
			&calendar.Semester,
			&calendar.Day,
			&calendar.StartTime,
			&calendar.EndTime,
			&calendar.Room,
			&calendar.Building,
		)
		calendars = append(calendars, calendar)
	}

	if len(calendars) == 0 {
		return make([]Calendar, 0), nil
	}
	return calendars, nil
}
