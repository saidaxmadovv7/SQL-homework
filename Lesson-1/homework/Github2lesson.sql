----Homework---


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

 -------------
 ----delete--faqat berilgan qatorni ochiradi
 -----truncate---tableni malumotlarini ochiradi
 -----drop---tableni malumot bilan birga ochiradi


 ALTER TABLE employye
ALTER COLUMN NameEmployee  VARCHAR(100);

 alter table employye
 add Department varchar(50)



 ALTER TABLE employye
ALTER COLUMN salary FLOAT;

drop table Departments

create table Departments (DepartmentID int primary key,DepartmentName varchar(50))
insert into Departments values(1,'Salah'),(2,'Mcallister'),(3,'Henderson')

select *from Departments

truncate table employye

UPDATE employye
SET EmpID = 'Management'
WHERE Salary > 5000;



