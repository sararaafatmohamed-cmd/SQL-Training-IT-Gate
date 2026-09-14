Create Database Companys
use Companys 

Create table Employee(
EmployeeID int primary key identity (2,2),
Fristname varchar (5),
Lastname varchar (7),
Birthday Date
)
Create table Department(
DepartmentID int Primary key identity (1,1),
Name Varchar (100)not null,
Description Text,
E_ID int 
)
create table Project(
ProjectID int primary key identity (4,3),
ProjectName Varchar (10),
StartDate Date,
endDate Date,
D_ID int
)
Alter table Department
Add foreign key (E_ID) 
references Employee (EmployeeID);

Alter table Employee
ADD P_ID INT;
Alter table Employee 
Add foreign key (P_ID) 
references Project (ProjectID);

Select D_ID 
From Project 
Where D_ID Not in(Select DepartmentID From Department);
Alter table project 
Add foreign key (D_ID)
references Department (DepartmentID);

INSERT INTO Employee (Fristname, Lastname, Birthday)
VALUES
('hamdy', 'galal', '2002-07-10'),
('hazem', 'omar', '2003-05-11'),
('aya', 'ali', '2003-03-16'),
('akram', 'mohamed', '2005-01-23');

INSERT INTO Department (Name, Description, E_ID)
VALUES
('IT', 'Information Technology', 2),
('HR', 'Human Resources', 4);

ALTER TABLE Project
ADD E_ID INT;

ALTER TABLE Project
ADD FOREIGN KEY (E_ID)
REFERENCES Employee(EmployeeID);


INSERT INTO Project (ProjectName, StartDate, EndDate, E_ID, D_ID)
VALUES
('website', '2025-07-01', '2025-09-01', 2, 1);

---cross join 
use Companys
select PR.startDate ,E.Birthday from Project PR cross join Employee E where PR.E_ID=E.EmployeeID
select PR.startDate,E.Birthday from Project PR , Employee E where PR.E_ID=E.EmployeeID

---Inner join 
 use Companys
 select PR.startDate , E.Birthday from Project PR inner join Employee E  on PR.E_ID=E.EmployeeID
 select PR.startDate, E.Birthday from Project PR , Employee E where PR.E_ID=E.EmployeeID
 
 
 ---Left join 
use Companys
 select PR.startDate , E.Birthday from Project PR left outer join Employee E  on PR.E_ID=E.EmployeeID

 ---Right join
 use Companys
 select PR.startDate , E.Birthday from Project PR Right outer join Employee E  on PR.E_ID=E.EmployeeID