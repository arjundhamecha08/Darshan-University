--PART A:

--Add column state varchar(20).  
Alter table deposit
ADD state varchar(25)

--Add two more columns city varchar(20) and pincode int. 
Alter table deposit
ADD city varchar(20), pincode int

--. Change the size of cname column from varchar(50) to varchar(35). 
Alter table deposit 
Alter column cname varchar(35)

--Change the data type of amount from decimal to int. 
Alter table deposit
Alter column amount int

--Delete column city from the DEPOSIT table.  
Alter table deposit
drop column city

-- Rename column actno to ano.  
SP_RENAME 'deposit.actno', 'ano'

--Rename column bname to branch_name. 
SP_RENAME 'deposit.bname', 'branch_name'

. --Rename table DEPOSIT to DEPOSIT_DETAIL. 
SP_RENAME 'deposit', 'deposit_details'

--Add column ifsc_code varchar(15).
Alter table deposit_details
add ifsc_code varchar(15)

--Change the size of bname column from varchar(50) to varchar(30). 
Alter table deposit_details
Alter column branch_name varchar(30)



--PART B:
-- Rename column adate to aopendate. 
SP_RENAME 'deposit_details.adate', 'aopendate'

--Delete column aopendate from DEPOSIT_DETAIL table. 
Alter table deposit_details
Drop column aopendate

--Rename column cname to customer_name.  
SP_RENAME 'deposit_details.cname', 'customer_name'

--Add column country varchar(20). 
Alter table deposit_details
add country varchar(20)

--Add column account_type varchar(15). 
Alter table deposit_details
add account_type varchar(15)


--PART C
--Change data type of pincode from int to bigint. 
Alter table deposit_details
Alter column pincode bigint

--Delete column account_type.
Alter table deposit_details
drop column account_type

-- Rename column amount to balance.
SP_RENAME 'deposit_details.amount', 'balance'

--Add column status varchar(10). 
Alter table deposit_details
add status varchar(10)

--Change table name deposit_detail to bank_deposit. 
SP_RENAME 'deposit_details', 'bank_details'



--PART D:
--Delete all the records having amount less than or equal to 3000. 
delete from bank_details where balance <= 3000

--Delete all the accounts of ‘BEDI’ branch customer. 
delete from bank_details where branch_name = 'BEDI'

--Delete all the accounts having account number greater than 102 and less than 109. 
delete from bank_details where ano>102 and ano<109

--Delete all the accounts whose branch is ‘BEDI’ or ‘MADHAPAR’. 
delete from bank_details where branch_name = 'BEDI' or branch_name = 'MADHAPAR'

--Delete all the accounts details where amount is 8000 and account open after 1-1-2025; 
delete from bank_details where balance=8000

--Delete all the accounts whose account branch is NULL.  
delete from bank_details where branch_name is null

--Delete all the accounts details where amount is 7000 and name is CHARMI and branch is SHITAL PARK.
delete from bank_details where balance = 7000 and customer_name = 'charmi' and branch_name = 'shital park'

--Delete all the remaining records using DELETE command. 
delete from bank_details

--Delete all the records of DEPOSIT table. (Use TRUNCATE)
truncate table bank_details

 --Remove DEPOSIT table. (Use DROP) 
 drop table bank_details


--PART E
--Delete all the students whose stdid is greater than 105.  
delete from student where stdid>105

--Delete the records whose branch is NULL and sname is not NULL.
delete from student where branch is null and sname is not null

-- Delete the records whose SPI is less than 9 and city is RAJKOT.  
delete from student where spi<9 and city = 'rajkot'

--Delete the records whose branch name is not empty. 
delete from student where branch is not null

-- Delete all the records of STUDENT table. (Use TRUNCATE) 
truncate table student

select * from student