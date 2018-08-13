
-- Name JUNGWAN KIM !
-- ID 260476658 !

connect to cs421

create table department ( \
did int not null, \
deptName varchar(32), \
administrator varchar(32), \
numberofBeds int, \
primary key (did))

create table employee ( \
eid int not null, \
did int not null, \
firstName varchar(32), \
lastNAme varchar(32), \
jobTitle varchar(20), \
startDate date, \
lastDate date, \
gender varchar(8), \
dateOfBirth date, \
phoneNumber bigint, \
email varchar(20), \
doctorID int, \
specialties varchar(32), \
visitFee int, \
cityFrom varchar(16), \
medicareNumber int, \
primary key (eid), \
foreign key (did) references department)


create table patient ( \
medicareNumber int not null, \
firstName varchar(32), \
lastName varchar(32), \
gender varchar(8), \
dateOfBirth date, \
phoneNumber bigint, \
civicNumber varchar(32), \
city varchar(16), \
postalCode varchar(6), \
country varchar(16), \
numberOfVisit int, \
primary key (medicareNumber))

create table admission ( \
dateA date not null, \
medicareNumber int not null, \
assignedDoctor int not null, \
reasonForAdmission varchar(32), \
dateAdmitted date, \
dateDischarged date, \
primary key (dateA, medicareNumber, assignedDoctor), \
foreign key (medicareNumber) references patient, \
foreign key (assignedDoctor) references employee)

create table visit ( \
timeV time not null, \
dateV date not null, \
medicareNumber int not null, \
doctorID int not null, \
diagnosis varchar(64), \
medicalReport varchar(64), \
primary key (timeV, dateV, medicareNumber, doctorID), \
foreign key (medicareNumber) references patient, \
foreign key (doctorID) references employee)


insert into department values (1, 'Department1', 'administrator1', 11)
insert into department values (2, 'Department2', 'administrator2', 12)
insert into department values (3, 'Department3', 'administrator3', 13)
insert into department values (4, 'Neurology', 'administrator4', 14)

