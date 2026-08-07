
-- PART A:
use CSE_3A_103
--Retrieve all data from table STUDENT. 
SELECT * FROM student

--Display Student Name and City from STUDENT
SELECT SNAME,CITY FROM student

--Display student details of all students who belongs to COMPUTER branch. 
SELECT * FROM student WHERE BRANCH = 'COMPUTER'

--Display names of students whose ID is less than 105 from STUDENT table. 
SELECT SNAME FROM student WHERE STDID<105

--Give Student Name, City and SPI of student whose SPI is greater than 6.50.  
SELECT SNAME, CITY, SPI FROM student WHERE SPI>6.50

--Give name of Student whose branch is COMPUTER and SPI is greater than 8.00.  
SELECT SNAME FROM student WHERE BRANCH = 'COMPUTER' AND SPI>8.00

--Give names of students whose ID is greater than 103 and belongs to Rajkot city.  
SELECT SNAME FROM student WHERE STDID>103 AND CITY='RAJKOT'

--Display names of students who belong to either ‘RAJKOT’ or ‘SURAT’ city (USE OR & IN). 
SELECT SNAME FROM student WHERE CITY IN('RAJKOT','SURAT')
SELECT SNAME FROM student WHERE CITY='RAJKOT' OR CITY='SURAT'

--Display names of students with branch whose SPI is greater than 8.0 and ID is less than 105. 
SELECT SNAME,BRANCH FROM student WHERE SPI>8.0 AND STDID<105

-- Find all students whose SPI is greater than or equal to 7.0 and less than or equal to 9.0 (USE AND & BETWEEN).
SELECT * FROM student WHERE SPI BETWEEN 7.0 AND 9.0
SELECT * FROM student WHERE SPI>=7.0 AND SPI<=9.0

-- Find all students who do not belong to ‘COMPUTER’ branch. 
SELECT SNAME FROM STUDENT WHERE BRANCH != 'COMPUTER'

--Display Student ID, Name & SPI of students who belong to ‘COMPUTER’, ‘CIVIL’ or ‘CHEMICAL’ branch and ID is less than 104. 
SELECT STDID,SNAME,SPI FROM student WHERE BRANCH IN ('COMPUTER','CIVIL','CHEMICAL') AND STDID<104

--Display all student IDs and names who do not belong to ‘COMPUTER’ or ‘CIVIL’ branch (USE NOT IN). 
SELECT SNAME FROM student WHERE BRANCH NOT IN ('COMPUTER','CIVIL')

--Display all student names other than ‘DEEP’ from STUDENT table (USE NOT, <>, !=). 
SELECT SNAME FROM student WHERE SNAME NOT IN ('DEEP')
SELECT SNAME FROM student WHERE SNAME != 'DEEP'
SELECT SNAME FROM student WHERE SNAME <> 'DEEP'

--Display student names whose branch is not available (NULL) in STUDENT table. 
SELECT SNAME FROM student WHERE BRANCH IS NULL

--Retrieve all unique branches name from STUDENT table.
SELECT DISTINCT BRANCH FROM student

--Retrieve first 50% records from STUDENT table. 
SELECT TOP 50 PERCENT * FROM student

--Retrieve first five student IDs from STUDENT table. 
SELECT TOP 5 STDID FROM student

-- PART B:

--Display all the details of first five students from STUDENT table. 
SELECT TOP 5 * FROM student

-- Display all the details of first three students whose SPI is greater than 8.0.
SELECT TOP 3 * FROM student WHERE SPI>8.0

--Display Student ID, Name of first five students whose branch does not belong to ‘COMPUTER’ branch. 
SELECT TOP 5 STDID,SNAME FROM student WHERE BRANCH != 'COMPUTER'

-- Select all details with student IDs not in the range 105 to 109. 
SELECT * FROM student WHERE STDID NOT BETWEEN 105 AND 109

--Select all records from STUDENT where SPI is greater than 7.0 and less than or equal to 9.0, and student ID is between 102 and 108. 
SELECT * FROM student WHERE SPI>7.0 AND SPI<=9.0 AND STDID>102 AND STDID<=108


--PART C: 

--Display all details of students who have SPI more than 8.5 without using * from STUDENT table. 
SELECT STDID,SNAME,CITY,SPI,BRANCH FROM student WHERE SPI>=8.5

--Retrieve names of students whose city is ‘RAJKOT’ and SPI is less than 8.00. 
SELECT SNAME FROM student WHERE CITY = 'RAJKOT' AND SPI<8.0

--Retrieve records from STUDENT table where SPI is greater than 8.0 and student ID is less than 105.
SELECT * FROM STUDENT WHERE SPI>8.0 AND STDID<105

--Retrieve records from STUDENT table where SPI is greater than 7.5 and student ID is between 100 and 110 and city is ‘RAJKOT’ or ‘SURAT’. 
SELECT * FROM student WHERE SPI>7.5 AND STDID BETWEEN 100 AND 110 AND  CITY IN('RAJKOT','SURAT')

--Display details of students who belong to ‘CIVIL’ or ‘MECHANICAL’ branch and SPI is greater than 8.0. 
SELECT * FROM student WHERE BRANCH IN ('CIVIL','MECHANICAL') AND SPI>8.0