create database LibraryDB
use LibraryDB
create table Authors(
AuthorID int primary key identity(1,1),
Aname varchar(50)
)
create table Books(
BookID int primary key,
Title varchar(50),
A_ID int references Authors(AuthorID),
Year date
)
create table Readers(
ReaderID int primary key,
RName varchar(20),
Email varchar(50)
)
create table Borrowing(
BorrowID int primary key identity(1,1),
B_ID int references Books(BookID),
R_ID int references Readers(ReaderID),
BorrowDate date,
Returntime time
)
insert into Authors values('sara')
insert into Authors values('Ali')
insert into Authors values('Ahmad')
insert into Authors values('amr')
insert into Authors values('han')

insert into Books values(1,'AliceinBorderland',1,'2004-04-09');
insert into Books values(2,'SQUADGAME',1,'2000-05-22');
insert into Books values(3,'NINEPUZELS',1,'2003-05-03');
insert into Books values(4,'MOUSE',1,'2009-07-12');
insert into Books values(5,'flowerofevil',null,'2020-02-15');

insert into Readers values(1,'mariam','mariam@gimal.com')
insert into Readers values(2,'mark','maek@gimal.com')
insert into Readers values(3,'johnny','johnny@gimal.com')
insert into Readers values(4,'peter','peter@gimal.com')
insert into Readers values(5,'aya','aya@gimal.com')
insert into Readers values(6,'hajun','hajun@gimal.com')

insert into Borrowing(B_ID,R_ID,BorrowDate,Returntime) values(1,1,'2019-03-06','1:00:00')
insert into Borrowing(B_ID,R_ID,BorrowDate,Returntime) values(2,null,'2025-04-01','2:30:00')
insert into Borrowing(B_ID,R_ID,BorrowDate,Returntime) values(null,2,'2002-12-21','3:25:00')
insert into Borrowing(B_ID,R_ID,BorrowDate,Returntime) values(null,null,'2022-05-07','4:00:20')
insert into Borrowing(B_ID,R_ID,BorrowDate,Returntime) values(3,3,'1999-11-23','6:50:09')
				
truncate table Borrowing;
delete from Readers where ReaderID=1;
delete from Books;
delete from Authors;

select*from Authors
where Aname LIKE 'A%';
select*from Authors
where Aname like '_A';
select*from Authors
where Aname like '%A';
select*from Readers
where RName like '_A%';
select*from Authors
where Aname like '__A%';
select*from Authors
where Aname like '%A%';
select*from Authors
where Aname like '[A]%';
select*from Authors
where Aname like '[^A]%';
select*from Authors
where Aname like '[S]%';
select Aname AS [Auther Name]
from Authors;
Alter table Books
add BPrice money;
insert into Books(BookID, Title, A_ID, Year, BPrice) values (6, 'voice', 1, '2022-01-01', 2000);
insert into Books(BookID, Title, A_ID, Year, BPrice) values (7, 'mercryfornone', 1, '2001-11-10', 5000);
insert into Books(BookID, Title, A_ID, Year, BPrice) values (8, 'weakheroclass', 1, '2020-01-31', 4000);
insert into Books(BookID, Title, A_ID, Year, BPrice) values (9, 'whenlifegivesyoutangerines', 1, '2024-05-21', 10000);

select MIN(BPrice)from Books where BPrice>2000;
select avg(BPrice)from Books where BPrice>1000;
select sum(BPrice)from Books where BPrice>5000;
select MAX(AuthorID) from Authors where AuthorID>2;

select BR.Returntime,B.Title FROM Borrowing BR, Books B WHERE BR.B_ID= B.BookID;
select BR.Returntime,B.Title FROM Borrowing BR INNER JOIN Books B ON BR.B_ID= B.BookID;

select BR.Returntime,B.Title FROM Borrowing BR cross JOIN Books B;

select BR.Returntime,B.Title FROM Borrowing BR left outer JOIN Books B ON BR.B_ID= B.BookID;
select BR.Returntime,B.Title FROM Borrowing BR right outer JOIN Books B ON BR.B_ID= B.BookID;