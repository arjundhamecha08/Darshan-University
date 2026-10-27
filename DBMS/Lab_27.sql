--Part – A: 
--1. Create a cursor Employee_Cursor to fetch all rows from EMPLOYEE table and display them.
declare @EID int
declare @name varchar(25)


declare Employee_Cursor1 Cursor 
for select EID,FIRSTNAME from employee

open Employee_Cursor1
fetch next from Employee_Cursor1 into @EID,@name
while @@FETCH_STATUS = 0
	begin 
	print cast(@EID as varchar) + ' - ' + @name
	fetch next from Employee_Cursor1 into @EID,@name
	end
close Employee_Cursor1
deallocate Employee_Cursor1

--2. Create a cursor to display all female employees from EMPLOYEE table
declare @Female_EID int
declare @Female_name varchar(25)

declare Employee_Cursor_female Cursor 
for select EID,FIRSTNAME from employee where gender = 'female'

open Employee_Cursor_female
fetch next from Employee_Cursor_female into @Female_EID,@Female_name 
while @@FETCH_STATUS = 0
	begin 
	print cast(@Female_EID as varchar) + ' - ' + @Female_name
	fetch next from Employee_Cursor_female into @Female_EID,@Female_name
	end
close Employee_Cursor_female
deallocate Employee_Cursor_female



--3. Create a cursor Employee_Cursor_Fetch to fetch records in form of EID_FirstName_LastName. (Example: 101_Hetvi_Patel) 
declare @EID int
declare @first_name varchar(25)
declare @last_name varchar(25)


declare Employee_Cursor1 Cursor 
for select EID,FIRSTNAME,LASTNAME from employee

open Employee_Cursor1
fetch next from Employee_Cursor1 into @EID,@first_name,@last_name
while @@FETCH_STATUS = 0
	begin 
	print cast(@EID as varchar) + '_' + @first_name +'_' +@last_name
	fetch next from Employee_Cursor1 into @EID,@first_name,@last_name
	end
close Employee_Cursor1
deallocate Employee_Cursor1



--4. Create a cursor to find and display all employees with Salary greater than 12000.
declare @EID int
declare @first_name varchar(25)
declare @last_name varchar(25)

declare Employee_Salary_More_12000 cursor
for select EID,FIRSTNAME,LASTNAME from employee where SALARY>12000

open Employee_Salary_More_12000
fetch next from Employee_Salary_More_12000 into @EID,@first_name,@last_name
while @@FETCH_STATUS = 0
	begin 
	print cast(@EID as varchar) + ':  ' + @first_name +' ' +@last_name
	fetch next from Employee_Salary_More_12000 into @EID,@first_name,@last_name
	end
close Employee_Salary_More_12000
deallocate Employee_Salary_More_12000

--5. Create a cursor to display all employees who joined in year 2022 or later. 
declare @EID int
declare @first_name varchar(25)
declare @last_name varchar(25)

declare Employee_Joining_2022 cursor
for select EID,FIRSTNAME,LASTNAME from employee where JOININGYEAR >= 2022

open Employee_Joining_2022 
fetch next from Employee_Joining_2022 into @EID,@first_name,@last_name
	while @@FETCH_STATUS =0
	begin
	print cast(@EID as varchar)+': '+' '+@first_name+' '+@last_name
	fetch next from Employee_Joining_2022 into @EID,@first_name,@last_name
	end
close Employee_Joining_2022
deallocate Employee_Joining_2022

--6. Create a cursor to fetch Employee Name with Department Name. 
--(Example: Raj Mehta works in IT Department) 
declare @first_name varchar(25)
declare @last_name varchar(25)
declare @department varchar(25)

declare Employee_With_Department cursor
for select FIRSTNAME,LASTNAME,DEPARTMENT FROM employee

open Employee_With_Department
fetch next from Employee_With_Department into @first_name,@last_name,@department
	while @@FETCH_STATUS = 0
	begin
	print @first_name + ' ' +@last_name + ' Works in ' + @department +' Department'
	fetch next from Employee_With_Department into @first_name,@last_name,@department
	end
