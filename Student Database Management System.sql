-- creating student_database
CREATE DATABASE student_database;

-- create table
CREATE TABLE student_table("Student_id" int,"Stu_name" text,"Department" text,"email_id" text,"Phone_no" numeric,"Address" text,"Date_of_birth" date,"Gender" text,"Major" text,"GPA numeric","Grade" text)

-- Insert 10 records for student_table
INSERT INTO public.student_table ("Student_id","Stu_name","Department","email_id","Phone_no","Address","Date_of_birth","Gender","Major","GPA","Grade") VALUES
(001, 'Prabhu', 'CSE', 'jc.prabhu5297@gmai1.com', 7010913695, 'Chennai', '05-02-1997', 'Male', 'Computer Science', 9.14, 'A'),
(002,'Shankar','EEE','shankarmani23@gmail.com',8883844155,'Bangalore','06-03-1997','Male','Electrical',8.51,'A'),
(003,'Vijayalakshmi','DCA','viji1971@gmail.com',8564252562,'Namakkal','05-09-1971','Female','Diploma',7.14,'B'),
(004,'Subha','ECE','shubhasri5214@gmail.com',7458956482,'Salem','01-01-1996','Female','Electronic',6.1,'B'),
(005,'Arun','DEEE','arunaravind458@gmail.co',8597526255,'Erode','04-06-2000','Male','Diploma',4.1,'C'),
(006,'Vijay','MECH','Vijays415@gmail.com',9952865471,'Chennai','05-05-2001','Male','Mechanical',8.0,'B'),
(007,'Priya','DCE','priyacivil45@gmail.com',8883145895,'Trichy','02-01-1999','Female','Civil',4.8,'C'),
(008,'Anand','SSLC','anandha889@gmail.com',7586121525,'Salem','09-06-2001','Male','Sslc',3.0,'C'),
(009,'Thilaka','BSC','thilak2001@gmail.com',8587585522,'Madurai','08-10-19978','Female','Computer Science',7.90,'B'),
(010,'Guna','BA','Gunavelsiva1256@gmil.com',7748598526,'Karur','12-12-1996','Male','Agri',5.0,'C');

-- Retrive all student information from student_table and sort them in descending order by their grade.
SELECT * FROM public.student_table
ORDER BY "Grade" DESC; 

-- Retrive information about all male studnets from the student_table
SELECT * FROM public.student_table WHERE "student_table"."Gender" = 'Male';

-- Fetch the details of students who have a GPA less than 5.0 from the student_table
SELECT * FROM public.student_table WHERE "student_table"."GPA" < 5.0;

-- Update statement to modify the email and grade of a student with a specific ID in the student_table
UPDATE public.student_table
SET "email_id"= 'gunasurya@gmail.com',"Grade"='B'
WHERE "student_table"."Student_id"=010;

-- Retrive the names and ages of all students who have a grade of "B" from the student_table
SELECT "student_table"."Stu_name",EXTRACT(YEAR FROM AGE("student_table"."Date_of_birth")) As Age
FROM public.student_table
WHERE "student_table"."Grade" = 'B';

-- Group the student_table by the "Department" and "Gender" columns and calculate the average GPA for each combination
SELECT "student_table"."Department","student_table"."Gender",AVG("student_table"."GPA") As Average_GPA
FROM public.student_table
GROUP BY "student_table"."Department","student_table"."Gender";

-- Rename the "student_table" to "student_info" using the appropriate SQL statement
ALTER TABLE public.student_table RENAME TO student_info;
SELECT * FROM student_info;

-- Retrive the names of the student with the highest GPA from the student_info table
SELECT "student_info"."Stu_name"
FROM student_info
WHERE "student_info"."GPA" = (SELECT MAX("student_info"."GPA") FROM student_info);






