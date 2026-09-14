create database ShopDB
use ShopDB
create table Customer(
Cid int primary key,
Cfname varchar(30),
Clname varchar(30),
Cadd varchar(20),
Cphone varchar(14));

create table Product(
Pid int primary key,
Pname varchar(30),
Pprice int);

create table Cust_Pro(
Cid int foreign key references Customer(Cid),
Pid int foreign key references Product(Pid),
primary key (Cid,Pid),
Quantity int );

insert into Customer values(1,'ahmed','fahmy','Maadi','01011412655');
insert into Customer values(23,'hany','hamdy','Maadi','01211413350');
insert into Customer values(13,'sarah','sami','Nasr city','01211410000');
insert into Customer values(40,'mariam','salah','Rehab','01120205625');
insert into Customer values(51,'rasha','hassan','','01031312222');

insert into Product values(10,'Mobile',2000);
insert into Product values(20,'TV',16500);
insert into Product values(30,'LCD',31200);

insert into Cust_Pro values(1,20,2);
insert into Cust_Pro values(13,10,1);
insert into Cust_Pro values(13,30,1);
insert into Cust_Pro values(13,20,1);

select * from Customer

select Cid,Cfname,Clname,Cadd,Cphone from Customer

select Cfname,Clname,Cadd from Customer

select Cid,Cfname from Customer 

select Cid as "CustomerID",Cfname as "Customer name" 
from Customer

select * from Product

select Pid,Pname,Pprice from Product 

select * from Product 
order by Pprice ASC 

select * from Product
order by Pprice DESC

select* from Product 
where Pprice>=20000

select * from Customer 
where Cadd='Maadi'

select Cadd from Customer

select distinct Cadd from Customer

select Cfname,Cphone 
from Customer 
where Cphone like'010%'

select * from Customer
where Cadd like 'n%city'

select * from Customer 
where Cadd='Maadi'and Cphone like'012%'

select * from Customer 
where Cid=1 or Cid=40

select * from Product 
where Pname='Mobile' or Pname='tv'

select Pname ,Pprice from Product 
where Pprice between 15000 and 25000

select * from Product 
where Pprice between 10000 and 40000

select Cid,Cfname,Cadd from Customer
where Cadd <> 'Maadi'

select Cid,Cfname,Cadd from Customer
where not Cadd='Maadi'

select count(*) as Customer_Number,Cadd
from Customer group by Cadd

select Cfname,Pname,Quantity
from Customer,Product,Cust_Pro 
where Customer.Cid=CUst_Pro.Cid
and Product.Pid=Cust_Pro.Pid