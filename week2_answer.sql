-- Week 2 SQL Database Assignment
-- Student: Malou Yien Puot
-- Database: sales

USE sales;

-- Question 1: Retrieve the payment with check number 104
SELECT checkNumber, paymentDate, amount
FROM payments
WHERE checkNumber = '104';

-- Question 2: Find orders that are currently in process
SELECT orderDate, requiredDate, status
FROM orders
WHERE status = 'In Process'
ORDER BY orderDate DESC;

-- Question 3: Find all sales representatives
SELECT firstName, lastName, email
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC;

-- Question 4: Retrieve every office record and column
SELECT *
FROM offices;

-- Question 5: Retrieve the five cheapest products
SELECT productName, quantityInStock
FROM products
ORDER BY buyPrice ASC
LIMIT 5;
