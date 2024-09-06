use student_registration;
SELECT * FROM Student WHERE StudentID NOT IN (SELECT StudentID FROM Section WHERE Semester='II-2015');
-- SELECT StudentID FROM Section WHERE Semester='II-2015';
-- SELECT * FROM Student WHERE StudentID NOT IN (SELECT Se.StudentID FROM Section Se WHERE Semester='II-2015');