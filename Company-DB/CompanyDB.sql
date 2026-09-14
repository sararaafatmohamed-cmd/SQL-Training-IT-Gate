create database CompanyDB
use CompanyDB
create table Departments(
DNumber int primary key,
DName varchar (100),
Bdate date,
M_ID int
)
create table Employees(
SSN int primary key,
Fname varchar (50),
Lname varchar (50),
Address varchar (200) ,
Salary money ,
Sex char(1),
Bdate date,
D_ID int references Departments(DNumber),
M_ID int
)
create table Dept_Locations(
D_number int references Departments(DNumber),
Location varchar (200)
)
create table Projects(
PNumber int primary key ,
PName varchar (100),
Location varchar (200),
Dept_ID int references Departments(DNumber),
ESSN int references Employees(SSN)
)
create table Dependents(
DName varchar(40) primary key ,
E_SSN int references Employees (SSN),
Sex char (1),
BDate date,
Relationship varchar (200)
)
create table Works_on(
E_ID int references Employees(SSN),
P_Num int references Projects(PNumber),
Hours int
) 
ALTER TABLE Departments
ADD FOREIGN key (M_ID)
references Employees(SSN)
ALTER TABLE Employees
ADD FOREIGN key(M_ID)
references Employees(SSN)
ALTER TABLE Dependents
ADD Salary money 
ALTER TABLE Dependents
DROP COLUMN BDate
ALTER TABLE Dependents
ALTER COLUMN Relationship varchar(100)
Exec sp_rename 'Dependents.Sex','Gender','COLUMN'

insert into Departments(DNumber,DName,Bdate) values(1,'H&M','2000-12-09')
insert into Departments(DNumber,DName,Bdate) values(2,'Sales','2005-02-05')
insert into Departments(DNumber,DName,Bdate) values(3,'IT','2025-10-12')
insert into Departments(DNumber,DName,Bdate) values(4,'Markting','2024-07-01')

insert into Employees values(1,'Ahmed','Ali','Alex',2000,'M','2005-11-06',1,1)
insert into Employees values(2,'Sara','Raafat','Berlin',25000,'F','2004-04-09',2,2)
insert into Employees values(3,'Amr','Mohamed','London',20000,'M','2001-10-11',3,3)
insert into Employees values(4,'ali','mazen','Cairo',15000,'M','2003-06-12',4,4)
insert into Employees values(5,'Aya','Ahmed','México',5000,'F','2006-07-20',NULL,NULL)

insert into Projects values(1,'Pro1','Alex',1,1)
insert into Projects values(2,'Pro22','Cairo',null,2)
insert into Projects values(3,'Pro103','London',2,null)
insert into Projects values(4,'Pro112','México',3,4)

insert into Dependents values('Mariam',1,'F','2011-09-08',2000)
insert into Dependents values('Sally',2,'F','2010-03-21',2500)
insert into Dependents values('Osama',3,'M','2009-05-11',3500)
insert into Dependents values('Mark',4,'M','2010-12-03',4000)

insert into Works_on values(1,1,2)
insert into Works_on values(2,1,3)
insert into Works_on values(4,3,10)
insert into Works_on values(3,2,7)
insert into Works_on values(null,4,11)

insert into Dept_Locations values(1,'Cairo')
insert into Dept_Locations values(2,'London')
insert into Dept_Locations values(null,'Alex')
insert into Dept_Locations values(3,'Berlin')

select EM.Fname, DP.DName from Employees EM cross join Departments DP;
select EM.Fname, DN.DName from Employees EM cross JOIN Dependents DN;

SELECT EM.Fname, P.PName from Employees EM inner join Projects P on EM.SSN =P.ESSN;
select EM.Fname, DN.DName from Employees EM INNER JOIN Dependents DN ON EM.SSN= DN.E_SSN;

select EM.SSN, P.PName from Employees EM LEFT OUTER join Projects P on  EM.SSN=P.ESSN;
select EM.SSN, P.PName from Employees EM RIGHT OUTER join Projects P on  EM.SSN=P.ESSN;
SELECT DP.DNumber ,EM.Fname from Departments DP left outer join Employees EM ON DP.DNumber=EM.D_ID;
SELECT DP.DNumber ,EM.Fname from Departments DP right outer join Employees EM ON DP.DNumber=EM.D_ID;

Select E1.Fname as Employee, E2.Fname as Manager from Employees E1 
left join Employees E2 ON E1.SSN= E2.M_ID;