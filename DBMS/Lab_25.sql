--Part – A: 

--1. Implement scalar function to return "Welcome to DBMS Lab". 
CREATE function Greeting()
RETURNS VARCHAR(100)
AS BEGIN
RETURN 'Welcome to DBMS Lab'
END
SELECT DBO.Greeting()

--2. Implement scalar function to calculate simple interest.
CREATE FUNCTION CALC_INTREST
(
@PRINCIPAL FLOAT,
@TIME FLOAT,
@RATE FLOAT
)
RETURNS FLOAT
AS BEGIN
RETURN (@PRINCIPAL*@TIME*@RATE)
END

SELECT DBO.CALC_INTREST(100,20,30)

--3. Implement scalar function to find difference in days between two dates. 
CREATE FUNCTION DIFF_DATES(
@DATE1 DATE,
@DATE2 DATE
)
RETURNS INT
AS BEGIN
RETURN DATEDIFF(DAY,@DATE1,@DATE2)
END

SELECT DBO.DIFF_DATES('01-01-2026','02-02-2026')


--4. Implement scalar function to check whether number is odd or even.
CREATE FUNCTION ODD_EVEN(
@NUM INT 
)
RETURNS VARCHAR(25)
AS BEGIN
IF @NUM%2 = 0
	RETURN 'EVEN'

RETURN 'ODD'
END

SELECT DBO.ODD_EVEN(10)

--5. Implement scalar function to print numbers from 1 to N. 
CREATE FUNCTION PRINT_TO_N(
@NUM INT
)
RETURNS INT
AS BEGIN
CREATE OR ALTER FUNCTION dbo.UDF_Numbers1ToN(@N INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
 DECLARE @i INT=1,@result VARCHAR(MAX)='';
 IF @N<1 RETURN '';
 WHILE @i<=@N
 BEGIN
   SET @result=@result+CASE WHEN @i=1 THEN '' ELSE ', ' END+CONVERT(VARCHAR(20),@i);
   SET @i=@i+1;
 END;
 RETURN @result;
END;
GO
-- SELECT dbo.UDF_Numbers1ToN(10);

-- Part B, 6. Factorial (returns NULL for negative input or values above 20)
CREATE OR ALTER FUNCTION dbo.UDF_Factorial(@N INT)
RETURNS BIGINT
AS
BEGIN
 DECLARE @i INT=1,@result BIGINT=1;
 IF @N<0 OR @N>20 RETURN NULL;
 WHILE @i<=@N
 BEGIN
   SET @result=@result*@i;
   SET @i=@i+1;
 END;
 RETURN @result;
END;
GO
-- SELECT dbo.UDF_Factorial(5);

-- 7. Palindrome number
CREATE OR ALTER FUNCTION dbo.UDF_IsPalindromeNumber(@N BIGINT)
RETURNS VARCHAR(10)
AS
BEGIN
 DECLARE @original VARCHAR(30)=CONVERT(VARCHAR(30),@N),@reverse VARCHAR(30)='';
 DECLARE @i INT=LEN(CONVERT(VARCHAR(30),@N));
 WHILE @i>0
 BEGIN
   SET @reverse=@reverse+SUBSTRING(@original,@i,1);
   SET @i=@i-1;
 END;
 RETURN CASE WHEN @N>=0 AND @original=@reverse THEN 'Palindrome' ELSE 'Not Palindrome' END;
END;
GO
-- SELECT dbo.UDF_IsPalindromeNumber(121);

-- 8. Maximum of three numbers
CREATE OR ALTER FUNCTION dbo.UDF_MaxOfThree(@A DECIMAL(18,2),@B DECIMAL(18,2),@C DECIMAL(18,2))
RETURNS DECIMAL(18,2)
AS
BEGIN
 RETURN CASE WHEN @A>=@B AND @A>=@C THEN @A WHEN @B>=@A AND @B>=@C THEN @B ELSE @C END;
END;
GO
-- SELECT dbo.UDF_MaxOfThree(10,25,15);

-- 9. Square and cube (returned as text pair)
CREATE OR ALTER FUNCTION dbo.UDF_SquareCube(@N DECIMAL(18,2))
RETURNS VARCHAR(100)
AS
BEGIN
 RETURN CONCAT('Square = ',CONVERT(VARCHAR(50),@N*@N),
               ', Cube = ',CONVERT(VARCHAR(50),@N*@N*@N));
END;
GO
-- SELECT dbo.UDF_SquareCube(4);

-- Part C, 10. Employee full details by EID.
-- Scalar functions return one scalar value, so details are returned as formatted text.
CREATE OR ALTER FUNCTION dbo.UDF_EmployeeFullDetails(@EID INT)
RETURNS VARCHAR(500)
AS
BEGIN
 DECLARE @Details VARCHAR(500);
 SELECT @Details=CONCAT('EID=',EID,', Name=',FIRSTNAME,' ',LASTNAME,
   ', Department=',COALESCE(DEPARTMENT,'NULL'),', Salary=',SALARY,
   ', City=',COALESCE(CITY,'NULL'),', Gender=',COALESCE(GENDER,'NULL'),
   ', JoiningYear=',JOININGYEAR)
 FROM EMPLOYEE WHERE EID=@EID;
 RETURN @Details;
END;
GO
-- SELECT dbo.UDF_EmployeeFullDetails(101);

-- 11. Highest salary from a department
CREATE OR ALTER FUNCTION dbo.UDF_HighestSalaryByDepartment(@Department VARCHAR(50))
RETURNS DECIMAL(10,2)
AS
BEGIN
 DECLARE @Highest DECIMAL(10,2);
 SELECT @Highest=MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT=@Department;
 RETURN @Highest;
END;
GO
-- SELECT dbo.UDF_HighestSalaryByDepartment('IT');

-- 12. Total employees
CREATE OR ALTER FUNCTION dbo.UDF_TotalEmployees()
RETURNS INT
AS
BEGIN
 DECLARE @Total INT;
 SELECT @Total=COUNT(*) FROM EMPLOYEE;
 RETURN @Total;
END;
GO
-- SELECT dbo.UDF_TotalEmployees();

-- 13. Experience in years using JoiningYear
CREATE OR ALTER FUNCTION dbo.UDF_EmployeeExperience(@JoiningYear INT)
RETURNS INT
AS
BEGIN
 RETURN YEAR(GETDATE())-@JoiningYear;
END;
GO
-- SELECT dbo.UDF_EmployeeExperience(2022);

-- 14. Employee count in a department
CREATE OR ALTER FUNCTION dbo.UDF_EmployeeCountByDepartment(@Department VARCHAR(50))
RETURNS INT
AS
BEGIN
 DECLARE @Total INT;
 SELECT @Total=COUNT(*) FROM EMPLOYEE WHERE DEPARTMENT=@Department;
 RETURN @Total;
END;
GO
-- SELECT dbo.UDF_EmployeeCountByDepartment('HR');

-- 15. Employee count in a city
CREATE OR ALTER FUNCTION dbo.UDF_EmployeeCountByCity(@City VARCHAR(50))
RETURNS INT
AS
BEGIN
 DECLARE @Total INT;
 SELECT @Total=COUNT(*) FROM EMPLOYEE WHERE CITY=@City;
 RETURN @Total;
END;
GO