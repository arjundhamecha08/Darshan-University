--EMPLOYEE_LOG (LOGID, EID, OLDVALUE, NEWVALUE, FIELDNAME, OPERATIONTYPE, LOGDATE) 
--From the table EMPLOYEE perform the following queries:  
--Part – A: 
--1. Create trigger for printing message after employee record insertion. 
create trigger tr_employee_insertion
on employee
after insert
as begin
print 'Record Inserted Successfully'
end

 INSERT INTO employee VALUES
 (112,'ARJUN','DHAMECHA','STUDENT',12000.00,'Morbi','MALE',2026)

--2. Create trigger for printing message after employee record update.
create or alter trigger tr_employee_update
on employee
after update
as begin
print 'Record Updated Successfully'
end

update employee set SALARY = 0 where EID = 112

--3. Create trigger for printing message after employee record deletion.
create trigger tr_employee_deletion
on employee
after delete
as begin
print 'Record deleted Successfully'
end

delete from employee where EID = 112

--4. Create trigger for printing message after employee salary increment.
CREATE OR ALTER TRIGGER trg_Salary
ON EMPLOYEE AFTER UPDATE
AS
BEGIN
    IF UPDATE(SALARY)
       AND EXISTS (
           SELECT 1 FROM inserted i
           JOIN deleted d ON i.EID = d.EID
           WHERE i.SALARY > d.SALARY
       )
        PRINT 'Salary increased';
END;
GO



--5. Create trigger for automatically converting CITY names into uppercase during insertion. 
 CREATE OR ALTER TRIGGER trg_CityUpper
ON EMPLOYEE AFTER INSERT
AS
BEGIN
    UPDATE E
    SET CITY = UPPER(E.CITY)
    FROM EMPLOYEE E
    JOIN inserted I ON E.EID = I.EID
    WHERE E.CITY IS NOT NULL;
END;
GO

--Part – B: 
--6. Create trigger for updating employee city and printing old city and new city name. 
CREATE OR ALTER TRIGGER trg_CityChange
ON EMPLOYEE AFTER UPDATE
AS
BEGIN
    IF UPDATE(CITY)
        SELECT i.EID, d.CITY AS OldCity, i.CITY AS NewCity
        FROM inserted i
        JOIN deleted d ON i.EID = d.EID
        WHERE ISNULL(i.CITY,'') <> ISNULL(d.CITY,'');
END;
GO


--7. Create trigger for automatically setting CITY as 'RAJKOT' if no city value is entered during employee insertion. 
CREATE OR ALTER TRIGGER trg_DefaultCity
ON EMPLOYEE AFTER INSERT
AS
BEGIN
    UPDATE E
    SET CITY = 'RAJKOT'
    FROM EMPLOYEE E
    JOIN inserted I ON E.EID = I.EID
    WHERE E.CITY IS NULL;
END;
GO

--8. Create trigger for automatically adding current year in JOININGYEAR if no value is entered.
CREATE OR ALTER TRIGGER trg_DefaultYear
ON EMPLOYEE AFTER INSERT
AS
BEGIN
    UPDATE E
    SET JOININGYEAR = YEAR(GETDATE())
    FROM EMPLOYEE E
    JOIN inserted I ON E.EID = I.EID
    WHERE E.JOININGYEAR IS NULL;
END;
GO


--9. Create trigger for printing employee full name after new employee insertion.
CREATE OR ALTER TRIGGER trg_FullName
ON EMPLOYEE AFTER INSERT
AS
BEGIN
    SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS FullName
    FROM inserted;
END;
GO

--10. Create trigger for automatically assigning department as ‘GENERAL’ if DEPARTMENT value is NULL. 
 CREATE OR ALTER TRIGGER trg_DefaultDept
ON EMPLOYEE AFTER INSERT
AS
BEGIN
    UPDATE E
    SET DEPARTMENT = 'GENERAL'
    FROM EMPLOYEE E
    JOIN inserted I ON E.EID = I.EID
    WHERE E.DEPARTMENT IS NULL;
END;
GO

--Part – C: 
--11. Create trigger for storing updated employee details such as EID, old salary, new salary, old department, new department, and update date into EMPLOYEE_UPDATE_LOG table. 


--12. Create trigger for storing newly inserted employee details with insertion date into 
--EMPLOYEE_INSERT_LOG table. 
--13. Create trigger for storing old and new FIRSTNAME values after employee name update into 
--NAME_CHANGE_LOG table. 
--14. Create trigger for storing old city and new city details into CITY_UPDATE_LOG table after city update. 
--15. Implement INSTEAD OF INSERT trigger on EMPLOYEE table to automatically remove extra spaces from 
--FIRSTNAME and LASTNAME before insertion. 