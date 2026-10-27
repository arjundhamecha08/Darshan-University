--Part A:

--Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively. 
select Max(salary) as Highest_salary ,Min(salary) as Lowest_Salary from employee

--Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 
select sum(salary) as Total_Sal, avg(salary) as Average_sal from employee

--3. Find total number of employees of EMPLOYEE table. 
select count(*) as total_employe from employee

--4. Find highest salary from Rajkot city. 
select max(salary) from employee where city='rajkot'

--5. Give maximum salary from IT department. 
select max(salary) from employee where DEPARTMENT='IT'

--6. Count employee department is HR. 
select count(*) from employee where DEPARTMENT='HR'

--7. Display average salary of Admin department. 
select avg(salary) from employee where DEPARTMENT='Admin'

--8. Display total salary of HR department. 
select sum(salary) from employee where DEPARTMENT = 'HR'

--9. Count total number of cities of employee without duplication. 
select count(distinct city) from employee

--10. Count unique departments.
select count(distinct department) from employee

--11. Display minimum salary of employee who belongs to Ahmedabad. 
select min(salary) from employee where city='Ahmedabad'

--12. Find city wise highest salary.
select city,max(SALARY) as maximum_salary from employee 
group by city

--13. Find department wise lowest salary. 
select department,min(salary) as lowest_salary from employee
group by department

--14. Display minimum salary in each city. 
select city,min(SALARY) as minimum_salary from employee 
group by city

--15. Display average salary of employees from Surat. 
select avg(salary) as average_salary from employee where city = 'surat'

--16. Display total salary of female employees. 
select sum(salary) from employee where GENDER='female'

--17. Count number of male employees. 
select count(*) from employee where gender = 'male'

--18. Display city with the total number of employees belonging to each city. 
select city,count(*) from employee 
group by city

--19. Count number of employees in each city where gender is MALE. 
select city,count(*) from employee where gender = 'male'
group by city

--20. Display maximum salary in each department where city is not Ahmedabad. 
select department,max(salary) as maximum_salary from employee
where city <> 'Ahmedabad'
group by DEPARTMENT



--PART B: 
--Display minimum salary in each city where gender is FEMALE. 
select city,max(salary) from employee 
where gender='female' 
group by city

--22. Give total salary of each department of EMPLOYEE table. 
select department,sum(salary) from employee
group by department

--23. Give average salary of each department of EMPLOYEE table without displaying the respective department name.
select avg(salary) from employee
group by department

--24. Count the number of employees for each department in every city. 
select department,city,count(*) from employee
group by DEPARTMENT,city

--25. Calculate the total salary distributed to male and female employees
select gender,sum(salary) from employee 
group by gender


--Part c:

--26. Give city wise maximum and minimum salary of female employees.
select city,max(salary) as Maximum_salary, min(salary) as Min_Salary from employee
group by city

--27. Calculate department, city, and gender wise average salary.
select department,city,gender, avg(salary) from employee
group by department,city,gender

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
select max(salary)-min(salary) as Difference_Salary from employee

--29. Display sum of salaries of department wise where department name consist 5 letter. 
select department,sum(salary) from employee where department like '_____'
group by department

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’.
select department,city,avg(salary) from employee where city like 'R%'
group by department,city




select * from employee