--Part A

--Update SPI of all students from 7.00 to 8.00.
update student set spi=8.0 where spi=7.0

--Change city of HETVI from RAJKOT to AHMEDABAD.
update student set city='AHEMADABAD' where sname='HETVI'

--Update SPI of DEEP to 9.20 and city to VADODARA.3
update student set spi=9.20,city='VADODARA' where sname='DEEP'

--Update SPI of DHARMIK to 8.50.
update student set spi=8.50 where sname='DHARMIK'

--Update branch name from COMPUTER to IT.
update student set branch='IT' where BRANCH = 'COMPUTER'

--Update branch of RAJ to AUTOMOBILE. 
update student set BRANCH='AUTOMOBILE' where sname='RAJ'

--Update SPI to 7.50 where STDID is between 103 and 107. 
update student set spi=7.50 where stdid between 103 and 107

--Update city of PARAG to MUMBAI. 
update student set city='MUMBAI' where sname='PARAG'

--Update SPI of RIYA to 6.00. 
update student set spi=6.00 where sname='RIYA'

--Update SPI of SMAIR to 7.20 and branch to ELECTRICAL
update student set spi=7.20,branch='ELECTRICAL' where sname='SAMIR'

--PART B
--Give 10% increment in SPI.  
update student set spi=spi+(spi*0.10)

-- Increase SPI by 20% for all students. 
update student set spi=spi+(spi*0.20)

--Increase SPI by 0.50 in all records.  
update student set spi = spi+0.50

--Update branch to 'EC' and SPI to 8.00 and city to Surat where SNAME is KRUNAL.  
update student set branch='EC',SPI=8.0,city='SURAT' where sname='KRUNAL'

--Update city to 'RAJKOT' and SPI to 7.00 where branch is CIVIL and stdid is less than 105. 
update student set city='RAJKOT',SPI=7.0 where branch='CIVIL' and stdid<105

--PART C:

--Update SPI of student with stdid 110 to NULL.
update student set spi=null where stdid = 110

--Update branch of VISHAL to NULL.  
update student set branch=NULL where sname='vishal'

--Display names of students whose SPI is NULL.  
select sname from student where spi is NULL

--Display students who have branch assigned.  
select * from student where branch is not null

-- Update student with stdid 108 to name DARSHAN, branch COMPUTER, and SPI 8.50.  
update student set sname='DARHSNA', branch='COMPUTER',spi=8.50 where stdid=108

--Update city to SURAT where SPI is less than 7.00.  
update student set city='SURAT' where spi<7.0

--Update city to NULL and branch to MECHANICAL where stdid is 109. 
update student set city=null, branch='MECHANICAL' where stdid = 109
select * from student