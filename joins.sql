USE northwind;

-- 1. List the product id, product name, unit price and category name of all products.
-- Order by category name and within that, by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM products
JOIN categories
ON products.CategoryID = categories.CategoryID
ORDER BY CategoryName, ProductName;


-- 2. List the product id, product name, unit price and supplier name of all products
-- that cost more than $75. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CompanyName AS SupplierName
FROM products
JOIN suppliers
ON products.SupplierID = suppliers.SupplierID
WHERE UnitPrice > 75;

-- 3. List the product id, product name, unit price, category name, and supplier name
-- of every product. Order by product name.

SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName AS SupplierName
FROM products
JOIN categories
ON products.CategoryID = categories.CategoryID
JOIN suppliers
ON products.SupplierID = suppliers.SupplierID
ORDER BY ProductName;

-- 4. What is the product name(s) and categories of the most expensive products?
-- HINT: Find the max price in a subquery and then use that in your more complex
-- query that joins products with categories.

SELECT Productname, CategoryName
FROM products
Join categories
ON products.CategoryID = categories.CategoryID
WHERE UnitPrice = (
SELECT MAX(UnitPrice) 
FROM products);

-- 5. List the order id, ship name, ship address, and shipping company name of every
-- order that shipped to Germany.

SELECT OrderID, ShipName, ShipAddress, CompanyName AS ShippingCompanyName
FROM orders
JOIN shippers
WHERE ShipVia = ShipperID;

-- 6. List the order id, order date, ship name, ship address of all orders that ordered
-- "Sasquatch Ale"?

SELECT orders.OrderID, OrderDate, ShipName, ShipAddress
FROM orders
JOIN `order details`
ON `order details`.OrderID = orders.OrderID
JOIN products
ON `order details`.ProductID = products.ProductID
WHERE ProductName = 'Sasquatch Ale';