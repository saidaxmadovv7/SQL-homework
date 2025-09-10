--------
------
-----
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')





	select
    customer_id,
    customer_name,
    order_date,
    total_amount,
    sum(total_amount) over (partition by customer_id order by order_date) as running_total
from sales_data





select
    product_category,
    count(*) as order_count
from sales_data
group by product_category




select
    product_category,
    max(total_amount) as max_total
from sales_data
group by product_category




select
    product_category,
    min(unit_price) as min_price
from sales_data
group by product_category






select
    order_date,
    total_amount,
    avg(total_amount) over (
        order by order_date
        rows between 1 preceding and 1 following
    ) as moving_avg
from sales_data





select
    region,
    sum(total_amount) as total_sales
from sales_data
group by region






select
    customer_id,
    customer_name,
    sum(total_amount) as total_spent,
    rank() over (order by sum(total_amount) desc) as rank_customer
from sales_data
group by customer_id, customer_name





select
    customer_id,
    order_date,
    total_amount,
    total_amount - lag(total_amount) over (partition by customer_id order by order_date) as diff_prev
from sales_data







select *
from (
    select
        product_category,
        product_name,
        unit_price,
        row_number() over (partition by product_category order by unit_price desc) as rn
    from sales_data
) t
where rn <= 3







select
    region,
    order_date,
    sum(total_amount) over (partition by region order by order_date) as cumulative_sales
from sales_data


select
    product_category,
    order_date,
    sum(total_amount) over (partition by product_category order by order_date) as cumulative_revenue
from sales_data




CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);




select
    Value,
    sum(Value) over (order by Value) as sumprevalues
from onecolumn






select
    customer_id,
    customer_name
from sales_data
group by customer_id, customer_name
having count(distinct product_category) > 1









select
    customer_id,
    customer_name,
    region,
    sum(total_amount) as total_spent
from sales_data
group by customer_id, customer_name, region
having sum(total_amount) > (
    select avg(total_amount)
    from sales_data s2
    where s2.region = sales_data.region
)







select
    customer_id,
    customer_name,
    order_date,
    total_amount,
    sum(total_amount) over (partition by customer_id order by order_date) as cumulative_sales
from sales_data

