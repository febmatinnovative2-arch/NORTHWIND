USE northwind;

SELECT *
FROM employees;

SELECT *
FROM customers;

SELECT *
FROM categories;

SELECT *
FROM orders;

SELECT *
FROM `order details`;

SELECT *
FROM products;

SELECT *
FROM shippers;

SELECT *
FROM `suppliers`;

-- QUESTION 1 Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName. 

SELECT CategoryName, description
FROM categories
ORDER BY CategoryName;

-- QUESTION 2 Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.

SELECT ContactName, CompanyName, ContactTitle, Phone
FROM customers
ORDER BY Phone;

-- STRING FUNCTIONS, AGGREGATE FUNCTIONS,LOGICAL FUNCTIONS, DATE FUNCTIONS
-- STRING FUNCTION UPPER, LOWER, MID CONCAT

SELECT UPPER(FIRSTNAME) AS FIRST_NAME, UPPER(LASTNAME) AS LAST_NAME
FROM employees;

SELECT LOWER(FIRSTNAME), LOWER(LASTNAME)
FROM employees;

-- ALIASING renaming a column or an aggregate using the keyword AS

-- WRITE A QUERRY THAT RETURN THE FIRSTNAME, FULL NAME (FIRST AND LAST NAME) FROM THE EMPLOYEES TABLE


SELECT FIRSTNAME, CONCAT(FIRSTNAME, " ", LASTNAME) AS FULLNAME
FROM employees;

SELECT UPPER(FIRSTNAME) AS Firstname, UPPER(LASTNAME) AS LastName
FROM employees;

-- CREATE A REPORT THAT SHOWS THE FULL NAME OF ALL CUSTOMERS IN CAPITALIZED FORM, LAST NAME FROM THE EMPLYEES TABLE

SELECT UPPER(CONCAT(FIRSTNAME," ",LASTNAME)) AS FULLNAME,LASTNAME
FROM employees;

-- QUESTION 3 Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.


SELECT UPPER(FIRSTNAME) AS FirstName, UPPER(LASTNAME) AS LastName, HIREDATE
FROM employees
ORDER BY HireDate DESC;

-- QUESTION 4 Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order

SELECT ORDERID, ORDERDATE, SHIPPEDDATE, CUSTOMERID, FREIGHT
FROM orders
ORDER BY Freight DESC
LIMIT 10;

-- Question 5 Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.

SELECT LOWER(CustomerID) AS ID
FROM customers;

-- AGGREGATE FUNCTIONS
-- SUM, AVERAGE, ROUND, COUNT, COUNTDISTINKT, MIN, MAX

-- GET THE AMOUNT SPENT ON FREIGHT IN THE ORDERS TABLE
SELECT SUM(Freight) AS TOTAL_FREIGHT
FROM orders;

-- GET THE TOTAL NO OF ORDERS THAT WERE MADE
-- TOTAL NO OF CUSTOMERS
-- AVERAGE QUANTITY ORDERD 
-- MOST EXPENSIVE ORDERS

SELECT COUNT(OrderID)
FROM orders;

SELECT COUNT(CustomerID) AS "TOTAL NO OF ORDERS"
FROM customers;

SELECT AVG(Quantity)
FROM `order details`;

SELECT MAX(UNITPRICE)
FROM `order details`;

-- QUESTION 6 Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.

SELECT CompanyName, Fax, Phone, Country, HomePage
FROM suppliers
ORDER BY country DESC, CompanyName ASC;

-- Question 7 Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.

SELECT CompanyName, ContactName
FROM customers
WHERE City = "Buenos Aires";

-- Question 8 Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.

SELECT ProductName, UnitPrice, QuantityPerUnit
FROM products
WHere QuantityPerUnit= "0";

-- Question 9 Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain

SELECT ContactName, Address, City
FROM Customers
WHERE country not in ("Germany", "Mexico", "Spain");

SELECT country
FROM customers;


-- Question 10 Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.

SELECT OrderDate, ShippedDate, customerID, Freight
FROM orders
WHERE OrderDate= "1996-05-21";

-- Question 11 Create a report showing FirstName, LastName, Country from the employees not from United States

SELECT FirstName, LastName, Country
FROM employees
WHERE Country NOT IN ("USA");

-- Question 12 Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date

SELECT EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate
FROM orders
WHERE ShippedDate>RequiredDate;


-- Question 13  Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.

SELECT City, CompanyName, ContactName
From customers
WHERE City LIKE "A%" OR City LIKE "B%";

-- Question 14 Create a report showing all the even numbers of OrderID from the orders table.

SELECT * 
FROM orders
WHERE orderid%2=0;

-- Question 15. Create a report that shows all the orders where the freight cost more than $500.

SELECT *
FROM orders
WHERE Freight > 500;


-- Question 16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.

SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
FROM products
WHERE ReorderLevel>=5;

-- Question 17 Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.

SELECT CompanyName, ContactName
FROM customers
WHERE Fax= "0";

-- Question 18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.

SELECT FirstName, LastName
FROM employees
WHERE ReportsTo IS NULL;

-- Question 19. Create a report showing all the odd numbers of OrderID from the orders table.

SELECT *
FROM orders
WHERE OrderID%2=1;

-- Question 20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.

SELECT CompanyName, ContactName, Fax
FROM customers
WHERE Fax = "0"
ORDER BY ContactName;


