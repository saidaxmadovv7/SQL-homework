-------
-----
----

CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');




select distinct s1.customername
from #sales s1
where exists (
    select 1
    from #sales s2
    where s1.customername = s2.customername
      and month(s2.saledate) = 3
      and year(s2.saledate) = 2024
)



select product
from #sales
group by product
having sum(quantity * price) = (
    select max(totalrev)
    from (
        select sum(quantity * price) as totalrev
        from #sales
        group by product
    ) as A
)




select max(saleamount) as second_highest
from (
    select distinct quantity * price as saleamount
    from #sales
) t
where saleamount < (
    select max(quantity * price)
    from #sales
)




select year(saledate) as y, month(saledate) as m,
       (select sum(quantity) from #sales s2
        where month(s2.saledate) = month(s1.saledate)
          and year(s2.saledate) = year(s1.saledate)) as total_qty
from #sales s1
group by year(saledate), month(saledate)




select distinct s1.customername
from #sales s1
where exists (
    select 1
    from #sales s2
    where s1.product = s2.product
      and s1.customername <> s2.customername
)



create table Fruits_6(Name varchar(50), Fruit varchar(50))
insert into Fruits_6 values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')



select name,
       sum(case when fruit = 'Apple' then 1 else 0 end) as apple,
       sum(case when fruit = 'Orange' then 1 else 0 end) as orange,
       sum(case when fruit = 'Banana' then 1 else 0 end) as banana
from fruits_6
group by name


create table Family_6(ParentId int, ChildID int)
insert into Family_6 values (1, 2), (2, 3), (3, 4)

go
with recursive cte as (
    select parentid, childid
    from family_6
    union all
    select f.parentid, c.childid
    from family_6 as f
    join cte as c on f.childid = c.parentid
)
select * from cte



CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);




select o.*
from #orders o
where o.deliverystate = 'TX'
  and exists (
      select 1
      from #orders o2
      where o2.customerid = o.customerid
        and o2.deliverystate = 'CA'
  )



  create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')


update #residents
set fullname = substring(address, charindex('name=', address) + 5,
              charindex(' ', address + ' ', charindex('name=', address)) - (charindex('name=', address) + 5))
where fullname is null or fullname = ''
select *from #residents




CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);



go
with recursive paths as (
    select departurecity, arrivalcity, cost,
           cast(departurecity + ' - ' + arrivalcity as varchar(200)) as route
    from #routes
    where departurecity = 'Tashkent'
    union all
    select p.departurecity, r.arrivalcity, p.cost + r.cost,
           cast(p.route + ' - ' + r.arrivalcity as varchar(200))
    from paths p
    join #routes r on p.arrivalcity = r.departurecity
)
select route, cost
from paths
where arrivalcity = 'Khorezm'
order by cost




CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')




select id, vals,
       row_number() over(order by id) as rank_num
from #rankingpuzzle


CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);




select e.*
from #employeesales e
where e.salesamount > (
    select avg(s.salesamount)
    from #employeesales s
    where s.department = e.department
      and s.salesmonth = e.salesmonth
      and s.salesyear = e.salesyear
)




select e.*
from #employeesales e
where exists (
    select 1
    from #employeesales s
    where s.salesmonth = e.salesmonth
      and s.salesyear = e.salesyear
    group by s.salesmonth, s.salesyear
    having max(s.salesamount) = e.salesamount
)




CREATE TABLE Proroducts (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Proroducts (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);


select distinct e.employeeid, e.employeename
from #employeesales e
where not exists (
    select distinct salesmonth
    from #employeesales
    where salesyear = 2024
    except
    select salesmonth
    from #employeesales s
    where s.employeeid = e.employeeid
      and s.salesyear = 2024
)



select name
from Proroducts
where price > (select avg(price) from proroducts)



select name
from proroducts
where stock < (select max(stock) from proroducts)


select name
from proroducts
where category = (select category from proroducts where name = 'Laptop')



select name
from proroducts
where price > (
    select min(price) from proroducts where category = 'Electronics'
)



select p.name
from proroducts p
where p.price > (
    select avg(price)
    from proroducts
    where category = p.category
)



CREATE TABLE Orders_6 (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders_6 (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

select distinct p.name
from proroducts p
join Orders_6 o on p.productid = o.productid


select p.name
from proroducts p
join orders o on p.productid = o.productid
group by p.name
having sum(o.quantity) > (
    select avg(totalq)
    from (
        select sum(quantity) as totalq
        from Orders_6
        group by productid
    )as A
)


select p.name
from proroducts p
where not exists (
    select 1 from Orders_6 o where o.productid = p.productid
)


select top 1 p.name
from proroducts p
join Orders_6 o on p.productid = o.productid
group by p.name
order by sum(o.quantity) desc
