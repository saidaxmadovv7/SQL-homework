


CREATE TABLE Products3 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales3 (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products3(ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales3 (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');



SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
INTO #MonthlySales
FROM Sales3 s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(SaleDate) = YEAR(GETDATE())
  AND MONTH(SaleDate) = MONTH(GETDATE())
GROUP BY s.ProductID

SELECT * FROM #MonthlySales



GO
CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    ISNULL(SUM(s.Quantity),0) AS TotalQuantitySold
FROM Products3 p
LEFT JOIN Sales3 s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category


GO
CREATE FUNCTION fn_GetTotalRevenueForProduct(@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Revenue DECIMAL(18,2)
    SELECT @Revenue = SUM(s.Quantity * p.Price)
    FROM Sales3 s
    JOIN Products3 p ON s.ProductID = p.ProductID
    WHERE p.ProductID = @ProductID
    RETURN ISNULL(@Revenue,0)
END



GO
CREATE FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantity,
        SUM(s.Quantity * p.Price) AS TotalRevenue
    FROM Products3 p
    LEFT JOIN Sales3 s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName)

	GO
	CREATE FUNCTION fn_IsPrime(@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    IF @Number < 2 RETURN 'No'
    DECLARE @i INT = 2;
    WHILE @i <= SQRT(@Number)
    BEGIN
        IF @Number % @i = 0 RETURN 'No'
        SET @i += 1;
    END
    RETURN 'Yes'
END


GO
CREATE FUNCTION fn_GetNumbersBetween(@Start INT, @End INT)
RETURNS @Nums TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = @Start
    WHILE @i <= @End
    BEGIN
        INSERT INTO @Nums VALUES (@i)
        SET @i += 1
    END
    RETURN
END



GO
CREATE FUNCTION getNthHighestSalary(@N INT) 
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC
        OFFSET (@N-1) ROWS FETCH NEXT 1 ROWS ONLY
    )
END



Create table RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null)
Truncate table RequestAccepted
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')



SELECT TOP 1 id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id, accepter_id AS friend
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id, requester_id
    FROM RequestAccepted
) f
GROUP BY id
ORDER BY COUNT(*) DESC




CREATE TABLE Customers3 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders3 (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers3(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers3 (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders3 (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);



GO
CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    ISNULL(SUM(o.amount),0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers3 c
LEFT JOIN Orders3 o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name



DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)




SELECT RowNumber,
    MAX(TestCase) OVER (ORDER BY RowNumber 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Workflow
FROM Gaps




