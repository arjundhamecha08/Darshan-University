--Part – A: 
--1. Combine information from Student and Result table using cross join (Cartesian product). 
select * from student_info,result

--2. Perform inner join on Student and Result tables. 
select * from STUDENT_INFO inner join result
on student_info.RNO = result.RNO

--3. Perform the left outer join on Student and Result tables. 
select * from STUDENT_INFO left outer join result 
on STUDENT_INFO.rno = result.rno

--4. Perform the right outer join on Student and Result tables. 
select * from STUDENT_INFO right outer join result 
on STUDENT_INFO.rno = result.rno

--5. Perform the full outer join on Student and Result tables. 
select * from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno

--6. Display Rno, Name, Branch and SPI of all students.
select STUDENT_INFO.RNO, student_info.name, student_info.BRANCH, result.SPI from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno

--7. Display Rno, Name, Branch and SPI of CE branch students only. 
select STUDENT_INFO.RNO, student_info.name, student_info.BRANCH, result.SPI from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno
where STUDENT_INFO.BRANCH = 'CE'

--8. Display Rno, Name, Branch and SPI of students other than EC branch. 
select STUDENT_INFO.RNO, student_info.name, student_info.BRANCH, result.SPI from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno
where STUDENT_INFO.BRANCH <> 'EC'

--9. Display Rno, Name and SPI of students whose SPI is greater than 8. 
select STUDENT_INFO.RNO, student_info.name, student_info.BRANCH, result.SPI from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno
where RESULT.SPI > 8

--10. Display Rno, Name and Branch of students whose SPI is less than 8.
select STUDENT_INFO.RNO, student_info.name, student_info.BRANCH, result.SPI from STUDENT_INFO full outer join result 
on STUDENT_INFO.rno = result.rno
where RESULT.SPI < 8

--11. Display average result of each branch. 
select STUDENT_INFO.BRANCH,avg(result.spi) from STUDENT_INFO full outer join result
on STUDENT_INFO.rno = result.rno
group by branch

--12. Display average result of CE and ME branch. 
select STUDENT_INFO.BRANCH,avg(result.spi) from STUDENT_INFO full outer join result
on STUDENT_INFO.rno = result.rno
where STUDENT_INFO.BRANCH in ('CE','ME')
group by branch

--13. Display maximum and minimum SPI of each branch. 
select STUDENT_INFO.BRANCH,min(result.spi) as Minimum_SPI,max(result.spi) as Maximum_SPI from STUDENT_INFO full outer join result
on STUDENT_INFO.rno = result.rno
group by branch

--14. Display branch-wise student count in descending order. 
select STUDENT_INFO.BRANCH,count(*) as Student_count from STUDENT_INFO full outer join result
on STUDENT_INFO.rno = result.rno
group by branch
order by Student_count desc

--15. Display branch-wise total SPI of students. 
select STUDENT_INFO.BRANCH,sum(result.SPI) as Total_SPI from STUDENT_INFO full outer join result
on STUDENT_INFO.rno = result.rno
group by branch

--Part – B:
--16. Display branch-wise number of students having SPI greater than 8.

SELECT S.BRANCH,COUNT(SPI) FROM  STUDENT_INFO S INNER join RESULT R
ON S.RNO=R.RNO
WHERE SPI>8
GROUP BY BRANCH

--17. Display branch-wise number of students having SPI less than 8.

SELECT S.BRANCH,COUNT(SPI) FROM  STUDENT_INFO S INNER join RESULT R
ON S.RNO=R.RNO
WHERE SPI<8
GROUP BY BRANCH

--18. Display branch-wise average SPI greater than 7.

SELECT S.BRANCH,AVG(SPI) FROM  STUDENT_INFO S INNER join RESULT R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING AVG(SPI)>7

--19. Display branches having more than 1 students.

SELECT S.BRANCH,COUNT(*) FROM  STUDENT_INFO S INNER join RESULT R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING COUNT(*)>1

--20. Display branches where maximum SPI is greater than 9.

SELECT S.BRANCH,MAX(SPI) FROM  STUDENT_INFO S INNER join RESULT R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING MAX(SPI)>9


--Part – C:
--21. Average result of each branch, ascending by average SPI

SELECT S.BRANCH, AVG(R.SPI) AS Avg_SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY Avg_SPI ASC;

--22. Highest SPI from each branch, descending

SELECT S.BRANCH, MAX(R.SPI) AS Max_SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY Max_SPI DESC;

--23. (same as 21) Average result of each branch, ascending by average SPI

SELECT S.BRANCH, AVG(R.SPI) AS Avg_SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY Avg_SPI ASC;

--24. (same as 22) Highest SPI from each branch, descending

SELECT S.BRANCH, MAX(R.SPI) AS Max_SPI
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
ORDER BY Max_SPI DESC;

--25. Branches where difference between max and min SPI is greater than 1

SELECT S.BRANCH, MAX(R.SPI) - MIN(R.SPI) AS SPI_Diff
FROM STUDENT_INFO S
JOIN RESULT R ON S.RNO = R.RNO
GROUP BY S.BRANCH
HAVING (MAX(R.SPI) - MIN(R.SPI)) > 1;