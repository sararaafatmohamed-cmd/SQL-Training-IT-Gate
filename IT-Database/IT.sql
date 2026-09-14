create Database IT
use IT 
Create table Department( 
DepartmentID int Primary key ,
DepartmentName Varchar(10) 
)
Create table Employee(
EmployeeID Int Primary key,
EployeeName Varchar(20),
Salary money not null,
HireDate Date,
D_ID int, 
M_ID int
)
Create table Project(
ProjectID int Primary key,
Projectname Varchar (10),
Budget money not null
)
Create table Employee_Project( 
E_ID int,
P_ID int,

HoursWorked Time
)
Create table Evaluation(
EValuationID int Primary key,
E_ID int,
Score Decimal (5,2),
EvaluationDate Date 
)
Alter table Employee
Add foreign key (D_ID)
references Department(DepartmentID);

Alter table Employee 
Add foreign key (M_ID)
references Employee (EmployeeID);

Alter table Employee_Project
Add foreign key (E_ID)
references Employee(EmployeeID);
Alter table Employee_Project
Add foreign key (P_ID)
references Project (ProjectID);

Alter table Evaluation 
Add foreign key (E_ID)
references Employee (EmployeeID);
INSERT INTO Department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');