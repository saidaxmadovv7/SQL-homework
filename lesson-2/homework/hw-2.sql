----Homework---
--For Github 

delete Employee  


create table employye (EmpID  int,NameEmployee varchar(50),salary decimal(10,2))
select *from employye

insert into employye values(1,'Bellingham',150)
insert into employye values(2,'Mbappe',100)
insert into employye values(3,'Vinicius',120)

  update employye
  set salary=700
  where EmpID=1



 delete from employye
 where EmpID=2
 ------------------------------------------------------------------------------------------------------------------------------------------------
 -------------
 ----delete--faqat berilgan qatorni ochiradi
 -----truncate---tableni malumotlarini ochiradi
 -----drop---tableni malumot bilan birga ochiradi


 alter table employye
alter column NameEmployee  VARCHAR(100);

 alter table employye
 add Department varchar(50)



 alter table employye
alter column salary FLOAT;

drop table Departments

create table Departments (DepartmentID int primary key,DepartmentName varchar(50))
insert into Departments values(1,'Salah'),(2,'Mcallister'),(3,'Henderson')

select *from Departments
----------------------------------------------------------------------------------------------------------------------------------------
truncate table employye

Update Employees
set  Department = 'Management'
where  Salary > 5000





--11task--
delete from employye





 alter table employye
 drop column Department
 ----15task---
 exec sp_rename 'employye','StuffMember'

 drop table Department

 --------------------------------------------------------------------------------------------------------------------

 create table Products(ProductID int primary key,ProductName varchar(50),Category varchar(50),Price decimal(10,2) check(Price>0))
 select *from Products
 insert into Products values(1,'Cola','FizzyDrinks',14000)
  insert into Products values(2,'Milkyway','Chocolate',18000)
   insert into Products values(3,'Butter','Milky',44000)
    insert into Products values(4,'IceCream','Milky',10000)
	 insert into Products values(5,'Hydroliife','Water',12000)


	  alter table Products
 add StockQuantity varchar(50)
----- 
 alter table Products
add constraint Price default 50 for Price

------------
exec sp_rename 'Products.Category','productCategory','Column'
---new---


select * into Products_Backup from Products


exec sp_rename 'Products','Inventory'

select *from Inventory


alter table Inventory
add ProductCode int Identity(1000,5)

