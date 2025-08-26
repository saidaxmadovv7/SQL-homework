---
--
DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

select *from #RegionSales
go
with Dist as (
    select distinct  Distributor from #RegionSales
),
Regs as (
    select distinct  Region from #RegionSales
),
Comb as (
    select d.Distributor, r.Region
    from Dist d
    cross join Regs r
)
select 
    c.Distributor,
    c.Region,
    isnull(s.Sales, 0) as Sales
from Comb c
left join #RegionSales s
    on c.Distributor = s.Distributor
   and c.Region = s.Region
order by c.Distributor, c.Region

drop table if exists Employee
CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);

INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);


select distinct  e1.name from Employee as e1
 join Employee as e2 on e1.id=e2.managerId




 CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);

INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');

INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);



select p.product_name,sum(O.unit) as Unit   from Orders as O
 join Products as P on o.product_id=p.product_id
where  O.order_date>='01-02-2020' and  o.order_date<'01-03-2020'
group by p.product_name
having sum(O.unit)>=100



DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');



select Top 2   o1.CustomerID,o2.Vendor, count(o1.OrderID) as order_amount from Orders as o1
join Orders as o2 on  o1.CustomerID=o2.CustomerID
group by o1.CustomerID,o2.Vendor
order by count(o1.OrderID) desc



DECLARE @Check_Prime INT = 91








go
ALTER FUNCTION dbo.Prime(@Check_prime1 INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @i INT = 2
    DECLARE @isPrime BIT = 1  
    DECLARE @Result VARCHAR(100)

    IF @Check_prime1 <= 1
        SET @isPrime = 0
    ELSE
    BEGIN
        WHILE @i <= SQRT(@Check_prime1)
        BEGIN
         IF @Check_prime1 % @i = 0
        BEGIN
           SET @isPrime = 0
          BREAK
       END
         SET @i += 1
      END
    END

    IF @isPrime = 1
        SET @Result = 'This number is prime'
    ELSE
        SET @Result = 'This number is not prime'

    RETURN @Result
END

select dbo.Prime(91)



CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

select *from Device

go
WITH DeviceSignals AS (
    SELECT 
        device_id,
        Locations,
        COUNT(*) AS signals_per_location
    FROM Device
    GROUP BY device_id, Locations
),
RankedLocations AS (
    SELECT 
        device_id,
        Locations,
        signals_per_location,
        RANK() OVER (PARTITION BY device_id ORDER BY signals_per_location DESC) AS rnk
    FROM DeviceSignals
)
select
    d.device_id,
    count(distinct  d.locations) as total_locations,
    rl.locations as top_location,
    rl.signals_per_location as top_location_signals,
    sum(d.signals_per_location) as total_signals
from  DeviceSignals d
join RankedLocations rl
    on d.device_id = rl.device_id AND rl.rnk = 1
group by d.device_id, rl.locations, rl.signals_per_location
order by d.device_id

CREATE TABLE Emp1oyee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Emp1oyee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);



select * from (
select  A.EmpID,A.EmpName, max(B.Salary) as max_salary from Emp1oyee as A
join Emp1oyee as B on A.DeptID=B.DeptID
group  by  A.EmpID,A.EmpName) as O

select  avg(Salary) from Emp1oyee
group by DeptID





-------------------------------------------------------------------------------------------
select 
    e.EmpID,
    e.EmpName,
    e.Salary
from Emp1oyee e
where e.Salary > (
    select  avg(e2.Salary)
    from Emp1oyee e2
    where  e2.DeptID = e.DeptID)
	-----------------------------------------------------------
	CREATE TABLE Numbers (
    Number INT
)
INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);

CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);


INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);









go
with TicketMatches as (
    select 
        t.TicketID,
        count(distinct  n.Number) as Matches
    from Tickets t
    left join  Numbers n on t.Number = n.Number
    group by t.TicketID
)
select
    TicketID,
    CASE 
        WHEN Matches = (SELECT COUNT(*) FROM Numbers) THEN 100
        WHEN Matches > 0 THEN 10
        ELSE 0
    END AS Prize
FROM TicketMatches






CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

go
WITH UserPlatform AS (
    SELECT 
        User_id,
        Spend_date,
        SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS MobileSpend,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS DesktopSpend
    FROM Spending
    GROUP BY User_id, Spend_date
)
SELECT 
    Spend_date,
    SUM(CASE WHEN MobileSpend > 0 AND DesktopSpend = 0 THEN 1 ELSE 0 END) AS MobileOnlyUsers,
    SUM(CASE WHEN MobileSpend > 0 AND DesktopSpend = 0 THEN MobileSpend ELSE 0 END) AS MobileOnlyAmount,

    SUM(CASE WHEN DesktopSpend > 0 AND MobileSpend = 0 THEN 1 ELSE 0 END) AS DesktopOnlyUsers,
    SUM(CASE WHEN DesktopSpend > 0 AND MobileSpend = 0 THEN DesktopSpend ELSE 0 END) AS DesktopOnlyAmount,

    SUM(CASE WHEN MobileSpend > 0 AND DesktopSpend > 0 THEN 1 ELSE 0 END) AS BothUsers,
    SUM(CASE WHEN MobileSpend > 0 AND DesktopSpend > 0 THEN MobileSpend + DesktopSpend ELSE 0 END) AS BothAmount
FROM UserPlatform
GROUP BY Spend_date
ORDER BY Spend_date



DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);


select *from Grouped
go
WITH cte AS (
    SELECT Product, Quantity, 1 AS n
    FROM Grouped
    UNION ALL
    SELECT Product, Quantity, n+1
    FROM cte
    WHERE n+1 <= Quantity
)
SELECT Product
FROM cte
ORDER BY Product, n
OPTION (MAXRECURSION 0)

