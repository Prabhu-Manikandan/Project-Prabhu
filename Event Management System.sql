-- create tabels for Events,Attendees,and Registrations
CREATE TABLE Events(Event_Id INT PRIMARY KEY,Event_Name VARCHAR(100),Event_Date DATE,Event_Location VARCHAR(100),Event_Description VARCHAR(100));
CREATE TABLE Attendees(Attendee_Id INT PRIMARY KEY,Attendee_Name VARCHAR(100),Attendee_Phone VARCHAR(100),Attendee_Email VARCHAR(100),Attendee_City VARCHAR(100));
CREATE TABLE Registrations(Registration_Id INT PRIMARY KEY,Event_Id INT,Attendee_Id INT,Registation_Date DATE,Registration_Amount DECIMAL(10,2), FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id));

-- Insert sample datasets
INSERT INTO Events VALUES
(1001,'International Summit','2024-02-05','London','Annual GEN AI Summit'),
(1002,'Confrence','2024-05-22','Los Angels','Annual Tech Confrence'),
(1003,'Workshop','2024-08-15','India','International Workshop about Digital Trends'),
(1004,'Seminar','2024-10-02','Japan','International seminar about AI Technologies'),
(1005,'Festivel','2023-12-02','Chennai','16 Anniversary of infocareer');

INSERT INTO Attendees VALUES
(101,'Sam',8542698752,'sampaul5297@gmail.com','Texas'),
(102,'Jack',9857552652,'jackandreson@gmail.com','Paris'),
(103,'Arun',8788585232,'arunarjun25@gmail.com','Delhi'),
(104,'Krishna',6379885242,'krishnakumar564@gmail.com','Tamilnadu'),
(105,'James',9945265263,'Jamescameo5588@gmail.com','Poland');

INSERT INTO Registrations VALUES
(001,1001,101,'2024-01-31',5000.00),
(002,1002,102,'2024-04-15',2500.00),
(003,1003,103,'2024-07-02',3000.00),
(004,1004,104,'2024-09-24',1000.50),
(005,1005,105,'2023-11-30',500.25);

-- Management Event Details
-- Insert new event
INSERT INTO Events VALUES(1008,'Connect','2025-01-15','New Delhi','Educational Leaders Connect');

-- Updating an event's information
UPDATE Events SET Event_Location = 'Wasington' WHERE Event_Id = 1001;

-- Deleting an Event
DELETE FROM Events WHERE Event_Id = 1005; -- cannot delete this row beacuse Event_Id associate with the foreign_key contraints.

-- Manage Track Attendees & Handle Events
-- Insert a new attendee
INSERT INTO Attendees VALUES(106,'Prabhu',7010913695,'jc.prabhu5297@gmail.com','Chennai');

-- Registering an attendee for an event.
INSERT INTO Registrations VALUES(006,1005,106,'2023-12-02',500.25);

-- Retrive Even Information
SELECT * FROM Events;

-- Generate Attendee List
SELECT Attendees.*
FROM Attendees
JOIN Registrations
ON Registrations.Attendee_Id = Attendees.Attendee_Id
WHERE Registrations.Event_Id = 1005;

-- Calculate event attendence statistics
SELECT count(*) AS Total_Attendees
FROM Registrations
WHERE Event_Id = 1005;

