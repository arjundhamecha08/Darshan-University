--From the table STUDENT perform the following queries:  


--Part – A:  
--1. INSERT Procedures: Create stored procedures to insert records into STUDENT tables 
--(SP_INSERT_STUDENT) 
create proc sp_insert_student
@STDID int,
@sname varchar(25),
@city varchar(25),
@spi decimal(5,3),
@branch varchar(25)
As begin
insert into student values 
(@STDID,@sname,@city,@spi,@branch)
end

exec sp_insert_student 115,'PUSHIT','RAJKOT',9.48,'COMPUTER'
exec sp_insert_student 116,'NIKUNJ','SURAT',8.80,'CHEMICAL'
SELECT * FROM STUDENT


--2. INSERT Procedures: Create stored procedures to insert records into DEPOSIT tables  (SP_INSERT_DEPOSIT) 
CREATE PROC SP_INSERT_DEPOSITE
@ACTNO INT,
@CNAME VARCHAR(25),
@BNAME VARCHAR(25),
@AMOUNT INT,
@ADATE DATE
AS BEGIN
INSERT INTO DEPOSIT VALUES
(@ACTNO,@CNAME,@BNAME,@AMOUNT,@ADATE)
END

EXEC SP_INSERT_DEPOSITE 118,'HEMANT','BEDI',16000,'05-05-2025'
EXEC SP_INSERT_DEPOSITE 119,'RAVI','MAVDI',24000,'09-07-2024'
SELECT * FROM deposit

--3. UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Branch in STUDENT table. (Update using studentID) 
CREATE PROC SP_UPDATE_STUDENT
@STDID INT,
@BRNACH VARCHAR(25)
AS BEGIN
UPDATE STUDENT SET BRANCH = @BRNACH
WHERE STDID = @STDID
END

EXEC SP_UPDATE_STUDENT 115,'ELECTRICAL'
EXEC SP_UPDATE_STUDENT 116,'MECHANICAL'

SELECT * FROM STUDENT


--4. DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT 
--where Student Name is RAVI.

CREATE PROC SP_DELETE_STUDENT
@SNAME VARCHAR(25)

AS BEGIN
DELETE FROM student WHERE SNAME = @SNAME
END

EXEC SP_DELETE_STUDENT 'RAVI'
SELECT * FROM STUDENT

--SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key 
--(SP_SELECT_STUDENT_BY_ID) from Student table. (Display All Columns) 

CREATE PROC SP_SELECT_STUDENT_BY_ID
@STDID INT
AS BEGIN
SELECT * FROM STUDENT WHERE STDID = @STDID
END

EXEC SP_SELECT_STUDENT_BY_ID 103

--Create a stored procedure that shows details of the first 5 students ordered by SPI (Highest First).
CREATE PROC SP_SELECT_TOP_5
AS BEGIN
SELECT * FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY SPI DESC) AS STUDENT_RANK FROM STUDENT)S
WHERE STUDENT_RANK <=5 
END

EXEC SP_SELECT_TOP_5

--From the table EMPLOYEE perform the following queries:  
--Part – B:   
--7. Create a stored procedure which displays all employee details. 
CREATE PROC SP_SELECT_EMPLOYEE
AS BEGIN
SELECT * FROM employee
END

EXEC SP_SELECT_EMPLOYEE
--8. Create a stored procedure that takes department name as input and returns all the employee in that 
--department. 
CREATE PROC SP_SELECT_EMPLOYEE_BY_DEPARTMENT
@DEPARTMENT VARCHAR(20)
AS BEGIN
SELECT * FROM employee
WHERE @DEPARTMENT = DEPARTMENT
END 
EXEC SP_SELECT_EMPLOYEE_BY_DEPARTMENT 'IT'



--Part – C:  
--9. Create a stored procedure which displays department-wise maximum, minimum, and average salary of 
--employee. 
CREATE PROC SP_SELECT_DEPT_WISE_MAX_MIN_AVG_SALARY
AS BEGIN
SELECT DEPARTMENT,MIN(SALARY)AS MIN_SALARY,MAX(SALARY) AS MAX_SALARY,AVG(SALARY) AS AVG_SALARY FROM employee
GROUP BY DEPARTMENT
END

EXEC SP_SELECT_DEPT_WISE_MAX_MIN_AVG_SALARY

--10. Create a stored procedure that accepts department name as parameter and returns total salary of their 
--department.
CREATE PROC SP_TOTAL_SALARY_DAPARTMENT
@DEPARTMENT VARCHAR(25)
AS BEGIN
SELECT DEPARTMENT,SUM(SALARY) FROM employee
WHERE DEPARTMENT = @DEPARTMENT
GROUP BY DEPARTMENT
END

EXEC SP_TOTAL_SALARY_DAPARTMENT 'HR'
SELECT * FROM EMPLOYEE