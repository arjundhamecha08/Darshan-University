--Part a:
--1. Display the result of 5 multiply by 30. 
select 30*5


--2. Find out the absolute value of -25, 25, -50 and 50. 
select abs(-25),abs(25),abs(-50),abs(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
select CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
select FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
select 5%2, 5%3

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
select POWER(3,2), POWER(4,3)

--7. Find out the square root of 25, 30 and 50. 
select SQRT(25),SQRT(30),SQRT(50)

--8. Find out the square of 5, 15, and 25. 
select SQUARE(5),SQUARE(15),SQUARE(25)


--9. Find out the value of PI.
select PI()


--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
select round(257.732,2),round(257.732,0),round(257.732,-2)


--11. Find out exponential value of 2 and 3. 
select exp(2), exp(3)


--12. Find out logarithm having base e of 10 and 2. 
select LOG10(2)


--13. Find logarithm base 10 of 5 and 100 
select LOG10(5), LOG10(100)

--14. Find sine, cosine and tangent of 3.1415. 
select sin(3.1415), cos(3.1415), tan(3.1415)

--15. Find sign of -25, 0 and 25. 
select sign(-25), sign(0), sign(25)

--16. Generate random number using function. 
select rand()


--String Function
--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
select DATALENGTH(NULL), DATALENGTH('   hello   '), DATALENGTH('blank')

--2. Display your name in lower & upper case. 
select LOWER('ARJUN'), UPPER('arjun')

--3. Display first three characters of your name
select SUBSTRING('ARJUN',1,3)

--4. Display 3rd to 10th character of your name.
select SUBSTRING('ARJUN DHAMECHA',3,10)

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg','123','XYZ'), REPLACE('abcabcabc','c','5')

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII('0'),ASCII('9')


--7. Write a query to display character based on number 97, 65,122,90,48,57. 
select char(97),char(65),char(122),char(90),char(48),char(57)


--8. Write a query to remove spaces from left of a given string ‘ hello world  
select LTRIM(' hello world')

--9. Write a query to remove spaces from right of a given string ‘ ‘. hello world  
select RTRIM ('Hello World   ')

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
select substring('SQL Server',1,4),substring('SQL Server',len('SQL Server')-5,len('SQL Server'))

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
select cast('1234.56' as decimal),convert(decimal,'1234.56')

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 
select cast(10.58 as integer), convert(int, 10.58)

---13. Put 10 space before your name using function. 
select SPACE(10)+'Arjun'

--14. Combine two strings using + sign as well as CONCAT (). 
select 'Arjun ' + 'Dhamecha',concat('Darshan',' University')

--15. Find reverse of “Darshan”. 
select REVERSE('Darshan')

--16. Repeat your name 3 times.
select REPLICATE('Arjun ',3)


--Part – B: Perform following queries on EMPLOYEE table. 
--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase. 
select lower(firstname),upper(firstname),lower(lastname),UPPER(lastname) from employee

--18. Display full name by combining FIRSTNAME and LASTNAME. 
select concat(firstname,' ',lastname) as Fullname from employee

--19. Display FIRSTNAME with first 3 characters only. 
select substring(firstname,1,3) from employee

--20. Display LASTNAME with last 2 characters only.
select substring(lastname,len(lastname)-1,len(lastname)) from employee

--21. Display length of each employee’s FIRSTNAME. 
select len(firstname) from employee

--22. Display FIRSTNAME after replacing ‘A’ with ‘@’. 
select replace(firstname,'A','@') from employee

--23. Display FIRSTNAME and LASTNAME with - between them using CONCAT.
select concat(firstname,'-',lastname) from employee


--Part – C: Perform following queries on EMPLOYEE table. 
--24. Display FIRSTNAME without first and last character. 
select substring(firstname,2,len(firstname)-2) from employee

--25. Display FIRSTNAME after replacing vowels with '*'. 
select replace(replace(replace(REPLACE(replace(firstname,'a','*' ),'e','*'),'i','*'),'o','*'),'u','*') from employee

--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10. 
select concat(firstname,lastname) from employee where len(concat(firstname,lastname))>10

--27. Display FIRSTNAME and its reverse. 
select firstname, reverse(firstname) as Reverse_fname from employee

--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT()
select * from employee where left(firstname,1) = left(lastname,1)

select * from employee