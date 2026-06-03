USE northwind;

-- 1. Add a new supplier.

INSERT INTO suppliers(CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
VALUES('Example Supplier Co.', 'Jane Smith', 'Sales Manager', '123 Market Street', 'Seattle', 'WA', '98101', 'USA', '(206) 555-1234');

-- 2. Add a new product provided by that supplier

INSERT INTO products(ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES('Example Product', 30, 1, '12 boxes', 19.99, 50, 0, 10, 0);

-- 3. List all products and their suppliers.

SELECT ProductName, CompanyName AS SupplierName
FROM products
JOIN suppliers;
-- 4. Raise the price of your new product by 15%.

UPDATE products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName = 'Example Product';

-- 5. List the products and prices of all products from that supplier.

SELECT ProductName, UnitPrice
FROM products
WHERE SupplierID = (
SELECT SupplierID
FROM suppliers
WHERE CompanyName = 'Example Supplier Co.');

-- 6. Delete the new product.

DELETE FROM products
WHERE ProductName = 'Example Product';

-- 7. Delete the new supplier.

DELETE FROM suppliers
WHERE SupplierName = 'Example Supplier Co.';

-- 8. List all products.

SELECT ProductName
FROM products;

-- 9. List all suppliers.

SELECT CompanyName
FROM suppliers;