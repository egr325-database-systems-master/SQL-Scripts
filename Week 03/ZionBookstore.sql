
-- create the database
DROP DATABASE IF EXISTS zion_bookstore;
CREATE DATABASE zion_bookstore;

-- select the database
USE zion_bookstore;

CREATE TABLE Author (
  ID INT NOT NULL,
  FirstName VARCHAR(45) DEFAULT NULL,
  LastName VARCHAR(45) DEFAULT NULL,
  BirthDate DATE DEFAULT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO Author VALUES
(1,'Jennifer','McCoy', '1980-05-01'),
(2,'Yuto','Takahashi', '1973-12-04'),
(3,'Jose','Martinez', NULL),
(4,'Jasmine','Baxter', NULL),
(5,'Xiu','Tao', '1992-11-13'),
(6,'Ethan','Lonestar', '1965-02-15'),
(7,'Amar','Agarwal', NULL),
(8,'Emilia','Russo', '1999-08-03');

CREATE TABLE Book (
  ID INT NOT NULL,
  Title VARCHAR(200) DEFAULT NULL,
  Publisher VARCHAR(45) DEFAULT NULL,
  Category VARCHAR(20) CHECK (Category IN ('adventure','drama','fantasy','humor','romance','scifi')),
  Price DECIMAL(6,2) DEFAULT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO Book VALUES
(100,'The Black Box','Wright Pub','adventure',22.50),
(101,'Lost Time','Caster','scifi',19.99),
(102,'Which Way Home?','Light House','humor',8.99),
(103,'Grant Me Three Wishes','Caster','romance',10.75),
(104,'The Last Attempt','Longshot','scifi',15.99),
(105,'My Crazy Life','Light House','humor',9.67);


CREATE TABLE BookAuthor (
  AuthorID INT NOT NULL,
  BookID INT NOT NULL,
  PRIMARY KEY (AuthorID, BookID),
  FOREIGN KEY (AuthorID) REFERENCES Author (ID),
  FOREIGN KEY (BookID) REFERENCES Book (ID) 
);

INSERT INTO BookAuthor VALUES
(2,100),
(3,100),
(4,101),
(7,102),
(8,102),
(5,103),
(1,104),
(8,105);

CREATE TABLE Customer (
  ID INT NOT NULL,
  FirstName VARCHAR(45) DEFAULT NULL,
  LastName VARCHAR(45) DEFAULT NULL,
  Address VARCHAR(45) DEFAULT NULL,
  City VARCHAR(45) DEFAULT NULL,
  State CHAR(2) DEFAULT NULL,
  Zip INT DEFAULT NULL,
  PRIMARY KEY (ID)
);

INSERT INTO Customer VALUES
(1,'Jill','Halloway','101 Main St','Boulder','CO',80301),
(2,'Mario','Androsa','4545 N 1st St','Tulsa','OK',74008),
(3,'Erica','MacCallum','999 S Fir Ct','Breckenridge','CO',80424),
(4,'John','Patrick de la Cruz','501 N Main','Albuquerque','NM',87109),
(5,'Anna','Green','600 S Main','Los Alamos','NM',87544),
(6,'Mo','Yan','211 W Lipan','Edmond','OK',73013),
(7,'Alexis','Brookhart','9000 S Greenwood','Englewood','CO',80110),
(8,'Hala','Nassar','840 N Pine St','Oklahoma City','OK',73008);


CREATE TABLE Sale (
  ID INT AUTO_INCREMENT NOT NULL,
  CustID INT DEFAULT NULL,
  BookID INT DEFAULT NULL,
  UnitPrice DECIMAL(6,2) DEFAULT NULL,
  Quantity INT DEFAULT NULL,
  Date DATETIME DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (CustID) REFERENCES Customer (ID),
  FOREIGN KEY (BookID) REFERENCES Book (ID)
);

INSERT INTO Sale (CustID, BookID, UnitPrice, Quantity, Date) VALUES 
(1,103,10.99,1,'2020-02-14 12:30:00'),
(2,104,15.5,2,'2020-02-15 14:15:00'),
(3,101,21.99,1,'2020-02-15 19:10:00'),
(6,104,16.00,2,'2020-02-15 19:25:00'),
(4,102,9.75,1,'2020-02-16 11:05:00'),
(4,105,9.50,1,'2020-02-16 11:05:00'),
(2,102,9.75,1,'2020-02-16 11:30:00'),
(5,104,16.0,1,'2020-02-16 15:25:00'),
(6,100,22.3,2,'2020-02-16 16:00:00'),
(2,103,10.99,1,'2020-02-17 12:30:00'),
(7,103,14.99,3,'2020-02-21 14:25:00'),
(7,104,16.00,1,'2020-02-21 14:25:00'),
(7,105,10.00,1,'2020-02-21 14:25:00'),
(1,101,15.20,1,'2020-02-22 13:15:00'),
(2,105,9.50,1,'2020-03-05 10:18:00'),
(1,100,22.5,1,'2021-02-01 09:15:00'),
(2,103,10.99,1,'2021-02-01 13:15:00'),
(2,101,15.60,1,'2021-02-01 13:15:00'),
(3,103,14.99,1,'2021-02-01 13:15:00');