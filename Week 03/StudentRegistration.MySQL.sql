-- create the database
DROP DATABASE IF EXISTS student_registration;
CREATE DATABASE student_registration;

use student_registration;

CREATE TABLE Student (
	StudentID INT NOT NULL PRIMARY KEY,
	StudentName	VARCHAR(200) NOT NULL
);

CREATE TABLE Faculty (
	FacultyID INT NOT NULL PRIMARY KEY,
	FacultyName	VARCHAR(200) NOT NULL
);

CREATE TABLE Course (
	CourseID VARCHAR(10) NOT NULL PRIMARY KEY,
	CourseName	VARCHAR(200) NOT NULL --  ,
	-- CONSTRAINT Book_Author_FK FOREIGN KEY (AUTHID) REFERENCES Author(AUTHID)
);

CREATE TABLE Qualified (
	FacultyID INT NOT NULL,
	CourseID VARCHAR(10) NOT NULL,
	DateQualified DATE NOT NULL,
	CONSTRAINT Qualified_PK PRIMARY KEY (FacultyID, CourseID),
	CONSTRAINT Qualified_Faculty_FK FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
	CONSTRAINT Qualified_Course_FK FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Section (
	SectionNo INT NOT NULL PRIMARY KEY,
	Semester VARCHAR(10) NOT NULL,
	CourseID VARCHAR(10) NOT NULL,
	CONSTRAINT Section_Course_FK FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Registration (
	StudentID INT NOT NULL,
    SectionNo INT NOT NULL,
	CONSTRAINT Registration_PK PRIMARY KEY (StudentID, SectionNo),
	CONSTRAINT Registration_Student_FK FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	CONSTRAINT Registration_Section_FK FOREIGN KEY (SectionNo) REFERENCES Section(SectionNo)
);

INSERT INTO Student (StudentID, StudentName) 
	VALUES
		(38214, 'Letersky'),
		(54907, 'Alvater'),
		(66324, 'Aiken'),
		(70542, 'Marra')
		;
		
INSERT INTO Faculty (FacultyID, FacultyName) 
	VALUES
		(2143, 'Birkin'),
		(3467, 'Berndt'),
		(4756, 'Collins')
		;
		
INSERT INTO Course (CourseID, CourseName) 
	VALUES
		('ISM 3113', 'Syst Anlysis'),
		('ISM 3112', 'Syst Design'),
		('ISM 4212', 'Database'),
		('ISM 4930', 'Networking')
		;
		
INSERT INTO Qualified (FacultyID, CourseID, DateQualified) 
	VALUES
		(2143, 'ISM 3112', '2008-09-01'),
		(2143, 'ISM 3113', '2008-09-01'),
		(3467, 'ISM 4212', '2015-09-01'),
		(3467, 'ISM 4930', '2016-09-01'),
		(4756, 'ISM 3113', '2011-09-01'),
		(4756, 'ISM 3112', '2011-09-01')
		;
		
INSERT INTO Section (SectionNo, Semester, CourseID) 
	VALUES
		(2712, 'I-2018', 'ISM 3113'),
		(2713, 'I-2018', 'ISM 3113'),
		(2714, 'I-2018', 'ISM 4212'),
		(2715, 'I-2018', 'ISM 4930')
		;
		
INSERT INTO Registration (StudentID, SectionNo) 
	VALUES
		(38214, 2714),
		(54907, 2714),
		(54907, 2715),
		(66324, 2713)
		;