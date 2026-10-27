--PART A

--Copy all records from DEPOSIT where AMOUNT > 3000 into HIGH_AMOUNT. 
select * into high_amount from deposit
where amount>3000

--Copy only CNAME and AMOUNT from DEPOSIT where BNAME = 'MAVDI' into MAVDI_CUSTOMERS.  
select cname,amount into MAVDI_CUSTOMERS from deposit
where bname='mavdi'

--Copy records of DEPOSIT where ADATE > '2025-01-01' into RECENT_DEPOSITS. 
select * into RECENT_DEPOSITS from deposit 
where adate>'2025-01-01'

--Copy distinct BNAME from DEPOSIT into BRANCH_LIST.  
select distinct bname into BRANCH_LIST 

--Copy top 5 records from DEPOSIT into TOP_DEPOSITS.
select top 5 * into TOP_DEPOSITE from deposit

--Copy records where AMOUNT between 2000 and 6000 into MID_RANGE.  
select * into MID_RANGE from deposit where amount between 2000 and 6000

--Copy distinct branch names from DEPOSIT into UNIQUE_BRANCH. 
select distinct bname into UNIQUE_BRANCH from deposit

--Copy records with NULL branch into NO_BRANCH_ASSIGNED.  
select * into NO_BRANCH_ASSIGNED from deposit where bname is null

--Copy all records and rename AMOUNT as BALANCE into DEPOSIT_COPY.
select actno,cname,bname,amount as balance, adate into DEPOSIT_COPY from deposit

--Copy records where BNAME in ('MAVDI','BEDI') into SELECTED_BRANCH.
select * into SELECTED_BRANCH from deposit
where bname in ('MAVDI','BEDI')



--PART B:

--Create a new table STUDENT_BACKUP from STUDENT without copying any data.
select * into Student_Backup from student where 1=0

--Copy SNAME and CITY where BRANCH = 'COMPUTER' into CS_STUDENTS. 
select sname,city into CS_STUDENT from student where branch='computer'

--Copy top 3 students based on SPI into TOPPER_LIST. 
select top 3 spi into TOPPER_LIST from student

--Copy distinct CITY from STUDENT into CITY_LIST.
select distinct city into CITY_LIST from student

-- Copy records where STDID between 103 and 108 into MID_STUDENTS.  
select * into MID_STUDENT from student where STDID between 103 and 108



--PART C:
--Copy records with NULL branch into NULL_BRANCH_STUDENTS.
select * into NULL_BRANCH_STUDENTS from student where branch is null

--Copy all STUDENT records and rename SPI as PERFORMANCE into STUDENT_COPY.  
select stdid,sname,city,spi as performance,branch into student_copy from student

--Copy records where CITY in ('RAJKOT','SURAT') into CITY_WISE.  
select * into CITY_WISE from student where city in('rajkot','surat')

-- Copy students where BRANCH <> 'CIVIL' into NON_CIVIL_STUDENTS.  
select * into NON_CIVIL_STUDENTS from student where branch <> 'civil'

--Copy selected columns (SNAME, CITY) from STUDENT table into a new table. 
select SNAME, CITY into NEW_STUDENT_TABLE from student where 1=0


select * from NEW_STUDENT_TABLE