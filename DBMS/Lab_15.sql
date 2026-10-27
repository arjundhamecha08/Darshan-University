--Part – A: 
--1. List all books with their authors.
select b.bookid,b.title,a.authorname from book b join author a
on a.authorid = b.authorid

--2. List all books with their publishers.
select b.bookid,b.title, p.PUBLISHERNAME from book b join PUBLISHER p
on p.PUBLISHERID = b.PUBLISHERID

--3. List all books with their authors and publishers. 
select b.bookid,b.title,b.price,a.authorname,p.PUBLISHERNAME from book b join author a
on b.authorid = a.authorid 
join PUBLISHER p on p.PUBLISHERID = b.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price. 
select b.TITLE,b.PRICE,p.PUBLISHERNAME,b.publicationyear,a.authorname from book b join author a
on a.authorid = b.authorid join PUBLISHER p on p.PUBLISHERID = b.PUBLISHERID
where b.publicationyear>2010

--5. List all authors and the number of books they have written. 
SELECT A.AUTHORNAME,COUNT(b.bookid) FROM  AUTHOR A LEFT JOIN  BOOK B
ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--6. List all publishers and the total price of books they have published. 
SELECT P.PUBLISHERNAME,SUM(B.PRICE) AS TOTAL_PRICE FROM publisher p left JOIN BOOK B
ON B.PUBLISHERID = P.PUBLISHERID
GROUP BY P.PUBLISHERNAME

--7. List authors who have not written any books. 
SELECT A.AUTHORNAME,B.TITLE FROM AUTHOR A LEFT JOIN BOOK B
ON A.AUTHORID = B.AUTHORID
WHERE B.TITLE IS NULL

--8. Display the total number of books written by each author along with the average price of their books. 
SELECT A.AUTHORNAME,COUNT(b.bookid),AVG(B.PRICE) FROM  AUTHOR A LEFT JOIN  BOOK B
ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. 
SELECT P.PUBLISHERNAME,COUNT(*) AS BOOKS FROM PUBLISHER P LEFT JOIN BOOK B
ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY BOOKS DESC

--10. Display number of books published each year.
SELECT PUBLICATIONYEAR,COUNT(*) AS BOOKS FROM BOOK
GROUP BY PUBLICATIONYEAR


--PART B
--11 List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT P.PUBLISHERNAME,B.PRICE FROM PUBLISHER P LEFT JOIN BOOK B
ON P.PUBLISHERID = B.PUBLISHERID 
WHERE B.PRICE<=500

--12. List most expensive book for each author, sort it with the highest price.
SELECT A.AUTHORNAME,MAX(B.PRICE) FROM AUTHOR A LEFT JOIN BOOK B
ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME

--13. Display publisher name and difference between maximum and minimum book price. 
SELECT P.PUBLISHERNAME,MAX(B.PRICE) - MIN(B.PRICE) AS 'DIFFERENCE' FROM PUBLISHER P LEFT JOIN BOOK B
ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME

--14. List publisher name and total price of books published each year. 
SELECT P.PUBLISHERNAME, B.PUBLICATIONYEAR,SUM(B.PRICE) AS TOTAL_PRICE FROM PUBLISHER P LEFT JOIN BOOK B
ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY B.PUBLICATIONYEAR

--15. Display author name and total price of books sorted by highest total price. 
SELECT A.AUTHORNAME,B.PRICE FROM AUTHOR A LEFT JOIN BOOK B
ON A.AUTHORID = B.AUTHORID
ORDER BY B.PRICE DESC


-- 16. Employee name with their manager's name
SELECT e.EmployeeNo, e.Name AS EmployeeName, m.Name AS ManagerName
FROM EMPLOYEE_MASTER e
LEFT JOIN EMPLOYEE_MASTER m ON e.ManagerNo = m.EmployeeNo;

-- 17. Employees who are managers (appear as a ManagerNo for someone)
SELECT DISTINCT m.EmployeeNo, m.Name
FROM EMPLOYEE_MASTER m
JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo;

-- 18. Number of employees working under each manager (direct reports)
SELECT m.EmployeeNo AS ManagerNo, m.Name AS ManagerName, COUNT(e.EmployeeNo) AS DirectReports
FROM EMPLOYEE_MASTER m
LEFT JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo
GROUP BY m.EmployeeNo, m.Name;

-- 19. Employee name with their manager and senior manager names
SELECT e.EmployeeNo, e.Name AS EmployeeName,
       m.EmployeeNo AS ManagerNo, m.Name AS ManagerName,
       sm.EmployeeNo AS SeniorManagerNo, sm.Name AS SeniorManagerName
FROM EMPLOYEE_MASTER e
LEFT JOIN EMPLOYEE_MASTER m  ON e.ManagerNo = m.EmployeeNo
LEFT JOIN EMPLOYEE_MASTER sm ON m.ManagerNo = sm.EmployeeNo;

-- 20. Managers and count of employees under them, sorted descending
SELECT m.EmployeeNo AS ManagerNo, m.Name AS ManagerName, COUNT(e.EmployeeNo) AS DirectReports
FROM EMPLOYEE_MASTER m
LEFT JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo
GROUP BY m.EmployeeNo, m.Name
HAVING COUNT(e.EmployeeNo) > 0
ORDER BY DirectReports DESC;

select * from PUBLISHER
select * from book
select * from author