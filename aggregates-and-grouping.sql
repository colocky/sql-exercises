USE northwind;
-- 1. How many suppliers are there? Use a query!

SELECT count(*)
FROM suppliers;
-- 29

-- 2. What is the sum of all the employee's salaries?

SELECT sum(salary)
FROM employees;
-- 20362.929931640625

-- 3. What is the price of the cheapest item that Northwind sells?
SELECT min(UnitPrice) 
FROM products;
-- 2.5

-- 4. What is the average price of items that Northwind sells?

SELECT avg(UnitPrice)
FROM products;
-- 28.86636364

-- 5. What is the price of the most expensive item that Northwind sells?

SELECT max(UnitPrice)
FROM products;
-- 263.5000

-- 6. What is the supplier ID of each supplier and the number of items they supply?
-- You can answer this query by only looking at the Products table.

SELECT SupplierID, COUNT(*) AS NumberOfItems
FROM Products
GROUP BY SupplierID;

-- 7. What is the category ID of each category and the average price of each item in the
-- category? You can answer this query by only looking at the Products table.

SELECT CategoryID, avg(UnitPrice)
FROM Products
GROUP BY CategoryID;

-- 8. For suppliers that provide at least 5 items to Northwind, what is the supplier ID of
-- each supplier and the number of items they supply? You can answer this query
-- by only looking at the Products table.

SELECT SupplierID, COUNT(*) AS NumberOfItems
FROM Products 
GROUP BY SupplierID
HAVING COUNT(*) >= 5;

-- 9. List the product id, product name, and inventory value (unit price * units on
-- hand). Sort the results in descending order by value. If two or more have the
-- same value, order by product name.

SELECT ProductId, ProductName, (UnitPrice * UnitsInStock) AS InventoryValue
FROM products
ORDER BY InventoryValue DESC;