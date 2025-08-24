--

----



CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);


select * from employees
where salary =(select min(salary) from employees)



CREATE TABLE	products1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products1(id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);


select *from products1
where price>(select avg(price) from products1)



CREATE TABLE departments1 (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE EEmployees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments1(id)
);

INSERT INTO departments1(id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO EEmployees(id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);



select id, name from EEmployees 
where  department_id  in( select id from departments1 where department_name ='Sales')




CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id)
);

INSERT INTO customers1(customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders1 (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select *from customers1
select *from orders1



select name from customers1
where customer_id not in(select customer_id  from orders1 where order_id is not null)




CREATE TABLE products_ (
    id INT PRIMARY KEY,
    pro_name VARCHAR(100),
    price DECIMAL(10, 2),
    cat_id INT
);

INSERT INTO products_(id, pro_name, price, cat_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);


select *from products_
select * from products_ as p1
where price=(select max(price)from products_ as p2 where  p1.cat_id=p2.cat_id)





CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employeesss (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments1(id)
);

INSERT INTO departments1(id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employeesss (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);



select *from departments1
select *from employeesss



select *from employeesss as e
where department_id=(select  top 1 department_id from employeesss 
group by department_id
order by avg(salary) desc)




CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees2 (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);


select *from employees2 as e1
where salary>(select avg(salary) from employees2 as e2 where e2.department_id=e1.department_id)





CREATE TABLE students_ (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students_(student_id)
);

INSERT INTO students_(student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);





select *from(
select s1.name , g1.course_id,g1.grade from students_ as s1
 join grades as g1 on s1.student_id=g1.student_id) as A
 where A.grade=(select max(grade)from grades as g2 where A.course_id=g2.course_id)



 CREATE TABLE products_15 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products_15(id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);


 select p.*from products_15 as p
where 2 = (
    select count(distinct p2.price)
   from products_15 as p2
    where p2.category_id = p.category_id
      and p2.price > p.price)





CREATE TABLE employees_15 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees_15(id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);


select *from employees_15 as e
where e.salary > (
    select avg(salary) from employees
) 
and e.salary < (
    select max(salary) from employees_15 as e2
    where e2.department_id = e.department_id)