close Employee_With_Department
deallocate Employee_With_Department

--7. Create a cursor to update CITY as ‘AHMEDABAD’ for employees whose CITY value is NULL.
declare @city varchar(25)

declare update_city cursor
for select city from employee where city is null

open update_city
fetch next from update_city into @city
	while @@FETCH_STATUS = 0
	begin
	update employee set CITY = 'Ahemdabad' where CITY is null
	fetch next from update_city into @city
	end
close update_city
deallocate update_city

select * from employee

--8. Create a cursor to display Employee Name with City Name.(Example: Deep Patel lives in Rajkot) 
declare @first_name varchar(25)
declare @last_name varchar(25)
declare @city varchar(25)

declare employee_with_city cursor
for select firstname,lastname,city from employee

open employee_with_city
fetch next from employee_with_city into @first_name,@last_name,@city
	while @@FETCH_STATUS = 0
	begin
	print @first_name +' '+ @last_name + ' lives in '+ @city
	fetch next from employee_with_city into @first_name,@last_name,@city
	end
close employee_with_city
deallocate employee_with_city

--9. Create a cursor to delete employees whose Salary is less than 5000. 
declare @salary1 decimal(7,2)

declare delete_employee cursor
for select SALARY from employee

open delete_employee
fetch next from delete_employee into @salary1
	while @@FETCH_STATUS = 0
	begin
	delete from employee where SALARY <= 5000
	fetch next from delete_employee into @salary1
	end
close delete_employee
deallocate delete_employee

select * from employee

--10. Create a cursor to display employees department-wise. 

declare @count int
declare @department varchar(25)

declare Employees_Department_wise cursor
for select DEPARTMENT, count(*) from employee group by DEPARTMENT

open Employees_Department_wise
fetch next from Employees_Department_wise into @department,@count
	while @@FETCH_STATUS = 0
	begin
	print @department + ':  ' + cast(@count as varchar)
	fetch next from Employees_Department_wise into @department,@count
	end
close Employees_Department_wise
deallocate Employees_Department_wise


--Part – B: 
--11. Create a cursor to count total employees from each department.
declare @count int
declare @department varchar(25)

declare Employees_Department_wise_count cursor
for select DEPARTMENT, count(*) from employee group by DEPARTMENT

open Employees_Department_wise_count
fetch next from Employees_Department_wise_count into @department,@count
	while @@FETCH_STATUS = 0
	begin
	print @department + ':  ' + cast(@count as varchar)
	fetch next from Employees_Department_wise_count into @department,@count
	end
close Employees_Department_wise_count
deallocate Employees_Department_wise_count


--12. Create a cursor to display employees whose CITY starts with letter ‘R’. 
declare @first_name varchar(25)
declare @last_name varchar(25)
declare @city varchar(25)

declare City_starts_R cursor
for select FIRSTNAME,LASTNAME,city from employee where city like 'R%'

open City_starts_R
fetch next from City_starts_R into @first_name,@last_name,@city
	while @@FETCH_STATUS = 0
	begin
	print @first_name + ' ' + @last_name + ' ' + @city
	fetch next from City_starts_R into @first_name,@last_name,@city
	end
close City_starts_R
deallocate City_starts_R

--13. Create a cursor to display top 3 highest salary employees from EMPLOYEE table.

declare @first_name varchar(25)
declare @last_name varchar(25)
declare @salary int

declare top_3_highest_salary cursor
for 
select top 3 firstname,lastname,salary from employee 
order by salary desc

open top_3_highest_salary
fetch next from top_3_highest_salary into @first_name,@last_name,@salary
	while @@FETCH_STATUS = 0
	begin
	print @first_name +' '+@last_name + ' '+cast(@salary as varchar)
	fetch next from top_3_highest_salary into @first_name,@last_name,@salary
	end
close top_3_highest_salary
deallocate top_3_highest_salary


--14. Create a cursor to calculate total salary department-wise. (Example: IT Department total salary = 33000)
declare @department varchar(25)
declare @total decimal(7,2)

declare total_salary_each_department cursor
for select DEPARTMENT,sum(salary) from employee group by DEPARTMENT 

