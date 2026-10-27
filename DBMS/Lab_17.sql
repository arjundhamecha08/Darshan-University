--Part – A: 
--1. Create a view Employee_All with all columns. 
create view Employee_All
as
select * from employee

--2. Create a view Employee_NameDeptSalary having columns FirstName, Department and Salary. 
create view Employee_NameDeptSalary 
AS
select FIRSTNAME,DEPARTMENT,SALARY from employee

--3. Create a view Employee_Basic having columns EID, FirstName and City. 
create view Employee_Basic
as
select EID,FIRSTNAME,CITY from employee

--4. Create a view IT_Employees that displays IT department data only. 
create view IT_Employees
as
select * from employee 
where DEPARTMENT = 'IT'

--5. Create a view HR_Employees that displays HR department data only. 
create view HR_Employees
as
select * from employee 
where DEPARTMENT = 'HR'

--6. Create a view Employee_2026 that displays employees joined in 2026 only.
create view Employee_2026
as
select * from employee 
where JOININGYEAR = 2026

--7. Create a view Patel_Employees that displays employees whose last name is PATEL.
create view Patel_Employees 
as
select * from employee
where LASTNAME = 'patel'

--8. Create a view High_Salary_Emp having all columns but employees whose salary is more than 12000. 
create view High_Salary_Emp
as
select * from employee
where SALARY>12000

--9. Create a view that displays information of all employees whose salary is above 14000.
create view More14k_Salary_Emp
as
select * from employee
where SALARY>14000

--10. Create a view that displays employees having salary below 10000.
create view Less10k_Salary_Emp
as
select * from employee
where SALARY<10000


--11. Create a view Server_Dept that displays Server department employees only. 
create view Server_Dept 
as
select * from employee 
where DEPARTMENT = 'Server'

--12. Insert a new record into Employee_Basic view. (111, MEET, SURAT) 
insert into Employee_Basic
values
(111,'meet','surat')

--13. Update the department of DEEP from ADMIN to IT in Employee_NameDeptSalary view. 
update Employee_NameDeptSalary set department='IT' 
where FIRSTNAME = 'DEEP'

--14. Delete an employee whose EID is 107 from Employee_Basic view. 
delete from Employee_Basic
where eid = 107

--15. Drop IT_Employees view from the database.
drop view IT_Employees




--Part – B: 
--16. Create a view Admin_Employees that displays ADMIN department employees only. 
create view Admin_Employees
as
select * from employee 
where DEPARTMENT = 'admin'

--17. Create a view Female_Employees that displays female employee data only.
create view Female_Employees
as 
select * from employee
where GENDER = 'female'

--18. Create a view Male_Employees that displays male employee data only. 
create view Male_Employees
as 
select * from employee
where GENDER = 'male'

--19. Create a view Rajkot_Employees that displays employees from Rajkot city only. 
create view Rajkot_Employees
as 
select * from employee
where city = 'rajkot'

--20. Create a view Ahmedabad_Employees that displays employees from Ahmedabad city only.
create view Ahmedabad_Employees
as 
select * from employee
where city = 'AHMEDABAD'

--21. Create a view Salary_Between that displays employees whose salary is between 10000 and 14000. 
create view Salary_Between
as
select * from employee
where SALARY between 10000 and 14000

--22. Create a view Recent_Employees that displays employees joined after 2023. 
create view Recent_Employees
as
select * from employee 
where JOININGYEAR > 2023


--23. Create a view Old_Employees that displays employees joined before 2023. 
create view Old_Employees
as
select * from employee 
where JOININGYEAR < 2023

--24. Create a view Employees_Start_R that displays employees whose first name starts with R.
create view Employees_Start_R
as
select * from employee
where FIRSTNAME like 'R%'


--25. Create a view Employees_End_A that displays employees whose first name ends with A. 
create view Employees_End_A
as
select * from employee
where FIRSTNAME like '%A'


--Part – C: 
--26. Create a view Employees_NameContains_H that displays employees whose first name contains H. 
create view Employees_NameContains_H
as
select * from employee
where FIRSTNAME like '%H%'

--27. Create a view for the employees whose first name contains vowels.
create view Employee_First_Vowel
as
select * from employee
where FIRSTNAME like '%[aeiou]%'

--28. Create a view FourLetter_Name having EID, FirstName and Department columns in which FirstName consists of four letters. 
create view FourLetter_Name
as
select EID,FIRSTNAME,DEPARTMENT from employee
where FIRSTNAME like '____'

--29. Create a view for the employees whose name starts with M and ends with N. 
create view EMP_M_N
as
select * from employee
where FIRSTNAME like 'm%n'
--30. Create a view Transport_Dept that displays Transport department employees only. 
create view Transport_Dept
as
select * from employee
where DEPARTMENT = 'Transport'

select * from employee