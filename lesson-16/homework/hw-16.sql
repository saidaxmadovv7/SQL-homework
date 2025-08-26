---
--

CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
[String] VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);



with cte as 
		(
	   select 1 as num
		union all
		select num + 1 as num from cte
		where cte.num < 1000
		)
select * from cte
OPTION (MAXRECURSION 1000)


select e.employeeid, e.FirstName, s.total_sales
from employees e
join (
        select employeeid, SUM(SalesAmount) AS total_sales
        from sales
        group by employeeid
     ) as s
on e.employeeid = s.employeeid


go
with cte as
(
select avg(Salary)  as avg_salary from Employees

)
select avg_salary from cte

select *from Products
select *from Sales


select p.ProductID, p.ProductName, A.MaxSales from Products as  p
join (
    select ProductID, MAX(SalesAmount) as MaxSales
    from Sales
    group by ProductID
) A
on p.ProductID = A.ProductID


with cte as (
    select 1 as num
    union all
    select num * 2
    from cte
    where num * 2 < 1000000
)
select num
FROM cte


select *from Sales
select *from Employees


go
with cte as
(
select e.EmployeeID, FirstName, count(s.EmployeeID) as total_sales from Employees as e
join Sales as S on e.EmployeeID=s.EmployeeID
group by e.EmployeeID,e.FirstName

)

select FirstName  from cte
where total_sales>5


select *from Sales
select *from Products


go
with  cte as
(
select s.EmployeeID,p.ProductName, sum(s.SalesAmount) as sum_amount  from Sales as s
join Products as p on s.ProductID=p.ProductID
group by s.EmployeeID,p.ProductName


)

select ProductName from cte
where sum_amount>500


go
with cte as
(
select avg(salary) as avg_salary from Employees
)
select EmployeeID,FirstName,Salary from Employees
cross join cte
where Salary>avg_salary


select *from Employees
select *from Sales

select Firstname,total_sales  from 
(
select Top 5 e.EmployeeID, FirstName, count(s.EmployeeID) as total_sales from Employees as e
join Sales as S on e.EmployeeID=s.EmployeeID
group by e.EmployeeID,e.FirstName
order by total_sales desc

) as A


select CategoryID,total_sum from(
select p.CategoryID,sum(S.SalesAmount)as total_sum from Sales as  s
join Products as p on s.ProductID=p.ProductID
group by p.CategoryID

) as A



go
with cte as (
   
    select n.Number, n.Number AS CurrentValue, 1 AS FactValue from Numbers1 as  n
    union all

    select f.Number, f.CurrentValue - 1, f.FactValue * (f.CurrentValue - 1)
    FROM cte as  f
    where f.CurrentValue > 1
)
select  Number, MAX(FactValue) AS Factorial
from cte
group by Number
order by Number


go
with cte as (
   
    SELECT 
        Id,
        1 AS Position,
        SUBSTRING([String], 1, 1) AS Character,
        LEN([String]) AS StrLength  FROM Example

    UNION ALL 
    SELECT 
        Id,
        Position + 1,
        SUBSTRING([String], Position + 1, 1),
        StrLength
    FROM cte
    WHERE Position < StrLength
)
SELECT Id, Position, Character
FROM cte
ORDER BY Id, Position
OPTION (MAXRECURSION 0)

select *from Example



go

WITH cte AS
(
    SELECT 
        YEAR(SaleDate) AS SalesYear,
        MONTH(SaleDate) AS SalesMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
SalesWithPrev AS
(
    SELECT 
        ms.SalesYear,
        ms.SalesMonth,
        ms.TotalSales,
        LAG(ms.TotalSales, 1) OVER (ORDER BY ms.SalesYear, ms.SalesMonth) AS PrevMonthSales
    FROM cte ms
)
SELECT 
    SalesYear,
    SalesMonth,
    TotalSales,
    PrevMonthSales,
    TotalSales - ISNULL(PrevMonthSales, 0) AS SalesDifference
FROM SalesWithPrev
ORDER BY SalesYear, SalesMonth



SELECT 
    s.EmployeeID,
    YEAR(s.SaleDate) AS SalesYear,
    DATEPART(QUARTER, s.SaleDate) AS Quarter,
    SUM(s.SalesAmount) AS TotalSales
FROM Sales s
GROUP BY s.EmployeeID, YEAR(s.SaleDate), DATEPART(QUARTER, s.SaleDate)
ORDER BY s.EmployeeID, SalesYear, Quarter



WITH Fibonacci (n, f1, f2) AS (
    SELECT 1, 0, 1   
    UNION ALL
    SELECT n + 1, f2, f1 + f2
    FROM Fibonacci
    WHERE n < 20     
)
SELECT n, f1 AS FibonacciNumber
FROM Fibonacci


select *from FindSameCharacters
where LEN([Vals]) > 1
  and  LEN(REPLACE([Vals], LEFT([Vals], 1), '')) = 0



  select *from FindSameCharacters



  declare @n int = 5

;with Numbers as (
    select 1 as Num, CAST('1' AS VARCHAR(MAX)) AS Seq
    union all
    select Num + 1, Seq + CAST(Num + 1 AS VARCHAR)
    from Numbers
    where Num < @n
)
select  *from Numbers











select  Top 1 e.EmployeeID, e.FirstName, SalesSummary.TotalSales
from Employees e
join (
    select EmployeeID, sum(SalesAmount) as TotalSales
    from Sales
    where SaleDate >= DATEADD(MONTH, -6, GETDATE())
    group by EmployeeID
) as SalesSummary
    on e.EmployeeID = SalesSummary.EmployeeID
order by SalesSummary.TotalSales desc

---------------------------------------------------------------------------------------------
;WITH Extracted AS
(
    SELECT 
        r.PawanName,
        r.Pawan_slug_name,
        value AS IntPart
    FROM RemoveDuplicateIntsFromNames r
    CROSS APPLY STRING_SPLIT(
        TRANSLATE(r.Pawan_slug_name, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-', '----------------------------------------------------'),
        '-'
    ) s
    WHERE s.value <> ''         -- bo‘shlarni tashlab yuboramiz
)
, Filtered AS
(
    SELECT 
        PawanName,
        Pawan_slug_name,
        IntPart
    FROM Extracted
    WHERE LEN(IntPart) > 1      -- faqat uzunligi > 1 bo‘lgan integerlarni qoldiramiz
)
, Dedup AS
(
    SELECT DISTINCT 
        PawanName,
        Pawan_slug_name,
        IntPart
    FROM Filtered
)
SELECT * 
FROM Dedup
ORDER BY PawanName
