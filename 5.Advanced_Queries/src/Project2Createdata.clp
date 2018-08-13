
connect to cs421

create table plans ( \
planID int not null, \
type varchar(15), \
memberFee int, \
numberOfMembers int, \
planProfitability int, \
primary key (planID))

create table provider ( \
providerID int not null, \
firstName varchar(20), \
lastName varchar(20), \
specialty varchar(20), \
experience int, \
averageMemberCost int, \
primary key (providerID))

create table dentalOffice ( \
locationID int not null, \
address varchar(32), \
state varchar(5), \
totalAverageMemberCost int, \
primary key (locationID))

create table demographics ( \
state varchar(5) not null, \
popSize bigint, \
popDensity int, \
racialShareW int, \
racialShareB int, \
racialShareA int, \
racialShareH int, \
averageIncome int, \
primary key (state))

create table members ( \
memberID int not null, \
planID int not null, \
firstName varchar(20), \
lastName varchar(20), \
gender varchar(1), \
age int, \
race varchar(10), \
address varchar(50), \
state varchar(5), \
membershipTenure int, \
primary key (memberID), \
foreign key (planID) references plans)

create table claims ( \
claimID int not null, \
memberID int not null, \
providerID int not null, \
planID int not null, \
procedureCode varchar(32), \
cost int, \
coPayCost int, \
insurancePay int, \
date date, \
primary key (claimID), \
foreign key (memberID) references members, \
foreign key (planID) references plans, \
foreign key (providerID) references provider)

create table dentalMedicalHistory ( \
memberID int not null, \
date date not null, \
procedureCode varchar(32), \
cost int, \
primary key (memberID, date), \
foreign key (memberID) references members)

create table visits ( \
memberID int not null, \
locationID int not null, \
primary key (memberID, locationID), \
foreign key (memberID) references members, \
foreign key (locationID) references dentalOffice)

create table worksAt ( \
providerID int not null, \
locationID int not null, \
primary key (providerID, locationID), \
foreign key (providerID) references provider, \
foreign key (locationID) references dentalOffice)

create table submits ( \
memberID int not null, \
claimID int not null, \
primary key (memberID, claimID), \
foreign key (memberID) references members, \
foreign key (claimID) references claims)

create table services ( \
providerID int not null, \
memberID int not null, \
primary key (providerID, memberID), \
foreign key (providerID) references provider, \
foreign key (memberID) references members)

create table belongsTo ( \
memberID int not null, \
state varchar(5) not null, \
primary key (memberID), \
foreign key (memberID) references members, \
foreign key (state) references demographics)

create table has ( \
memberID int not null, \
date date not null, \
primary key (memberID, date), \
foreign key (memberID) references members)

create table participateIn ( \
memberID int not null, \
planID int not null, \
membershipTenure int not null, \
primary key (memberID, planID), \
foreign key (memberID) references members, \
foreign key (planID) references plans, \
foreign key (membershipTenure) references members)


INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (1,'Company',40,9,1)
INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (2,'Government',70,8,2)
INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (3,'Government',29,9,3)
INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (4,'Company',31,9,4)
INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (5,'Government',59,5,5)
INSERT INTO plans (planID,type,memberFee,numberOfMembers,planProfitability) VALUES (6,'Government',47,10,6)

INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (1,'Uta','Higgins','General',5)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (2,'Kamal','Dawson','Dental Surgeon',20)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (3,'McKenzie','Knight','General',10)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (4,'Veronica','Wynn','Orthodontist',20)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (5,'Montana','Burnett','Dental Surgeon',16)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (6,'Arden','Stark','General',1)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (7,'Heidi','Key','General',13)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (8,'Amaya','Barron','Dental Surgeon',5)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (9,'Katelyn','Steele','General',11)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (10,'Lane','Benton','Orthodontist',13)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (11,'Griffith','Turner','Orthodontist',18)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (12,'Meredith','Snider','Dental Surgeon',4)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (13,'Kibo','Carter','General',6)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (14,'Lael','Becker','Orthodontist',17)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (15,'Driscoll','Vargas','Orthodontist',11)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (16,'Whilemina','Nolan','General',18)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (17,'Cherokee','Moody','General',11)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (18,'Jonas','Vang','General',13)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (19,'Rosalyn','Chase','General',14)
INSERT INTO provider (providerID,firstName,lastName,specialty,experience) VALUES (20,'Damian','Wiggins','General',1)