insert into employee values (1, 1, 'administrator1', 'Fox', 'Administrator', '2000-01-01', '9999-12-31', 'Male', '1980-01-02', 5141111111, 'a1@h1.ca', NULL, NULL, NULL, 'Montreal', 2000)
insert into employee values (2, 1, 'Shaun', 'Hale', 'Doctor', '2000-01-02', '9999-12-31', 'Female', '1980-01-02', 5141111112, 's.h@h1.ca', 1, 'Heart', 90, 'Montreal', 2001) 
insert into employee values (3, 1, 'Robin', 'Lyons', 'Nurse', '2000-01-03', '2012-12-12', 'Male', '1981-01-02', 5141111113, 'r.l@h1.ca', NULL, 'Nursing', NULL, 'Laval', 2002)
insert into employee values (4, 1, 'Yvonne', 'Warner', 'Nurse', '2000-01-04', '9999-12-31', 'Female', '1982-01-03', 5141111114, 'y.w@h1.ca', NULL, 'Nursing', NULL, 'Montreal', 2003)
insert into employee values (5, 1, 'Ryan', 'Dixon', 'Nurse', '2014-01-05', '9999-12-31', 'Male', '1980-02-03', 5141111115, 'r.d@h1.ca', NULL, 'Assist', NULL, 'Quebec', 2004)
insert into employee values (6, 2, 'adiminostartor2', 'Dixon', 'Administrator', '2002-02-02', '9999-12-12', 'Female', '1980-01-01', 5141223332, 'a2@h2.ca', NULL, NULL, NULL, 'Montreal', 2005)
insert into employee values (7, 2, 'Elvira', 'Carson', 'Doctor', '2002-02-02', '9999-12-31', 'Female', '1980-01-01', 5141223334, 'e.c@h2.ca', 2, 'heart', 100, 'Montreal', 2006)
insert into employee values (8, 2, 'Lorraine', 'Hicks', 'Nurse', '2002-02-03', '2004-12-24', 'Female', '1980-01-01', 5141221234, 'l.h@h2.ca', NULL, 'Nursing', NULL, 'Quebec', 2007)
insert into employee values (9, 2, 'Joseph', 'Williams', 'Doctor', '2002-02-04', '9999-12-31', 'Male', '1988-02-02', 5141223336, 'j.w@h2.ca', 6, 'General', 40, 'Laval', 1002)
insert into employee values (10, 2, 'Clifford', 'Glover', 'Nurse', '2013-02-05', '9999-12-31', 'Male', '1977-08-03', 5141237890, 'c.g@h2.ca', NULL, 'Assist', NULL, 'Quebec', 2008)
insert into employee values (11, 3, 'administrator3', 'Newton', 'Administrator', '2004-03-03', '9999-12-12', 'Male', '1934-03-04', 5141228765, 'a3@h3.ca', NULL, NULL, NULL, 'Montreal', 2009)
insert into employee values (12, 3, 'Antonio', 'Strickland', 'Doctor', '2004-03-04', '9999-12-31', 'Male', '1955-04-09', 5142898765, 'a.s@h3.ca', 3, 'Radiology', 30, 'Montreal', 2010)
insert into employee values (13, 3, 'Kendra', 'Clarke', 'Nurse', '2004-03-05', '2008-08-09', 'Female', '1993-03-03', 5147651230, 'k.c@h3.ca', NULL, 'Nursing', NULL, 'Montreal', 2011)
insert into employee values (14, 3, 'Wilfred', 'Reese', 'Nurse', '2014-03-06', '9999-12-31', 'Male', '1994-04-03', 5148762930, 'w.r@h3.ca', NULL, 'Nursing', NULL, 'Quebec', 2012)
insert into employee values (15, 3, 'Cedric', 'Sutton', 'Nurse', '2011-06-20', '9999-12-31', 'Female', '1992-09-08', 5146382847, 'c.s@h3.ca', NULL, 'Assist', NULL, 'Laval', 2013)
insert into employee values (16, 4, 'administrator4', 'Parks', 'Administrator', '2008-09-08', '9999-12-12', 'Female', '1940-03-21', 5148631920, 'a4@h4.ca', NULL, NULL, NULL, 'Montreal', 2015)
insert into employee values (17, 4, 'Grady', 'Crawford', 'Doctor', '2008-09-09', '9999-12-31', 'Male', '1977-03-04', 5149834750, 'g.c@h4.ca', 4, 'Neurology', 150, 'Laval', 2016)
insert into employee values (18, 4, 'Timmy', 'Underwood', 'Doctor', '2012-12-12', '9999-12-31', 'Male', '1984-07-07', 5148370048, 't.u@h4.ca', 5, 'Neurology', 170, 'Quebec', 1001)
insert into employee values (19, 4, 'Ann', 'Flores', 'Nurse', '2012-12-13', '9999-12-31', 'Female', '1983-12-14', 5149313338, 'a.f@h4.ca', NULL, 'Nursing', NULL, 'Montreal', 2017)
insert into employee values (20, 4, 'Tonya', 'James', 'Nurse', '2014-04-04', '9999-12-31', 'Male', '1985-11-11', 5149840101, 't.j@h4.ca', NULL, 'Assist', NULL, 'Montreal', 2018)

insert into patient values (1001, 'Timmy', 'Underwood', 'Male', '1984-07-07', 5148370048, '843', 'Montreal', 'H5H1G9', 'Canada', 1)
insert into patient values (1002, 'Joseph', 'Williams', 'Male', '1988-02-02', 5141223336, '842', 'Montreal', 'H3F3G1', 'Canada', 1)
insert into patient values (1003, 'Stephen', 'Vargas', 'Male', '1989-12-11', 5141001941, '815', 'Montreal', 'H6A3G2', 'Canada', 1)
insert into patient values (1004, 'Taylor', 'Sullivan', 'Male', '1964-11-27', 5141005814, '835', 'Montreal', 'H8T4G3', 'Canada', 2)
insert into patient values (1005, 'Joseph', 'Vasquez', 'Male', '1943-09-17', 5141001184, '844', 'Montreal', 'H7C1G4', 'Canada', 2)
insert into patient values (1006, 'Henry', 'Morgan', 'Male', '1992-01-12', 5141001984, '245', 'Montreal', 'H1B2G4', 'Canada', 5)
insert into patient values (1007, 'Sheryl', 'Norris', 'Female', '1981-02-14', 5141004724, '145', 'Montreal', 'H2A0G3', 'Canada', 1)
insert into patient values (1008, 'Bessie', 'Walters', 'Female', '1967-04-12', 5141004871, '445', 'Montreal', 'H6A3G4', 'Canada', 1)
insert into patient values (1009, 'Corey', 'Norman', 'Male', '1989-09-11', 5141001074, '245', 'Montreal', 'H4A0G3', 'Canada', 1)
insert into patient values (1010, 'Angel', 'richards', 'Female', '1975-10-23', 5141003816, '445', 'Montreal', 'H9A9G2', 'Canada', 1)
insert into patient values (1011, 'Phillip', 'Gardner', 'Male', '1983-11-27', 5141005917, '545', 'Montreal', 'H3B0G3', 'Canada', 1)
insert into patient values (1012, 'Antonio', 'Briggs', 'Male', '1966-12-01', 5141001740, '645', 'Montreal', 'H1A1G7', 'Canada', 1)
insert into patient values (1013, 'Dustin', 'Bryan', 'Male', '1999-07-14', 5141008402, '745', 'Montreal', 'H2A2R4', 'Canada', 1)
insert into patient values (1014, 'Miguel', 'Berry', 'Female', '1983-03-30', 5141001927, '815', 'Montreal', 'H6A3T2', 'Canada', 1)
insert into patient values (1015, 'Dean', 'Rodriquez', 'Male', '1961-06-21', 5141005830, '835', 'Montreal', 'H5A1D1', 'Canada', 1)
insert into patient values (1016, 'Elmer', 'Kelley', 'Female', '1976-04-22', 5141003861, '855', 'Montreal', 'H2A3E4', 'Canada', 1)
insert into patient values (1017, 'Edith', 'Wolfe', 'Female', '1957-02-14', 5141003719, '865', 'Montreal', 'H3A0G3', 'Canada', 1)
insert into patient values (1018, 'Bryan', 'Crawford', 'Male', '1955-07-19', 5141002819, '745', 'Montreal', 'H1A424', 'Canada', 1)
insert into patient values (1019, 'Jeremy', 'Andrews', 'Male', '1949-03-20', 5141003841, '945', 'Montreal', 'H2A4K1', 'Canada', 1)
insert into patient values (1020, 'Georgia', 'Leonard', 'Female', '1974-04-19', 5141003719, '249','Montreal', 'H3A0G4', 'Canada', 1)
insert into patient values (2002, 'Robin', 'Lyons', 'Male', '1981-01-02', 5141111113, '242','Montreal', 'H3A4G4', 'Canada', 1)



