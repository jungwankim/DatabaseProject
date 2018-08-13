
connect to cs421

create table plans ( \
planID int not null, \
type varchar(15), \
memberFee int, \
numberOfMembers int, \
planProfitability int, \
primary key (planID))

-- updated provider --

create table provider ( \
providerID int not null, \
firstName varchar(20), \
lastName varchar(20), \
specialty varchar(20), \
experience int, \
averageMemberCost float, \
primary key (providerID), \
constraint maxID check (providerID <= 19))

create table dentalOffice ( \
locationID int not null, \
address varchar(32), \
state varchar(5), \
totalAverageMemberCost float, \
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

-- updated members --

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
foreign key (planID) references plans, \
constraint agegen check (age >= 40 OR gender = 'F'))

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


INSERT INTO members (memberID,planID,firstName,lastName,gender,age,race,address,state,membershipTenure) VALUES (16,4,'Jordan','Watkins','M',26,'Other','P.O. Box 519, 5325 Nullam Ave','DL',24)


