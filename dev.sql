-- define a select statement to get all students enrolled in a course 
-- and the location of the course.
SELECT s.first_name, s.last_name, l.location_name
FROM courses.students s
JOIN courses.registrations r
ON s.student_id = r.student_id
JOIN courses.locations l
ON r.location_id = l.location_id
WHERE r.registration_status = 2
AND r.course_id = 1;


-- write an index to improve the performance of the query
CREATE INDEX idx_registrations_course_id

-- define a table for student attendance to capture attendance by class
CREATE TABLE courses.attendance (
    attendance_id INT IDENTITY (1, 1) PRIMARY KEY,
    registration_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status tinyint NOT NULL,
    -- Attendance status: 1 = Present; 2 = Absent; 3 = Late
    FOREIGN KEY (registration_id) REFERENCES courses.registrations (registration_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- define a stored procedure to get course enrollment by location
CREATE PROCEDURE courses.GetCourseEnrollmentByLocation
    @location_id INT
AS
BEGIN
    -- select statement to get course enrollment by location
    SELECT c.course_name, COUNT(r.registration_id) AS enrollment_count
    FROM courses.courses c
    JOIN courses.registrations r ON c.course_id = r.course_id
    WHERE r.location_id = @location_id
    GROUP BY c.course_name;
END;

CREATE PROCEDURE GetInstructorDetailsByLocation
    @instructor_id INT
AS
BEGIN
    SELECT i.instructor_name, i.instructor_email, l.location_name, l.location_address, c.course_name
    FROM instructors i
    JOIN locations l ON i.location_id = l.location_id
    JOIN courses_instructors ci ON i.instructor_id = ci.instructor_id
    JOIN courses c ON ci.course_id = c.course_id
    WHERE i.instructor_id = @instructor_id;
END;


SELECT *
FROM courses.registration
WHERE year(registration_date) = 2023
AND month(registration_date) = 9
AND day(registration_date) = 1;



