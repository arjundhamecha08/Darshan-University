--Part – A: 
--1. Display the details of students whose SPI is greater than the average SPI. 
select * from student
where SPI>(select avg(spi) from student)

--2. Display the names of students whose SPI is less than the average SPI.
select * from student
where SPI<(select avg(spi) from student)

--3. Display the student details who has the highest SPI.
select * from student
where spi = (select max(spi) from student)

--4. Display the student details who has the lowest SPI.
select * from student
where spi = (select min(spi) from student)

--5. Display the students whose SPI is greater than SPI of student DHARMIK.
select * from student
where spi>(select top 1 spi from student where SNAME = 'DHARMK')

--6. Display the students whose SPI is less than SPI of student RIYA.
select * from student
where spi<(select top 1 spi from student where SNAME = 'RIYA')

--7. Display the students who belong to the same branch as KRUNAL. 
select * from student
where branch = (select top 1 BRANCH from student where Sname = 'KRUNAL')

--8. Display the students whose branch is different from HETVI. 
select * from student
where branch != (select top 1 BRANCH from student where Sname = 'HETVI')

--9. Display the second highest SPI from RESULT table.
select top 1 * from student
where spi<(select max(spi) from student)
order by spi desc

--10. Display the second lowest SPI from RESULT table.
select top 1 * from student
where spi>(select min(spi) from student)
order by spi

--11. Display the names of students whose SPI is above branch-wise average SPI.
SELECT S.SNAME,S.BRANCH,S.SPI 
FROM STUDENT S
WHERE S.SPI > (SELECT AVG(S2.SPI) FROM STUDENT S2 WHERE S2.BRANCH=S.BRANCH)

--12. Display the branch having maximum average SPI.
SELECT BRANCH, AVG(SPI) AS MaxAvgSPI
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) >= ALL (
    SELECT AVG(SPI) 
    FROM STUDENT
    GROUP BY BRANCH
);

--13. Display the branch having minimum average SPI. 
SELECT BRANCH, AVG(SPI) AS MinAvgSPI
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) <= ALL (
    SELECT AVG(SPI) 
    FROM STUDENT
    GROUP BY BRANCH
);

--Part – B: --

--14. Display the students whose SPI is greater than all students of ME branch.  --

SELECT * FROM STUDENT
WHERE SPI > ALL (SELECT SPI FROM STUDENT WHERE BRANCH='MECHANICAL')

--15. Display the students whose SPI is less than any student of ME branch.  --

SELECT * FROM STUDENT
WHERE SPI < ALL (SELECT SPI FROM STUDENT WHERE BRANCH='MECHANICAL')

--16. Display the student details whose SPI is not equal to any SPI of EC branch students. -- 

SELECT * FROM STUDENT
WHERE SPI <> ALL (SELECT SPI FROM STUDENT WHERE BRANCH='EC')

--17. Display the names of students who scored higher SPI than student of RNO 103.  --

SELECT SNAME FROM STUDENT
WHERE SPI > (SELECT SPI FROM STUDENT WHERE STDID=103)

--18. Display the students whose SPI is greater than average SPI of their own branch. -- 

SELECT * FROM STUDENT S1
WHERE S1.SPI > (SELECT AVG(S2.SPI) FROM STUDENT S2 WHERE S2.BRANCH=S1.BRANCH) 

--19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the maximum SPI of ME branch.-- 

SELECT * FROM STUDENT
WHERE SPI > (SELECT AVG(SPI) FROM STUDENT WHERE BRANCH='COMPUTER')
AND SPI >  (SELECT MAX(SPI) FROM STUDENT WHERE BRANCH='MECHANICAL')

--20. Display the branch names whose average SPI is greater than the overall average SPI.  --

SELECT BRANCH, AVG(SPI) AS BRANCH_AVG_SPI
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) > (SELECT AVG(SPI) FROM STUDENT) 

--21. Display the students who have maximum SPI in their respective branch. --

SELECT * FROM STUDENT S1
WHERE S1.SPI =(SELECT MAX(S2.SPI) FROM STUDENT S2 WHERE S2.BRANCH=S1.BRANCH)

--22. Display the students whose SPI is greater than their average SPI of their branch and greater than overall average SPI.  --

SELECT s1.* 
FROM STUDENT s1
WHERE s1.SPI > (
    SELECT AVG(s2.SPI) 
    FROM STUDENT s2 
    WHERE s2.BRANCH = s1.BRANCH
)
AND s1.SPI > (
    SELECT AVG(SPI) 
    FROM STUDENT
)


--Part – C: --

--23. Display the students whose SPI is greater than at least one student of every branch.--  

SELECT * 
FROM STUDENT
WHERE SPI > (
    SELECT MAX(MinSPI) 
    FROM (
        SELECT MIN(SPI) AS MinSPI 
        FROM STUDENT 
        GROUP BY BRANCH
    ) AS BranchMinimums
)


--24. Display the students whose SPI is less than all students of CE branch.  --

SELECT * 
FROM STUDENT
WHERE SPI < (SELECT MIN(SPI) FROM STUDENT WHERE BRANCH = 'COMPUTER');


--25. Display the branch that contains the student with highest SPI.  --

SELECT DISTINCT BRANCH
FROM STUDENT
WHERE SPI = (SELECT MAX(SPI) FROM STUDENT);


--26. Display the students whose SPI is less than the SPI of every student in CE branch and greater than every student in ME branch.--

SELECT * 
FROM STUDENT
WHERE SPI < (SELECT MIN(SPI) FROM STUDENT WHERE BRANCH = 'CE')
  AND SPI > (SELECT MAX(SPI) FROM STUDENT WHERE BRANCH = 'ME');