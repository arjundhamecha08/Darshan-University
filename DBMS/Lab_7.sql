--PART A:

--Display employees detail whose FIRSTNAME starts with ‘H’. 
select * from employee where FIRSTNAME like 'H%'

--Display employees detail whose FIRSTNAME consists of exactly 5 characters. 
select * from employee where FIRSTNAME like '_____'

--Display employees detail whose CITY ends with ‘T’ and has 6 characters.
select * from employee where city like '_____T'

--Display employees detail whose LASTNAME ends with ‘EL’. 
select * from employee where LASTNAME like '%EL'

--Display employees detail whose FIRSTNAME starts with ‘R’ and ends with ‘A’. 
select * from employee where FIRSTNAME like 'R%A'

--Display employees detail whose FIRSTNAME starts with ‘V’ and third character is ‘S’. 
select * from employee where FIRSTNAME like 'V_S%'

--Display employees detail whose CITY is NULL and FIRSTNAME has 6 characters. 
select * from employee where city is null and FIRSTNAME like '______' 

--Display employees detail whose FIRSTNAME contains ‘AR’. 
select * from employee where firstname like '%AR%'

--Display employees detail whose CITY starts with ‘R’ or ‘B’.
select * from employee where city like 'R%' or city like 'B%'

--Display employees detail whose DEPARTMENT is NOT NULL. 
select * from employee where DEPARTMENT is not null

--Display employees detail whose FIRSTNAME starts from alphabet A to H. 
select * from employee where FIRSTNAME like '[A-H]%'

-- Display employees detail whose second character of FIRSTNAME is a vowel. 
select * from employee where FIRSTNAME like '_[aeiou]%'

--Display employees detail whose FIRSTNAME length ≥ 5. 
select * from employee where FIRSTNAME like '_____%'

--Display employees detail whose LASTNAME starts with ‘PA’. 
select * from employee where LASTNAME like '[PA]%'

--Display employees detail whose CITY does not start with ‘B’.
select * from employee where city like '[^B]%'

--Display employees whose second character of FIRSTNAME is a not vowel. 
select * from employee where FIRSTNAME like '_[aeiou]%'

--Display employees whose JOINING YEAR last digit is 4 or 6. 
select * from employee where JOININGYEAR like '%[46]'

--Display employees detail whose FIRSTNAME starts with ‘H’, ends with ‘I’, and CITY contains ‘RA’. 
select * from employee where FIRSTNAME like 'H%I' and city like '%RA%'

--Display employees detail whose FIRSTNAME contains ‘A’, CITY ends with ‘D’, and DEPARTMENT is NOT NULL. 
select * from employee where FIRSTNAME like '%A%' and city like '%d' and DEPARTMENT is not null 

--Display employees whose second and third characters of FIRSTNAME are vowels and CITY starts with ‘R’. 
select * from employee where FIRSTNAME like '_[aeiou][aeiou]%' and city like 'R%'

--PART B:
--Display employees whose CITY contains ‘RA’ and salary less than 13000 and joining year last digit is 6. 
select * from employee where city like '%RA%' and salary<13000 and JOININGYEAR like '%6'

--Display employees whose SALARY between 10000 and 15000 and CITY name contains 'KO' and FIRSTNAME start with H. 
select * from employee where salary between 10000 and 15000 and city like '%ko%' and FIRSTNAME like 'H%'

--23. Display employees whose FIRSTNAME starts with ‘A’ or ‘D’ and SALARY greater than 12000. 
select * from employee where FIRSTNAME like '[AD]%' and salary > 12000

--24. Display employees whose CITY contains ‘N’ and SALARY less than 15000. 
select * from employee where city like '%N%' and salary < 15000

--25. Display employees whose FIRSTNAME length = 6 and CITY ends with ‘AR’.
select * from employee where FIRSTNAME like '______' and city like '%AR'


--PART C:
--26. Display employees whose FIRSTNAME ends with a vowel, department name start with vowel, and SALARY is between 10000 and 15000. 
select * from employee where FIRSTNAME like '%[aeiou]' and DEPARTMENT like '[aeiou]%' and SALARY between 10000 and 15000

--27. Display employees whose LASTNAME contains ‘A’ at least twice, gender is male, and SALARY is not equal to 14000. 
select * from employee where LASTNAME like '%A%A%' and gender = 'male' and salary != 14000

--28. Display employees whose FIRSTNAME second character is vowel and LASTNAME ends with ‘R’ and SALARY less than 12000. 
select  * from employee where FIRSTNAME like '_[aeiou]%' and lastname like '%R' and salary < 12000 

--29. Display employees whose CITY is NOT NULL and FIRSTNAME does not start with vowel and DEPARTMENT not in (‘HR’, ‘IT’). 
select * from employee where city is not null and FIRSTNAME like '[^aeiou]%' and DEPARTMENT not in ('HR','IT')

--30. Display employees whose CITY is not NULL, FIRSTNAME ends with vowels, and DEPARTMENT is neither ‘HR’ nor ‘IT’. 
select * from employee where city is not null and firstname like '%[aeiou]' and DEPARTMENT not in ('HR','IT')





select * from employee