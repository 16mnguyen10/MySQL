CREATE DATABASE RESTUARANT;
USE RESTUARANT;

CREATE TABLE customers (
	customer_ID INT NOT NULL AUTO_INCREMENT,
    customer_Name VARCHAR(255) NOT NULL,
    contact_Name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_ID)
);

CREATE TABLE orders (
	order_ID INT NOT NULL AUTO_INCREMENT,
    customer_ID INT NOT NULL,
    order_Date VARCHAR(255) NOT NULL,
    PRIMARY KEY (order_ID),
    FOREIGN KEY (customer_ID) REFERENCES customers (customer_ID)
); 

INSERT INTO customers  (customer_ID, customer_Name, contact_Name, country)
VALUES (1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
	(2, 'Ana Trujillo', 'Ana Trujillo', 'Mexico'),
    (3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mexico');
    
INSERT INTO orders (order_ID, customer_ID, order_date)
VALUES (100, 2, '1998-02-19'),
	(101, 1, '1998-02-20'),
    (102, 3, '1998-02-21');
    
SELECT * FROM orders, customers;

###---- Join Practice -----###
SELECT orders.order_ID AS 'Order #', customers.customer_Name AS 'Name', orders.order_Date AS 'Date'
FROM customers
INNER JOIN orders
ON orders.customer_ID = customers.customer_ID
WHERE customers.customer_Name LIKE 'a___________';   

###----- Deleting tables and database -----###
DROP TABLE orders;	# Delete in this order as there is data here that references another in customer
DROP TABLE customers; 
DROP DATABASE restuarant;