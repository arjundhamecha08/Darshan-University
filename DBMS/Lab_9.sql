--Part – A: 

--1. Display cities where total salary of employees greater than 20000. 
select city,sum(salary) as total_salary from employee
group by city 
having  sum(salary)> 20000


--2. Display departments having average salary greater than 12000. 
select DEPARTMENT,avg(salary) as avg_salary from employee
group by DEPARTMENT
having  avg(salary)>12000


--3. Display departments having total salary greater than 20000. 
select DEPARTMENT,sum(salary) as total_salary from employee
group by DEPARTMENT 
having  sum(salary)> 20000


--4. Display departments having number of employees greater than 2. 
select DEPARTMENT,count(*) as count_employee from employee
group by DEPARTMENT 
having  count(*)> 2


--5. Display cities where minimum salary less than 7000. 
select city,min(salary) as minimum_salary from employee
group by city 
having  min(salary)<7000


--6. Display cities where average salary less than 12000. 
select city,avg(salary) as Average_salary from employee
group by city 
having  avg(salary)<12000


--7. Display departments where maximum salary greater than 14000. 
select DEPARTMENT,max(salary) as Maximum_salary from employee
group by DEPARTMENT 
having  max(salary)> 14000

--8. Display cities where total salary greater than equal to 30000. 
select city,sum(salary) from employee
group by city
having sum(salary)>=30000


--9. Display departments having number of employees equal to 2. 
select department, count(*) from employee
group by department
having count(*) = 2


--10. Display cities having number of female employees greater than equal to 1. 
select city, gender,count(gender) from employee
where gender='female'
group by city,gender
having count(gender)>=1


--11. Display departments where minimum salary of male employees greater than 7000. 
select department,gender,min(salary) from employee
where gender = 'male'
group by DEPARTMENT,gender
having min(salary) > 7000

--12. Display cities where maximum salary of female employees less than 13000. 
select city,gender,max(salary) from employee
where gender='female'
group by city, gender
having max(salary) < 13000



--13. Display departments where average salary greater than 10000 and less than 14000. 
select department,avg(salary) from employee 
group by DEPARTMENT
having avg(salary)>10000 and avg(salary)<14000



--14. Display cities where number of employees joined before 2023 greater than 1. 
select city, count(joiningyear) from employee
where JOININGYEAR<2023
group by city
having count(joiningyear) > 1


--15. Display cities where total salary of male employees greater than 15000, ordered by total salary. 
select city,gender,sum(salary) as total_salary from employee
where gender = 'male'
group by city,gender
having sum(salary)>15000
order by total_salary


--16. Display departments where maximum salary greater than 13000, ordered by max salary. 
select department,max(salary) as max_salary from employee
group by department
having max(salary)>13000
order by max_salary


--17. Display cities where total salary of male employees greater than 15000. 
select city,gender,sum(salary) as total_salary from employee
where gender = 'male'
group by city, gender
having sum(salary) > 15000


--18. Display departments where employees joined after 2022 and count greater than 1.  
select department,count(joiningyear) from employee
where JOININGYEAR<2022
group by department
having count(joiningyear)>1


--19. Display departments where average salary of female employees greater than 8000.
select department,avg(salary) from employee
where gender = 'female'
group by department
having avg(salary)>8000


--20. Display departments having total salary greater than 20000 and less than 40000.  
select department,sum(salary) as total_salary from employee
group by department
having sum(salary)>20000 and sum(salary)<40000



--Part – B: 
--21. Display departments having total salary of employees joined after 2021 greater than 20000.  
select department,sum(salary) as total_salary from employee
where joiningyear>2021
group by department
having sum(salary)>2000



--22. Display cities where average salary of employees joined after 2022 greater than 10000. 
select city,avg(salary) as avg_salary from employee
where joiningyear>2021
group by city
having avg(salary)>10000


--23. Display cities having number of distinct departments greater than 1. 
select city, count(distinct department) from employee
group by city
having count(distinct department)>1


--24. Display cities where maximum salary of employees joined before 2022 greater than 12000.
select city,max(salary) as Maximum_salary from employee
where joiningyear<2022
group by city
having max(salary)>12000


--25. Display departments where total salary of female employees less than 15000.  
select department ,sum(salary) as total_salary from employee
where gender = 'female'
group by department
having sum(salary) < 15000


--Part – C: 
--26. Display cities where number of male employees greater than female employees.  
select city,count(*) from employee
group by city
having sum(case when gender='Male' then 1 else 0 end)>sum(case when gender='female' then 1 else 0 end)


--27. Display departments having number of cities greater than 1.
select department,count(city) from employee
group by department
having count(city)>1



--28. Display cities where total salary excluding IT department greater than 15000. 
select city, sum(salary) as total_salary from employee
group by city
having sum(salary) > 15000


--29. Display departments where average salary excluding HR employees greater than 11000.  
select department ,avg(salary) from employee
where DEPARTMENT <> 'HR'
group by department
having avg(salary) > 11000

--30. Display departments where total salary of male employees greater than female employees.
select department, sum(salary) as total_salary from employee
group by DEPARTMENT
having sum(case when gender='male' then 1 else 0 end )>sum(case when gender='female' then 1 else 0 end )




select * from employee