insert into visit values ('09:00:00', '2000-09-09', 1001, 1, 'Cancer', 'CancerReport')
insert into visit values ('08:00:00', '2011-09-09', 1002, 2, 'HIV', 'HIVReport')
insert into visit values ('07:00:00', '2001-09-09', 1003, 3, 'Cancer', 'CancerReport')
insert into visit values ('06:00:00', '2002-09-09', 1004, 4, 'HIV', 'HIVReport')
insert into visit values ('05:00:00', '2013-09-09', 1005, 2, 'HIV', 'HIVReport')
insert into visit values ('15:00:00', '2010-09-09', 1006, 1, 'Heart', 'HeartReport')
insert into visit values ('04:00:00', '2000-09-09', 1007, 2, 'Cancer', 'CancerReport')
insert into visit values ('03:00:00', '2014-09-09', 1008, 5, 'Cancer', 'CancerReport')
insert into visit values ('04:00:00', '2014-09-09', 1009, 4, 'Cancer', 'CancerReport')
insert into visit values ('05:00:00', '2014-09-09', 1010, 3, 'Cancer', 'CancerReport')
insert into visit values ('06:00:00', '2001-09-09', 1011, 2, 'Cacner', 'CancerReport')
insert into visit values ('07:00:00', '2005-09-09', 1012, 6, 'Cacner', 'CacnerReport')
insert into visit values ('08:00:00', '2004-09-09', 1013, 5, 'Cold', 'ColdReport')
insert into visit values ('09:00:00', '2003-09-09', 1014, 4, 'Cold', 'ColdReport')
insert into visit values ('08:00:00', '2003-09-09', 1015, 3, 'Cold', 'ColdReport')
insert into visit values ('07:00:00', '2004-09-09', 1016, 2, 'HIV', 'HIVReport')
insert into visit values ('06:00:00', '2006-09-09', 1017, 1, 'HIV', 'HIVReport')
insert into visit values ('05:00:00', '2009-09-09', 1018, 6, 'HIV', 'HIVReport')
insert into visit values ('04:00:00', '2008-09-09', 1019, 5, 'HIV', 'HIVReport')
insert into visit values ('03:00:00', '2007-09-09', 1020, 4, 'HIV', 'HIVReport')
insert into visit values ('02:00:00', '2005-09-09', 1004, 5, 'Cancer', 'CancerReport')
insert into visit values ('01:00:00', '2004-09-09', 1005, 2, 'Cancer', 'CancerReport')
insert into visit values ('10:01:00', '2003-09-09', 1006, 1, 'Heart', 'HeartReport')
insert into visit values ('10:02:00', '2013-09-09', 1006, 4, 'Heart', 'HeartReport')
insert into visit values ('10:03:00', '2014-09-09', 1006, 5, 'Heart', 'HeartReport')
insert into visit values ('10:00:00', '2015-09-09', 1006, 3, 'Cold', 'ColdReport')
insert into visit values ('10:00:00', '2015-10-09', 2002, 3, 'HIV', 'HIVReport')

