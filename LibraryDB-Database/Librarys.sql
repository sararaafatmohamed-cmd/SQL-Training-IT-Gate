create database Librarys
use Librarys
create table Anthors(
A_ID int primary key identity (1,1),
A_Name varchar (50)
)
create table Books(
B_ID int primary key identity (1,1),
Title varchar (30),
B_Year date,
A_ID int references Anthors (A_ID)
)
create table Readers(
R_ID int primary key identity (1,1),
R_Name varchar (20),
R_Email varchar (20)
)
create table Borrowings(
BID int primary key identity (1,1),
B_date date,
B_ReturnTime date,
B_ID int references Books (B_ID),
R_ID int references Readers (R_ID)
)
use Librarys
insert into Anthors (A_Name)
values ('Ahmed')
insert into Anthors (A_Name)
values ('Mohamed')
insert into Anthors (A_Name)
values ('Kamal')
insert into Anthors (A_Name)
values ('Amr')