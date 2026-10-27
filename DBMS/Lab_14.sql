--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 
select * from DEPARTMENT,person

--2. Find all persons with their department name 
select DEPARTMENT.DEPARTMENTNAME,PERSON.PERSONNAME from PERSON full outer join DEPARTMENT
on PERSON.DEPARTMENTID= DEPARTMENT.DEPARTMENTID
order by DEPARTMENT.DEPARTMENTNAME

--3. Find all persons with their department name & code. 
select DEPARTMENT.DEPARTMENTNAME,DEPARTMENT.DEPARTMENTCODE,PERSON.PERSONNAME from PERSON full outer join DEPARTMENT
on PERSON.DEPARTMENTID= DEPARTMENT.DEPARTMENTID
order by DEPARTMENT.DEPARTMENTNAME

--4. Find all persons with their department code and location.
select DEPARTMENT.DEPARTMENTNAME,PERSON.PERSONNAME,DEPARTMENT.LOCATION from PERSON full outer join DEPARTMENT
on PERSON.DEPARTMENTID= DEPARTMENT.DEPARTMENTID
order by DEPARTMENT.DEPARTMENTNAME

--5. Find the detail of the person who belongs to Mechanical department. 


--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
--7. Find the person's name whose department is in C-Block. 
--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
--10. Display all the person's name with the department whose joining date difference with the current date is more than 25 years. 
--11. Find department wise person counts. 
--12. Give department wise maximum & minimum salary with department name. 
--13. Find city wise total, average, maximum and minimum salary. 
--14. Find the average salary of a person who belongs to Ahmedabad city. 
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)



select * from DEPARTMENT
select * from person