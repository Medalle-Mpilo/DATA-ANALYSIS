-- create a database
create database bookstore;
use bookstore;
drop database bookstore;
create table bookshelve (isb int UNIQUE, books VARCHAR(20) NOT NULL);


-- create table customers and orders
CREATE TABLE customers(customer_id INT PRIMARY KEY AUTO_INCREMENT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50));
create table orders(order_id INT PRIMARY KEY AUTO_INCREMENT,customer_id INT,product VARCHAR(50),quantity INT,price int,order_date DATE);
-- alter table orders
ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- drop customer table
drop table customers;
-- delecting table customers
DELETE FROM orders where price<50;
-- selecting sum of unit_price
SELECT SUM(price)
FROM orders
WHERE price>50;


CREATE TABLE products (product_id INT PRIMARY KEY AUTO_INCREMENT,product_name VARCHAR(255),category VARCHAR(50),
						cost DECIMAL(10, 2),stock_quantity INT);
INSERT INTO products (product_name, category, cost, stock_quantity)
VALUES('Bed', 'Furniture', 5, 9855.66),('Cellphone', 'Technology', 7, 12999.00),
		('Biscuit', 'Food', 14, 157.90);
--  alter table products
ALTER TABLE products
RENAME COLUMN cost to unit_price;
ALTER TABLE products ADD revenue FLOAT;
-- selecting the table
SELECT revenue, SUM(unit_price*stock_quantity) 
FROM products
GROUP BY product_id;
SELECT SUM(unit_price)
FROM products
WHERE unit_price>10;


-- create authors table
CREATE table authors (full_name VARCHAR(20) NOT NULL, author_ID int);
-- insert values into authors table
insert into authors(full_name,author_ID) values ('J.K. Rowling', 101);


-- create inventory
CREATE TABLE IF NOT EXISTS inventory (item_id INT AUTO_INCREMENT PRIMARY KEY,item_name VARCHAR(255) NOT NULL,
quantity INT NOT NULL,price FLOAT NOT NULL);
-- insert values into inventory table
INSERT INTO inventory (item_name, quantity, price) VALUES('snacks', 50, 74.00),('sweets', 80, 43.50),('fruits', 1000, 87.90);
-- Updating the table
UPDATE inventory
set quantity=100;


-- create table logs
CREATE TABLE logs (login_id INT AUTO_INCREMENT PRIMARY KEY,timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,feedback TEXT);
-- Insert sample values
INSERT INTO logs (feedback) VALUES('User login successful'),('Error: Invalid input detected'),('New user registered'),
						('Database connection established'),('File not found: index.html'),('Order #123 shipped'),
                        ('Error: Database query failed'),('User logout'),('Product added to cart'),('Payment received'),
                        ('Error: Server timeout'),('Password changed for user johndoe');
SELECT * 
FROM LOGS
ORDER BY feedback ASC
LIMIT 2,12;
TRUNCATE TABLE logs;



CREATE TABLE data_table(id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(50),age INT,town VARCHAR(50),value INT);
INSERT INTO data_table (name, age, town, value)
VALUES('Mary Lane', 25, 'Durban',469),('Yon Forbes', 23, 'Pretoria',760),('Samuel Moll', 31, 'Soweto',320);
SELECT value,SQRT(value)
FROM data_table
ORDER BY id;

-- create exam_score table
CREATE TABLE exam_scores (student_id INT PRIMARY KEY AUTO_INCREMENT,student_name VARCHAR(255),exam_subject VARCHAR(100),score INT);
-- insert values into exam_score table
INSERT INTO exam_scores (student_name, exam_subject, score)
VALUES ('Kelly Tambo', 'Math', 75),('Fana Langa', 'Science', 87),('Ana Tete', 'Biology', 89);
SELECT AVG(score)
FROM exam_scores; 


-- create employees table
CREATE TABLE employees (employee_id INT PRIMARY KEY,first_name VARCHAR(50),last_name VARCHAR(50),
						email VARCHAR(100),hire_date DATE,salary DECIMAL(10, 2),department_id INT);
-- insert values into employees table
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES  (1, 'John', 'Doe', 'john.doe@gmail.com', '2022-08-20', 45000.00, 1),
		(2, 'Tom', 'Mary', 'maryT@gmail.com', '2023-06-20', 70000.00, 1);
SELECT employee_id, CONCAT(first_name, " ", last_name)
FROM employees;


-- create  tax_records table
CREATE TABLE tax_records (record_id INT PRIMARY KEY AUTO_INCREMENT,taxpayer_name VARCHAR(100),income DECIMAL(10, 2));
-- insert values into tax_records table
INSERT INTO tax_records (taxpayer_name, income)
VALUES('Ben MA', 65000.00),('Quenn Tau', 62000.00),('Menzi Parker', 79000.00);
select * from tax_records;
ALTER TABLE tax_records ADD COLUMN tax_amount FLOAT;
  -- updating values in tax_records column equals to 10% of price                     
UPDATE tax_records
set tax_amount=
CASE
	WHEN income =65000.00THEN income*0.10
	WHEN income = 62000.00 THEN income* 0.10
    WHEN income = 79000.00 THEN income*0.10
	ELSE 0.00
	END;

