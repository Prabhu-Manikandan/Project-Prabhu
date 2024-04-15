-- Database Creation for Acadamic Management System

create database Acadamic_Management_System;

use Acadamic_Management_System;

-- creating table for Student_Info,Course_Info,Enrollment_Info

create table StudentInfo(STU_ID int (100) primary key,STU_NAME varchar(100),DOB date,PHONE_NO numeric(10),EMAIL_ID varchar(100),ADDRESS varchar(300));

create table CourseInfo(COURSE_ID int (100) primary key,COURSE_NAME varchar(100),COURSE_INSTRUCTOR_NAME varchar(100));

create table EnrollmentInfo(ENROLLMENT_ID int (100) primary key,STU_ID INT, foreign key (STU_ID) references StudentInfo(STU_ID),COURSE_ID int, foreign key (COURSE_ID) references CourseInfo(COURSE_ID),ENROLL_STATUS VARCHAR(100));

-- Inserting table values
-- insert values into StudentInfo
insert into StudentInfo values
(001,'Prabhu','1997-02-05',7010913695,'jc.prabhu5297@gmail.com','chennai'),
(002,'Shankar','1998-04-30',8883815469,'shankarmani23@gmail.com','Namakkal'),
(003,'vijay','2000-10-25',8597556252,'vijays5298@gmail.com','Erode'),
(004,'Ajith','1989-01-01',9578265425,'ajithraghav26@gmail.com','Salem'),
(005,'Arun','1998-04-30',6348569552,'arunselva4563@gmail.com','Namakkal'),
(006,'Birundha','1995-05-06',7898565226,'Birundhas4568@gmail.com','Chennai');


-- insert values into Course_Info
insert into CourseInfo values
(101,'Computer Science','Manikandan'),
(102,'Electronic Communication','Murali'),
(103,'Civil','Vijay'),
(104,'Mechanical','Aravind'),
(105,'Electrical','Sri Priya'),
(106,'Aeronatical','Indhu'),
(107,'Bio Medical','Madhan');

-- insert values into Enrollment_Info
insert into Enrollment_Info values
(10001,001,101,'FULL-TIME'),
(10501,002,103,'PART-TIME'),
(10002,003,102,'FULL-TIME'),
(10550,004,104,'FULL-TIME'),
(10003,005,105,'FULL-TIME'),
(10425,006,107,'PART-TIME'),
(10252,002,106,'FULL-TIME'),
(10555,007,105,'FULL-TIME');

SELECT * FROM  Enrollment_Info;

-- a) Retriving student details,Enrollment_Status
select S.STU_NAME,S.PHONE_NO,S.ADDRESS,S.EMAIL_ID,E.ENROLL_STATUS
from StudentInfo S
join EnrollmentInfo E
on S.STU_ID=E.STU_ID; 

-- b) Retrive list of course in which a specific student is enrolled.
select C.COURSE_NAME
from CourseInfo C
join EnrollmentInfo E
on C.COURSE_ID = E.COURSE_ID
where E.STU_ID=1;

-- c) Retrive course information include course name,instructor information
select COURSE_NAME,COURSE_INSTRUCTOR_NAME
from CourseInfo;

-- d) Retrive course information for specific course
select * from CourseInfo where COURSE_ID = 105;

-- e) Retrive course information for multiple course
select * from CourseInfo where COURSE_ID IN (101,103,105,106);

-- 4. Reporting and Analytics(Using joining queries)
-- a) write a query to retrive the number of students enrolled in each course.
select C.COURSE_NAME,count(E.STU_ID) AS STU_COUNT
FROM CourseInfo C
left join EnrollmentInfo E on C.COURSE_ID=E.COURSE_ID
group by C.COURSE_NAME;

-- b) retrive a query list of students enroll in a specific course
select S.STU_NAME
from StudentInfo S
inner join EnrollmentInfo E
on S.STU_ID=E.STU_ID
where E.COURSE_ID = 103;

-- c) write a query to retrive the count of enrolled students for each instructor
select C.COURSE_INSTRUCTOR_NAME,count(E.STU_ID) AS Students_Enroll_count
FROM CourseInfo C
left join EnrollmentInfo E 
on C.COURSE_ID=E.COURSE_ID
group by C.COURSE_INSTRUCTOR_NAME;

-- d) write a query to retrive the list of students who are enrolled in multiple courses.
select S.STU_NAME
from StudentInfo S 
inner join EnrollmentInfo E
on S.STU_ID = E.STU_ID
GROUP BY S.STU_ID,S.STU_NAME
HAVING COUNT(E.COURSE_ID) > 1;

-- e) write a query to retrive the courses that have the highest no of enrolled students(arrange from highest to lowest)
select C.COURSE_NAME,count(E.STU_ID) as Enroll_Student_Count
from CourseInfo C 
left join EnrollmentInfo E
on C.COURSE_ID=E.COURSE_ID
group by c.COURSE_ID,C.COURSE_NAME
order by Enroll_Student_Count desc;












