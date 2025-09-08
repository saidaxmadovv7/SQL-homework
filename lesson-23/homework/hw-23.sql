----------
-------
------


CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');


select 
    id,
    dt,
    right('0' + cast(month(dt) as varchar(2)), 2) as monthprefixedwithzero
from dates



CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);




select 
    count(distinct id) as distinct_id,
    rid,
    sum(maxvals) as totalofmaxvals
from (
    select 
        id,
        rid,
        max(vals) as maxvals
    from mytabel
    group by id, rid
) as A
group by rid




CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');



select 
    id,
    vals
from testfixlengths
where len(isnull(vals, '')) between 6 and 10





CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);





select 
    t.id,
    t.item,
    t.vals
from testmaximum t
 join (
    select id, max(vals) as maxvals
    from testmaximum
    group by id
) as A on t.id = A.id and t.vals = A.maxvals






CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);






select 
    id,
    sum(maxvals) as sumofmax
from (
    select    id,   detailednumber,
        max(vals) as maxvals
    from sumofmax
    group by id, detailednumber
) as A
group by id





CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);






select  id, a,   b,
    nullif(a - b, 0) as output
from thezeropuzzle




CREATE TABLE Sales_8 (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Sales_8 (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);



select *from Sales_8




select sum(quantitysold * unitprice) as total_rev
from Sales_8




select avg(unitprice) as avg_unit_price
from Sales_8





select count(*) as total_transactions
from Sales_8





select max(quantitysold) as high_units_sold
from Sales_8



select category, sum(quantitysold) as total_sold
from Sales_8
group by category



select top 1 product, sum(quantitysold * unitprice) as total_revenue
from Sales_8
group by product
order by total_revenue desc




select 
    saledate,
    sum(quantitysold * unitprice) as daily_revenue,
    sum(sum(quantitysold * unitprice)) over(order by saledate) as running_total
from Sales_8
group by saledate
order by saledate





select 
    category,
    sum(quantitysold * unitprice) as category_rev,
    cast(sum(quantitysold * unitprice) * 100.0 / sum(sum(quantitysold * unitprice)) over() as decimal(10,2)) as per_contr
from Sales_8
group by category






CREATE TABLE Customers_8 (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);

INSERT INTO Customers_8 (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');





select 
    s.saleid,
    s.product,
    s.category,
    s.quantitysold,
    s.unitprice,
    s.saledate,
    s.region,
    c.customername
from Sales_8  as s
join Customers_8 as c on s.customerid = c.customerid





select *from customers  as c
where not exists (
    select 1 
    from Sales_8 as  s
    where s.customerid = c.customerid
)





select 
    c.customername,
    sum(s.quantitysold * s.unitprice) as total_revenue
from Customers_8 as  c
join Sales_8 as  s on c.customerid = s.customerid
group by c.customername





select top 1 
    c.customername,
    sum(s.quantitysold * s.unitprice) as total_rev
from Customers_8 as  c
join Sales_8 as  s on c.customerid = s.customerid
group by c.customername
order by total_rev desc



select 
    c.customername,
    count(s.saleid) as total_sales
from Customers_8 as  c
left join Sales_8 as  s on c.customerid = s.customerid
group by c.customername




CREATE TABLE Products_8 (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products_8 (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);





select distinct p.productname
from Products_8 as  p
join Sales_8 as  s on p.productname = s.product



select top 1 *from Products_8
order by sellingprice desc






select *from Products_8 as  p
where sellingprice > (
    select avg(sellingprice) 
    from Products_8 
    where category = p.category)



