create database Cinema_system
use Cinema_system
create table Movies(
MovieID int primary key,
MTitle varchar(50),
MType varchar(100),
MDuractionminutes time
)
create table Customers(
CID int primary key,
CName varchar(20),
CEmail varchar(100),
CAge int 
)
create table Tickets(
TicketID int primary key identity(1,1),
M_ID int references Movies(MovieID),
C_ID int references Customers(CID),
TPrice money,
TPurchasedate date
)
insert into Movies values(1,'traintobusan','horror','2:00:00');
insert into Movies values(2,'KpopDemonHunters','action','1:35:00');
insert into Movies values(3,'midnight','thriller','1:43:00');
insert into Movies values(4,'forgotten','mystery','1:49:00');
insert into Movies values(5,'parasite','darkcomedy','2:12:00');

insert into Customers values(1,'aya','aya@gmial.com',20);
insert into Customers values(2,'sara','sara@gmial.com',21);
insert into Customers values(3,'ali','ali@gmial.com',24);
insert into Customers values(4,'mark','mark@gmial.com',30);
insert into Customers values(5,'mariam','mariam@gmial.com',32);

insert into Tickets values(1,1,280,'2025-04-09');
insert into Tickets values(2,2,150,'2025-04-10');
insert into Tickets values(3,null,400,'2025-05-10');
insert into Tickets values(null,3,500,'2024-09-11');
insert into Tickets values(4,4,100,'2023-11-30');
insert into Tickets values(null,null,175,'2022-02-03');

select MIN(TPrice)from Tickets where TPrice>200;
select MAX(TPrice)from Tickets where TPrice>100;
select SUM(TPrice) from Tickets where TPrice<1000;
select AVG(TPrice) from Tickets;
SELECT COUNT(*)FROM Movies;
select*from Customers
where CName like 'A%';
select CName,CAge FROM Customers 
ORDER BY CAge ASC;
select CName,CAge FROM Customers 
ORDER BY CAge DESC;
select CName as[Customer name]
from Customers;
SELECT M_ID, SUM(TPrice) AS TotalSales
FROM Tickets
GROUP BY M_ID;
SELECT C_ID, COUNT(*) AS TicketsBought
FROM Tickets
GROUP BY C_ID;

SELECT CM.CAge,TK.TPurchasedate  FROM Customers CM, Tickets TK;
select TK.TPrice,M.MTitle from Tickets TK cross join Movies M;


SELECT TK.TPurchasedate , M.MTitle from Tickets TK,Movies M Where TK.M_ID=M.MovieID;
select CM.CName,T.TPrice from Customers CM INNER JOIN Tickets T ON  T.C_ID=CM.CID;

SELECT TK.TPurchasedate , M.MTitle from Tickets TK left outer join Movies M ON TK.M_ID=M.MovieID;
SELECT TK.TPurchasedate , M.MTitle from Tickets TK RIGHT outer join Movies M ON TK.M_ID=M.MovieID;