open total_salary_each_department
fetch next from total_salary_each_department into @department,@total
	while @@FETCH_STATUS = 0
	begin
	print @department + '  '+ cast(@total as varchar)
	fetch next from total_salary_each_department into @department,@total
	end
close total_salary_each_department
deallocate total_salary_each_department

--15. Create a cursor to calculate average salary city-wise. 
declare @department varchar(25)
declare @avg decimal(7,2)

declare avg_salary_each_department cursor
for select DEPARTMENT,avg(salary) from employee group by DEPARTMENT 

open avg_salary_each_department
fetch next from avg_salary_each_department into @department,@avg
	while @@FETCH_STATUS = 0
	begin
	print @department + '  '+ cast(@avg as varchar)
	fetch next from avg_salary_each_department into @department,@avg
	end
close avg_salary_each_department
deallocate avg_salary_each_department

--Part – C: 
--16. Create a cursor to display employee experience using JOININGYEAR. (Example: Raj Mehta has experience = 4 years) 

declare @first_name varchar(25)
declare @last_name varchar(25)
declare @year int

declare Employee_Experience cursor
for select firstname,lastname,year(getdate()) - joiningyear from employee

open Employee_Experience
fetch next from Employee_Experience into @first_name,@last_name,@year
	while @@FETCH_STATUS = 0
	begin
	print @first_name+' '+@last_name+' has experience = '+cast(@year as varchar)
	fetch next from Employee_Experience into @first_name,@last_name,@year
	end
close Employee_Experience
deallocate Employee_Experience
	

--17. Create a cursor to display employee full name with annual salary. (Example: Hetvi Patel annual salary = 144000)
declare @first_name varchar(25)
declare @last_name varchar(25)
declare @salary int

declare Anual_Salary cursor
for select firstname,lastname,(salary*12) from employee

open Anual_Salary
fetch next from Anual_Salary into @first_name,@last_name,@salary
	while @@FETCH_STATUS = 0
	begin
	print @first_name + ' '+ @last_name + ' ' + ' annual salary = '+cast(@salary as varchar)
	fetch next from Anual_Salary into @first_name,@last_name,@salary
	end
close Anual_Salary
deallocate Anual_Salary

--18. Create a cursor to calculate total male and female employees separately. 
declare @gender varchar(10)
declare @total_count int

declare count_male_female cursor
for select GENDER, count(*) from employee
group by GENDER

open count_male_female
fetch next from count_male_female into @gender,@total_count
	while @@FETCH_STATUS = 0
	begin
	print @gender + ' ' +cast(@total_count as varchar )
	fetch next from count_male_female into @gender,@total_count
	end
close count_male_female
deallocate count_male_female



--19. Create a cursor to display employees whose salary is greater than department average salary.
declare @first_name varchar(25)
declare @last_name varchar(25)
declare @salary decimal(7,2)

declare Salary_more_avg_salary cursor
for 
select firstname,lastname,salary from employee e1
where salary > (select avg(salary) as avgsalary from employee e2 where e1.DEPARTMENT = e2.DEPARTMENT group by DEPARTMENT )

open Salary_more_avg_salary
fetch next from Salary_more_avg_salary into @first_name,@last_name,@salary
	while @@FETCH_STATUS = 0
	begin
	print @first_name +'  '+@last_name+'  '+cast(@salary as varchar)
	fetch next from Salary_more_avg_salary into @first_name,@last_name,@salary
	end
close Salary_more_avg_salary
deallocate Salary_more_avg_salary


--20. Create a cursor to transfer all employees from ADMIN department to HR department. 
declare  @department varchar(25)

declare Admin_to_HR cursor
for select DEPARTMENT from employee where DEPARTMENT = 'ADMIN'

open Admin_to_HR
fetch next from Admin_to_HR into @department
	while @@FETCH_STATUS = 0
	begin
	update employee set DEPARTMENT = 'HR' where DEPARTMENT = 'ADMIN'
	fetch next from Admin_to_HR into @department
	end
close Admin_to_HR
deallocate Admin_to_HR

select * from employee