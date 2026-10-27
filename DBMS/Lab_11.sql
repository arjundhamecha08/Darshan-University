--Date Functions 
--Part – A: 
--1. Write a query to display the current date & time. Label the column Today_Date. 
select getdate() as Today_date

--2. Write a query to find new date after 365 day with reference to today.
select DATEADD(day,365,getdate())

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
select format(getdate(),'MMM-d-yyyy-hh:mmtt')
--4. Display the current date in a format that appears as 03 Jan 1995. 
select format(getdate(),'dd-MMM-yyyy')

--5. Display the current date in a format that appears as Jan 04, 96. 
select format(getdate(),'MMM-dd-yy')

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
select DATEDIFF(month,'31-Dec-08','31-Mar-09')

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
select datediff(hour,'25-Jan-12 7:00','26-Jan-12 10:30')

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 
select DATENAME(Day,'12-May-16') as Extraxt_Day, DATENAME(month,'12-May-16') as Extraxt_Month, DATENAME(year,'12-May-16') as Extracted_Year

--9. Write a query that adds 5 years to current date.
select dateadd(year,5,getdate())

--10. Write a query to subtract 2 months from current date.
select EOMONTH(getdate(),-2)

--11. Extract month from current date using datename () and datepart () function. 
select datename(month,getdate()) as Date_name, DATEPART(month,getdate())

--12. Write a query to find out last date of current month. 
select EOMONTH(getdate())

--13. Calculate your age in years and months.
select concat(datediff(year,'08-02-2007',getdate()),'-',datediff(month,'08-02-2007',getdate())%12)

--Part – B: Perform following queries on DEPOSIT table.  
--14. Display all records where account date is in the year 2025. 
select * from deposit where Year(ADATE) = 2025

--15. Display all records where account date is in the month of March. 
select * from deposit where Month(ADATE) = 3
select * from deposit where DATENAME(month,ADATE) = 'March'

--16. Display records where account date is after ‘01-Jan-2025’. 
select * from deposit where Adate > '01-jan-2025'

--17. Display records where account date is before ‘01-Jan-2025’. 
select * from deposit where Adate < '01-jan-2025'

--18. Display records where day of account date is 1.
select * from deposit where day(Adate) = 1

--19. Display records where month of account date is greater than 6. 
select * from deposit where month(Adate) > 6

--20. Display records where year of account date is 2026.
select * from deposit where year(Adate) = 2026

--21. Display number of accounts opened in each year.
select Year(ADATE),count(*) from deposit 
group by Year(ADATE)

--22. Display number of accounts opened in each month.
select Datename(MONTH,ADATE),count(month(Adate)) from deposit 
group by Datename(MONTH,ADATE)

--23. Display maximum amount deposited in each year.
select Year(ADATE),max(AMOUNT) from deposit 
group by Year(ADATE)



--Part – C: 
--24. Display minimum amount deposited in each month. 
select Datename(month,adate) as Month_, min(amount) as Minimum_Amount from deposit
group by Datename(month,adate)


---25 Display total amount deposited in each year
SELECT YEAR(ADATE) AS Year, SUM(AMOUNT) AS TOTALAmount 
FROM DEPOSIT GROUP BY YEAR(ADATE);
-- 26 Display records where account date is between ‘01-Mar-2025’ and ‘31-Dec-2025’
SELECT * FROM DEPOSIT WHERE ADATE BETWEEN '2025-03-01' AND '2025-12-31';
-- 27 Display records where account date is in the current year.
SELECT * FROM DEPOSIT WHERE YEAR(ADATE) = YEAR(GETDATE());
-- 28 Display difference in days between today’s date and account date.
SELECT ADATE, DATEDIFF(DAY, ADATE, GETDATE()) AS DiffInDays 
FROM DEPOSIT;
select * from deposit