insert into admission values ('2000-09-09', 1001, 1, 'Cancer', '2000-09-09', '2000-12-12')
insert into admission values ('2011-09-09', 1002, 1, 'HIV', '2011-09-09', '2011-12-12')
insert into admission values ('2001-09-09', 1003, 1, 'Cancer', '2001-09-09', '2001-12-12')
insert into admission values ('2002-09-09', 1004, 1, 'HIV', '2002-09-09', '2002-12-12')
insert into admission values ('2013-09-09', 1005, 1, 'HIV', '2013-09-09', '2013-12-12')
insert into admission values ('2010-09-09', 1006, 1, 'Heart', '2016-09-09', '2016-12-12')
insert into admission values ('2014-09-09', 1010, 1, 'Cancer', '2014-09-09', '2014-12-12')
insert into admission values ('2005-09-09', 1004, 1, 'Cancer', '2005-09-09', '2005-12-12')
insert into admission values ('2004-09-09', 1005, 1, 'Cancer', '2004-09-09', '2004-12-12')




-- Q1 !
select * \
from Employee e \
where e.jobTitle = 'Doctor' and \
e.specialties = 'Heart'

-- Q2 !
select * \
from Employee e \
where e.jobTitle = 'Nurse' and \
e.cityFrom = 'Laval' and \
e.startDate < '2012-06-01' and \
e.lastDate = '9999-12-31'

-- Q3 given patient number 1005 !
select v.medicalReport \
from Visit v \
where v.medicareNumber = 1005 

-- Q4 given patient number 1006 !
select e.visitFee \
from Visit v, Employee e \
where v.medicareNumber = 1006 and \
v.dateV >= '2014-06-01' and \
v.doctorID = e.doctorID

-- Q5 !
select p.* \
from Patient p, Visit v \
where p.numberOfVisit >= 5 and \
v.diagnosis = 'Heart' \
intersect \
select * \
from Patient p 

-- Q6 !
select p.firstName, p.lastName, p.phoneNumber, a.dateAdmitted, a.dateDischarged \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
p.medicareNumber in ( \
select p.medicareNumber \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
a.reasonForAdmission = 'HIV' \
intersect \
select p.medicareNumber \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
a.reasonForAdmission = 'Cancer' ) 
 
-- Q7 !
select p.firstName, p.lastName, p.phoneNumber, a.dateAdmitted, a.dateDischarged \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
p.medicareNumber in ( \
select p.medicareNumber \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
a.reasonForAdmission = 'Cancer' \
except \
select p.medicareNumber \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
a.reasonForAdmission = 'HIV' ) 

-- Q8 !
select p.firstName, p.lastName, p.phoneNumber, a.dateAdmitted, a.dateDischarged \
from Patient p, Admission a, Employee e \
where p.medicareNumber = a.medicareNumber and \
a.medicareNumber = e.medicareNumber 

-- Q9 !
select p.firstName, p.lastName, p.phoneNumber, a.dateAdmitted, a.dateDischarged \
from Patient p, Admission a \
where p.medicareNumber = a.medicareNumber and \
p.medicareNumber in ( \
select p.medicareNumber \
from Patient p \
where not exists (( \
select e.doctorID \
from Employee e \
where e.jobtitle = 'Doctor' and \
e.did in ( \
select d.did \
from Department d \
where d.deptName = 'Neurology') \
except \
select v.doctorID \
from visit v \
where p.medicareNumber = v.medicareNumber )))

-- Q10 !
select e.firstName, e.lastName, e.jobTitle, e.phoneNumber \
from Employee e, Patient p, Visit v \
where e.medicareNumber = p.medicareNumber and \
v.medicareNumber = p.medicareNumber and \
v.diagnosis = 'HIV'

-- Q11 !
select e.* \
from Employee e \
where e.visitFee in ( \
select max(e.visitFee) \
from Employee e )

-- Q12 !
select d.deptName, max(e.visitFee) as Maximum, min(e.visitFee) as Minimum, avg(e.visitFee) as Average \
from Department d, Employee e \
where d.did = e.did and \
e.jobTitle = 'Doctor' \
group by d.deptName \
having count(*) >= 2


delete from visit
delete from admission
delete from patient
delete from employee
delete from department


drop table department
drop table employee
drop table patient
drop table admission
drop table visit