INSERT INTO dentalOffice (locationID,address,state) VALUES (1,'Ap #553-4240 Nibh Rd.','DL')
INSERT INTO dentalOffice (locationID,address,state) VALUES (2,'Ap #441-9437 In Street','DL')
INSERT INTO dentalOffice (locationID,address,state) VALUES (3,'Ap #990-1563 Dapibus Avenue','AL')
INSERT INTO dentalOffice (locationID,address,state) VALUES (4,'177-9572 Risus St.','CT')
INSERT INTO dentalOffice (locationID,address,state) VALUES (5,'Ap #545-7354 Fusce Av.','CT')
INSERT INTO dentalOffice (locationID,address,state) VALUES (6,'355-9875 Enim St.','CT')

INSERT INTO demographics (state,popSize,popDensity,racialShareW,racialShareB,racialShareA,racialShareH,averageIncome) VALUES ('AL',186879017,43,41,25,5,13,37497)
INSERT INTO demographics (state,popSize,popDensity,racialShareW,racialShareB,racialShareA,racialShareH,averageIncome) VALUES ('CT',603024499,24,37,30,6,15,25837)
INSERT INTO demographics (state,popSize,popDensity,racialShareW,racialShareB,racialShareA,racialShareH,averageIncome) VALUES ('DL',399516892,35,31,21,6,18,32605)



INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (1,5,'Demetria','Pena','M',55,'Black','P.O. Box 519, 4619 Non, Av.','AL',16)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (2,5,'Anthony','Duke','M',80,'Asian','Ap #929-3193 Tellus Rd.','AL',9)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (3,2,'Mercedes','Wiley','F',86,'Other','P.O. Box 916, 5280 Elit, St.','DL',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (4,6,'Zephr','Hawkins','M',93,'Hispanic','696-4343 Consectetuer Rd.','AL',24)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (5,5,'Upton','Burris','F',53,'Black','Ap #457-2275 Enim Rd.','CT',35)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (6,1,'Cadman','Maynard','F',62,'Other','5088 Luctus Rd.','DL',9)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (7,3,'Wendy','Sutton','F',48,'Hispanic','Ap #169-3817 At, Av.','CT',19)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (8,4,'Carol','Jacobs','M',69,'Asian','Ap #179-3946 Tristique Rd.','CT',14)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (9,2,'Helen','Warren','F',40,'White','462-6819 Pretium Avenue','CT',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (10,3,'Kasimir','Calderon','M',71,'Hispanic','8278 Netus Rd.','CT',10)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (11,6,'Sybil','Huffman','F',77,'Black','Ap #143-3859 Consectetuer Rd.','CT',8)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (12,4,'Rhoda','Case','F',56,'White','Ap #639-4484 Velit Street','DL',8)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (13,3,'Hall','Chase','M',91,'Other','Ap #257-9792 Faucibus Ave','DL',17)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (14,4,'Dylan','Barry','M',41,'Black','881-7256 Eleifend, Rd.','DL',25)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (15,5,'Eleanor','Avery','M',40,'Asian','4855 Erat. Ave','DL',22)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (16,4,'Jordan','Watkins','M',26,'Other','P.O. Box 519, 5325 Nullam Ave','DL',24)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (17,4,'Kelly','Lowery','F',79,'Other','P.O. Box 886, 4311 Lacus. St.','CT',8)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (18,6,'Gary','Cobb','F',64,'Black','P.O. Box 123, 6318 Aliquet Road','DL',29)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (19,6,'Chelsea','Cannon','F',79,'Other','Ap #372-5252 Metus. St.','CT',17)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (20,2,'Walter','Bender','M',70,'Other','522-836 Sit Rd.','AL',29)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (21,4,'Latifah','Collier','M',65,'Hispanic','9612 Velit. Rd.','DL',18)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (22,5,'Brock','Baird','F',61,'Black','P.O. Box 390, 411 Laoreet Rd.','AL',23)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (23,5,'Kennan','Head','F',52,'Asian','Ap #148-4701 Et, Street','CT',30)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (24,1,'Martin','Heath','F',62,'Asian','717-3517 Adipiscing Street','AL',26)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (25,2,'Cherokee','Bernard','F',31,'Other','P.O. Box 639, 3972 Accumsan Rd.','DL',10)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (26,2,'Raven','James','M',33,'Hispanic','6013 Consequat St.','CT',28)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (27,5,'Mason','Merrill','M',22,'Other','289-9994 Aliquet Rd.','CT',2)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (28,1,'Jael','Cruz','F',44,'Hispanic','598-355 Accumsan Rd.','CT',12)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (29,6,'Orli','Short','F',73,'Hispanic','873-8267 Semper, Street','DL',12)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (30,5,'Troy','Black','M',93,'Hispanic','7759 Phasellus Ave','DL',31)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (31,1,'Ursula','Dunlap','F',59,'White','401-5855 Quam St.','AL',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (32,2,'Nash','Griffith','M',67,'Asian','Ap #446-4510 Sagittis Ave','AL',6)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (33,1,'Hyatt','Guerrero','F',93,'Asian','P.O. Box 495, 4585 Eget Road','CT',1)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (34,5,'Lev','Shaffer','F',38,'Black','Ap #785-1329 Quisque St.','AL',20)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (35,5,'Octavia','Pollard','M',50,'Black','P.O. Box 581, 2722 Dui St.','CT',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (36,2,'Nyssa','Moon','M',33,'Black','P.O. Box 210, 468 Elementum, Ave','CT',29)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (37,2,'Yolanda','Blackburn','F',58,'White','233-8986 Est Av.','AL',18)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (38,3,'Joshua','Boyer','F',80,'Other','3276 Lectus Avenue','CT',24)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (39,5,'Seth','Wolf','M',48,'Other','974-9518 Sed Rd.','AL',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (40,4,'Ferris','Mcleod','F',25,'Black','1444 Pretium Rd.','DL',7)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (41,1,'Murphy','Ware','M',67,'Hispanic','7890 Vulputate Ave','AL',12)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (42,4,'Grady','Duffy','M',44,'Hispanic','P.O. Box 523, 598 Integer St.','AL',10)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (43,1,'Ramona','Lang','F',62,'Hispanic','133-7584 Nec Rd.','AL',20)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (44,4,'Martin','Mccoy','M',94,'White','616-8074 Nulla Rd.','DL',22)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (45,6,'Lacy','Pitts','F',20,'Other','P.O. Box 998, 1167 Nam Road','CT',9)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (46,6,'Rachel','Solis','F',67,'Black','224-1449 Ipsum. Rd.','DL',36)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (47,2,'Lois','Tran','F',85,'Other','P.O. Box 817, 2969 Sed Av.','AL',11)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (48,5,'Katelyn','Frank','M',94,'Black','7735 Duis Street','DL',3)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (49,3,'Clark','Walker','F',73,'Other','2395 Nibh. Avenue','DL',21)
INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (50,2,'Griffith','Oconnor','F',18,'Black','P.O. Box 396, 5701 Ridiculus Road','AL',31)





INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (1,17,6,5,'M120',306,28,7,'2001-12-09')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (2,17,20,4,'F111',429,77,229,'2008-07-11')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (3,36,1,2,'F155',165,233,59,'2000-11-06')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (4,45,4,2,'F132',486,204,241,'2005-09-22')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (5,40,10,6,'F122',92,30,211,'2001-03-13')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (6,39,9,1,'F133',256,93,19,'2005-07-17')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (7,29,12,3,'F122',223,159,46,'2004-04-24')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (8,36,9,4,'M175',200,245,109,'2007-11-19')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (9,28,10,3,'M175',421,199,94,'2004-05-20')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (10,35,16,4,'F155',299,70,122,'2007-08-28')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (11,27,15,3,'F155',88,114,230,'2014-01-24')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (12,16,6,4,'F155',280,43,68,'2012-02-23')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (13,6,2,5,'F155',152,41,121,'2001-07-05')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (14,28,19,1,'M175',304,69,45,'2007-09-20')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (15,28,9,6,'F155',133,57,15,'2009-02-11')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (16,23,5,6,'F155',468,184,149,'2014-10-07')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (17,5,2,5,'F155',27,130,213,'2003-04-18')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (18,2,14,4,'F154',452,219,88,'2013-11-16')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (19,43,3,1,'M144',464,29,208,'2005-05-27')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (20,25,5,6,'M144',106,216,146,'2003-03-09')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (21,19,3,4,'M185',442,211,18,'2013-02-07')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (22,20,14,3,'F155',313,54,48,'2006-03-13')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (23,31,12,5,'M142',311,226,99,'2006-11-20')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (24,3,18,6,'F175',399,32,0,'2007-02-26')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (25,43,13,1,'M195',129,97,105,'2004-03-19')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (26,46,15,5,'F166',271,114,85,'2012-05-01')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (27,41,19,3,'M155',437,82,124,'2012-06-15')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (28,33,8,1,'F152',239,249,21,'2004-08-23')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (29,26,15,5,'F142',479,65,33,'2009-06-24')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (30,18,16,6,'M144',410,25,65,'2007-02-06')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (31,11,19,2,'M109',433,92,122,'2006-04-25')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (32,45,4,1,'F188',422,208,6,'2000-05-30')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (33,18,20,3,'F166',160,249,102,'2001-10-24')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (34,45,12,4,'M199',101,195,167,'2002-01-28')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (35,44,17,2,'F155',229,38,19,'2006-06-25')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (36,9,11,5,'M132',152,107,9,'2013-02-08')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (37,14,5,1,'F133',188,201,148,'2004-03-31')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (38,17,18,2,'M165',144,223,0,'2001-10-26')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (39,21,12,2,'F166',107,89,1,'2003-07-22')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (40,15,1,2,'M155',354,104,214,'2003-05-13')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (41,48,14,3,'M165',60,101,241,'2005-11-12')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (42,4,11,6,'F185',33,55,196,'2006-07-17')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (43,43,17,6,'M177',39,186,2,'2010-09-28')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (44,14,11,1,'F164',477,108,113,'2012-09-17')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (45,40,8,2,'F122',153,235,43,'2014-06-19')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (46,17,11,6,'F101',243,39,150,'2001-12-02')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (47,34,3,1,'F176',270,146,135,'2006-08-22')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (48,10,18,1,'M133',364,68,240,'2005-05-22')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (49,25,13,4,'M123',269,250,55,'2001-01-05')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (50,27,11,4,'M123',112,58,30,'2008-03-30')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (51,24,14,5,'M177',130,48,111,'2008-12-23')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (52,50,15,4,'M156',211,195,132,'2001-01-25')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (53,47,2,3,'F175',198,107,17,'2005-08-06')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (54,11,7,5,'F164',60,56,213,'2006-09-07')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (55,21,7,2,'M195',318,176,145,'2004-11-21')

INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (56,4,11,6,'M165',186,36,158,'2001-03-17')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (57,50,4,6,'M155',190,50,47,'2014-08-17')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (58,14,5,1,'M132',169,25,194,'2004-11-23')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (59,24,10,4,'F197',294,117,205,'2003-05-13')
INSERT INTO claims (claimID,memberID,providerID,planID,procedureCode,cost,coPayCost,insurancePay,date) VALUES (60,12,18,5,'F154',308,51,158,'2010-04-26')


INSERT INTO visits (memberID,locationID) VALUES (17,4)
INSERT INTO visits (memberID,locationID) VALUES (17,5)
INSERT INTO visits (memberID,locationID) VALUES (36,2)
INSERT INTO visits (memberID,locationID) VALUES (45,3)
INSERT INTO visits (memberID,locationID) VALUES (40,4)
INSERT INTO visits (memberID,locationID) VALUES (39,4)
INSERT INTO visits (memberID,locationID) VALUES (29,5)
INSERT INTO visits (memberID,locationID) VALUES (36,4)
INSERT INTO visits (memberID,locationID) VALUES (28,4)
INSERT INTO visits (memberID,locationID) VALUES (35,3)

INSERT INTO visits (memberID,locationID) VALUES (4,5)
INSERT INTO visits (memberID,locationID) VALUES (50,3)
INSERT INTO visits (memberID,locationID) VALUES (14,4)
INSERT INTO visits (memberID,locationID) VALUES (24,4)
INSERT INTO visits (memberID,locationID) VALUES (12,6)
INSERT INTO visits (memberID,locationID) VALUES (27,2)
INSERT INTO visits (memberID,locationID) VALUES (16,4)
INSERT INTO visits (memberID,locationID) VALUES (6,2)
INSERT INTO visits (memberID,locationID) VALUES (28,1)
INSERT INTO visits (memberID,locationID) VALUES (25,4)

INSERT INTO visits (memberID,locationID) VALUES (23,4)
INSERT INTO visits (memberID,locationID) VALUES (5,2)
INSERT INTO visits (memberID,locationID) VALUES (2,5)
INSERT INTO visits (memberID,locationID) VALUES (43,4)
INSERT INTO visits (memberID,locationID) VALUES (27,4)
INSERT INTO visits (memberID,locationID) VALUES (19,4)
INSERT INTO visits (memberID,locationID) VALUES (20,5)
INSERT INTO visits (memberID,locationID) VALUES (31,5)
INSERT INTO visits (memberID,locationID) VALUES (3,6)
INSERT INTO visits (memberID,locationID) VALUES (43,2)

INSERT INTO visits (memberID,locationID) VALUES (46,2)
INSERT INTO visits (memberID,locationID) VALUES (41,1)
INSERT INTO visits (memberID,locationID) VALUES (33,1)
INSERT INTO visits (memberID,locationID) VALUES (26,2)
INSERT INTO visits (memberID,locationID) VALUES (18,3)
INSERT INTO visits (memberID,locationID) VALUES (11,1)
INSERT INTO visits (memberID,locationID) VALUES (43,3)
INSERT INTO visits (memberID,locationID) VALUES (18,5)
INSERT INTO visits (memberID,locationID) VALUES (45,5)
INSERT INTO visits (memberID,locationID) VALUES (44,2)

INSERT INTO visits (memberID,locationID) VALUES (9,5)
INSERT INTO visits (memberID,locationID) VALUES (13,4)
INSERT INTO visits (memberID,locationID) VALUES (17,6)
INSERT INTO visits (memberID,locationID) VALUES (21,5)
INSERT INTO visits (memberID,locationID) VALUES (15,2)
INSERT INTO visits (memberID,locationID) VALUES (48,5)
INSERT INTO visits (memberID,locationID) VALUES (5,5)
INSERT INTO visits (memberID,locationID) VALUES (42,2)
INSERT INTO visits (memberID,locationID) VALUES (14,5)
INSERT INTO visits (memberID,locationID) VALUES (40,1)


INSERT INTO visits (memberID,locationID) VALUES (21,4)
INSERT INTO visits (memberID,locationID) VALUES (34,4)
INSERT INTO visits (memberID,locationID) VALUES (10,6)
INSERT INTO visits (memberID,locationID) VALUES (25,2)
INSERT INTO visits (memberID,locationID) VALUES (27,5)
INSERT INTO visits (memberID,locationID) VALUES (24,5)
INSERT INTO visits (memberID,locationID) VALUES (50,2)
INSERT INTO visits (memberID,locationID) VALUES (47,2)
INSERT INTO visits (memberID,locationID) VALUES (11,2)
INSERT INTO visits (memberID,locationID) VALUES (21,2)


INSERT INTO worksAt (providerID,locationID) VALUES (1,2)
INSERT INTO worksAt (providerID,locationID) VALUES (2,2)
INSERT INTO worksAt (providerID,locationID) VALUES (3,4)
INSERT INTO worksAt (providerID,locationID) VALUES (4,3)
INSERT INTO worksAt (providerID,locationID) VALUES (5,4)
INSERT INTO worksAt (providerID,locationID) VALUES (6,4)
INSERT INTO worksAt (providerID,locationID) VALUES (7,2)
INSERT INTO worksAt (providerID,locationID) VALUES (8,1)
INSERT INTO worksAt (providerID,locationID) VALUES (9,4)
INSERT INTO worksAt (providerID,locationID) VALUES (10,4)
INSERT INTO worksAt (providerID,locationID) VALUES (11,5)
INSERT INTO worksAt (providerID,locationID) VALUES (12,5)
INSERT INTO worksAt (providerID,locationID) VALUES (13,2)
INSERT INTO worksAt (providerID,locationID) VALUES (14,5)
INSERT INTO worksAt (providerID,locationID) VALUES (15,2)
INSERT INTO worksAt (providerID,locationID) VALUES (16,3)
INSERT INTO worksAt (providerID,locationID) VALUES (17,2)
INSERT INTO worksAt (providerID,locationID) VALUES (18,6)
INSERT INTO worksAt (providerID,locationID) VALUES (19,1)
INSERT INTO worksAt (providerID,locationID) VALUES (20,5)

INSERT INTO participateIn( \
SELECT memberID, planID, membershipTenure \
from members)

INSERT INTO submits( \
SELECT memberID, claimID \
from claims)

INSERT INTO services( \
SELECT distinct providerID, memberID \
from claims)

INSERT INTO belongsTo( \
SELECT memberID, state \
from members)

INSERT INTO has( \
SELECT memberID, date \
from claims)








