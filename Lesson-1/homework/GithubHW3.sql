
----Bulk insert can help us to import  wide range of datas easily from a sort of files with Bulk insert you shouldnt  write all informations
---- .txt,.csv,.bcp,.dat





create table products(ProductID int,ProductName varchar(50),Price decimal(10,2))
select *from products
insert into products values (1,'Acer',650)
insert into products values (2,'HP',600)
insert into products values (3,'Lenovo',850)

---- I will explain in Uzbek
--null- bu qiymat yoq degani osha joyi bosh qoladi
--not null-- bu ham null ga oxshaydi lekin bunda bosh joy bolmasligi kerak hardoim qiymat qoshilishi kerak.



alter table products
add constraint UQ_ProductName unique (ProductName)

------bu constraint bilan siz bir hil datalardan dublikatlardan saqlanasiz bu konstraint malumot yagona (bitta) bolishini ta'minlaydi.

alter table products 
add ProductCategory varchar(50)

-------------------------------
create table Category(CategoryID int primary key,CategoryName varchar(50) unique)
select *from Category
  
  -------------Identity --- bu ketma-ketlikni ta'minlaydi masalan 1001 bolsa keyingisini 1002 qilib  beradi.


bulk insert products
from 'C:\Users\User\Desktop\hw.txt'
with
(
    fieldterminator = ',',
    rowterminator = '\n',
    firstrow = 2
)

select *from products

drop table products 

drop table Category

create table Category(CategoryID int primary key,CategoryName varchar(50))
insert into Category values(1,'Mackbook'),(2,'Aspire'),(3,'Vivobook')


create table products(ProductID int,ProductName varchar(50),Price decimal(10,2),CategoryID int foreign key references Category(CategoryID))

insert into products values(1,'Saidamin',1000,3)
insert into products values(2,'Tolib',1200,2)

select *from products


-----primary key--noyob boladi lekin NULLga ruxsat yoq 
-----unique key---noyob boladi farqi bunda 1marta NULLLga ruxsat beradi




ALTER TABLE Products
ADD CONSTRAINT Price  CHECK (Price > 0);




alter table products
add Stock int default 0 not null









drop table products

create table products (ProductID int,ProductName varchar(50))
select *from products
insert into products values (1,'Acer')
insert into products values (2,'HP')
insert into products values (3,'Lenovo')


alter table products
add Price decimal(10,2)


SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products




---------------Foreighn key--bu kalit boshqa jadval bilan aloqa (relationship) o‘rnatadi.masalan primary key yoki unique key.


-----------------------------------
create table custommers(CustomerID int identity (100,10),CustomerName varchar(50),Age int check(Age>=18))
select *from custommers
insert into custommers values('Boltavoy',20)
insert into custommers values('Boltabek',21)
insert into custommers values ('Teshavoy',19)

-----------------------------------

create table orderDetails(OrderID int,ProductID int,Quantity int primary key(OrderID,ProductID))
select *from orderDetails
insert into orderDetails values(1,2,6),(2,3,5),(3,4,8)

------------------------coalasce--bu birinchi NULL bolmagan qiymatni oladi ungacha qidiraveradi shunisi bilan ISNULLDAN farq qiladi.
------------------------isnull--faqat 2marta qidiradi va (misol uchun) agar javob bolmasa null orniga 0 yozib qoyadi.


--------------------------------------------------------------------------------------------------------

create table emplloye(EmpID int primary key,EmpName varchar(50),Email varchar(50) unique)
select *from emplloye

----------------------------------------
create table Customerss   ( CustomerID int primary key, CustomerName VARCHAR(100))





create table  Orders (
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    foreign key (CustomerID) references Customerss(CustomerID)
        on delete cascade 
        on update cascade
)
select *from Orders