-- Question 21 Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.

SELECT City, CompanyName, ContactName
FROM customers
WHERE city LIKE "%L%"
ORDER BY ContactName;

-- Question 22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.

SELECT FirstName, LastName, BirthDate
FROM employees
WHERE  BirthDate BETWEEN "1952-02-19" AND "1958-01-09";

-- Question 23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.

SELECT FirstName, LastName, Birthdate AS BirthYear
FROM employees;

-- Question 24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.

SELECT OrderID, COUNT(OrderID) AS NumberofOrders
FROM `order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC;

-- Question 25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID

SELECT products.SupplierID, ProductName, CompanyName
FROM products
JOIN suppliers
ON products.SupplierId=suppliers.SupplierID
WHERE CompanyName IN ("Exotic Liquids", "Specialty Biscuits, Ltd.", "Escargots Nouveaux")
ORDER BY SupplierID;




SELECT *
FROM products
ORDER BY ProductName;

-- Question 26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124"

SELECT ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress
FROM orders
WHERE ShipPostalCode LIKE "%98124";

-- 27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.

SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";

-- Question 28 Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";

SELECT LastName, FirstName, City
FROM employees
WHERE City NOT LIKE "%Seattle%";

-- Question 29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.

SELECT CompanyName, ContactTitle, City, Country
FROM customers
WHERE (country = "Mexico" AND City IS NOT NULL) OR (Country = "Spain" AND City NOT LIKE "%Madrid%");

-- Question 30. Create a select statement that outputs the following:

CREATE TABLE Contactinfo AS SELECT FirstName, LastName, Extension
FROM employees;

-- Question 31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.

SELECT ContactName
FROM customers
WHERE ContactName  NOT LIKE "_A%";

-- Question 32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively

SELECT ROUND(Avg(UnitPrice),0) AS AVG_PRICE, SUM(UnitPrice*UnitsInStock) AS TOTAL_STOCK, MAX(UnitsOnOrder) AS MAX_ORDERS
FROM products;

-- Question 33 Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.

SELECT suppliers.SupplierID, CompanyName, CategoryName, ProductName, UnitPrice 
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
JOIN categories
ON products.CategoryID=categories.CategoryID;

-- Question 34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement.

SELECT CustomerID, SUM(Freight)
FROM orders
GROUP BY customerID
HAVING SUM(Freight) > "200";

-- Question 35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase.

SELECT `order details`.OrderID, ContactName, UnitPrice, Quantity, Discount
FROM orders
JOIN `order details`
ON orders.OrderID=`order details`.OrderID
JOIN customers
ON orders.CustomerID=customers.CustomerID
WHERE Discount >0;

-- Question 36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.

SELECT *
from employees;


SELECT e1.EmployeeID,CONCAT(e1.LastName,", ",e1.FirstName) as employee,CONCAT(e2.LastName,", ",e2.FirstName) as manager
FROM Employees e1
LEFT JOIN Employees e2
ON e1.ReportsTo=e2.EmployeeID
ORDER BY EmployeeID;

-- Question 37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.

SELECT AVG(UnitPrice) AS "AVERAGE PRICE", MIN(UnitPrice) AS "MINIMUM PRICE", MAX(UnitPrice) AS "MAXIMUM PRICE"
FROM products;

-- Question 38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View

CREATE TABLE CustomerInfo AS SELECT customers.CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate,ShippedDate
FROM orders
JOIN customers
ON orders.CustomerID=customers.CustomerID;


-- Question 40 Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View

CREATE TABLE ProductDetails AS SELECT products.ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
JOIN categories
ON products.CategoryID=categories.CategoryID;

-- Question 41. Drop the customer details view.

CREATE TABLE CustomerDetails AS SELECT *
FROM customers;

-- Question 42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo

SELECT LEFT(categoryName, 5) AS ShortInfo
FROM categories;

-- Question 43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement

CREATE TABLE SHIPPERS_DUPLICATE LIKE shippers;

INSERT INTO SHIPPERS_DUPLICATE SELECT * 
FROM shippers;

-- Question 44. Create a select statement that outputs the following from the shippers_duplicate Table:

CREATE TABLE Shippers_Duplicate  as select * from shippers;


SELECT ShipperID, CompanyName, Phone, CONCAT(CompanyName,"@gmail.com") as Email
From shippers_duplicate;


-- Question 45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category.

SELECT CompanyName, ProductName
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
JOIN categories
ON products.CategoryID=categories.CategoryID
WHERE categoryName = "Seafood";


-- Question 46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.

SELECT products.CategoryID, CompanyName, ProductName
FROM products
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE CategoryID = 5;


-- Question 48. Create a select statement that ouputs the following from the employees table.

SELECT timestampdiff(YEAR,Birthdate,CURDATE()) AS Age,FirstName,Firstname,Title
FROM employees;


-- Question 49 Create a report that shows the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.

SELECT CompanyName, COUNT(OrderID) AS "NUMBER OF ORDERS"
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
WHERE OrderDate > "1994-12-31"
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10;

-- Question 50. Create a select statement that ouputs the following from the product table

SELECT CONCAT(ProductName,"weigh/is",QuantityPerUnit,"and cost",UnitPrice) as ProductInfo
FROM products;


