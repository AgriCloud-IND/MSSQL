List all products:
  SELECT * FROM Products;

List all customers from a specific country (e.g., Germany):
  SELECT * FROM Customers WHERE Country = 'Germany';

List all orders for a specific customer (e.g., ALFKI):
  SELECT * FROM Orders WHERE CustomerID = 'ALFKI';

List all employees:
  SELECT * FROM Employees;

List all orders placed by a specific employee (e.g., EmployeeID 5):
  SELECT * FROM Orders WHERE EmployeeID = 5;

Calculate the total sales for each category:
  SELECT CategoryName, SUM(UnitPrice * Quantity) AS TotalSales
  FROM Products
  INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
  INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
  GROUP BY CategoryName;

Find the top 10 customers with the highest order amounts:
  SELECT TOP 10 CustomerID, SUM(UnitPrice * Quantity) AS TotalAmount
  FROM Orders
  INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
  GROUP BY CustomerID
  ORDER BY TotalAmount DESC;

List all products that are out of stock:
  SELECT * FROM Products WHERE UnitsInStock = 0;

List all employees along with their territories:
  SELECT Employees.*, Territories.TerritoryDescription
  FROM Employees
  INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID
  INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID;
  
List all customers who have not placed any orders:
  SELECT * FROM Customers
  WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

List all orders shipped to a specific country (e.g., USA) after a certain date:
  SELECT * FROM Orders
  WHERE ShipCountry = 'USA' AND ShippedDate > '1996-07-01';

Find the average order quantity for each product category:
  SELECT CategoryName, AVG(Quantity) AS AvgOrderQuantity
  FROM Products
  INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
  INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
  GROUP BY CategoryName;

List all employees who were hired in a specific year (e.g., 1992):
SELECT * FROM Employees
WHERE YEAR(HireDate) = 1992;


Find the total number of orders placed by each customer:
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

List all products with their respective suppliers and categories:
SELECT Products.ProductName, Suppliers.CompanyName AS Supplier, Categories.CategoryName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


Find the top 5 most expensive products:
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

List all customers who have placed orders in both 1996 and 1997:
SELECT CustomerID
FROM Orders
WHERE YEAR(OrderDate) IN (1996, 1997)
GROUP BY CustomerID
HAVING COUNT(DISTINCT YEAR(OrderDate)) = 2;

Find the total sales for each year:
  SELECT YEAR(OrderDate) AS OrderYear, SUM(UnitPrice * Quantity) AS TotalSales
  FROM Orders
  INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
  GROUP BY YEAR(OrderDate)
  ORDER BY OrderYear;

List all products that were discontinued:
  SELECT * FROM Products WHERE Discontinued = 1;

Find the customer who placed the most orders
  SELECT TOP 1 CustomerID, COUNT(*) AS TotalOrders
  FROM Orders
  GROUP BY CustomerID
  ORDER BY TotalOrders DESC;

Calculate the total revenue for each product (unit price * quantity):
  SELECT ProductName, SUM(UnitPrice * Quantity) AS TotalRevenue
  FROM Products
  INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
  GROUP BY ProductName;

List all orders shipped between two specific dates:
SELECT * FROM Orders
WHERE ShippedDate BETWEEN '1997-01-01' AND '1997-02-28';


Calculate the total sales for each month in a specific year (e.g., 1997):
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(UnitPrice * Quantity) AS TotalSales
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE YEAR(OrderDate) = 1997
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

List all customers who have not placed any orders in the last year:
SELECT * FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE OrderDate >= DATEADD(year, -1, GETDATE())
);

Calculate the total shipping cost for each order (based on freight):
SELECT OrderID, Freight
FROM Orders;

List all employees with their age:
SELECT EmployeeID, FirstName, LastName, BirthDate, DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Employees;

List all orders placed during the current month:
SELECT * FROM Orders
WHERE YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) = MONTH(GETDATE());

Find the average number of days between order date and ship date:
SELECT AVG(DATEDIFF(day, OrderDate, ShippedDate)) AS AvgDaysToShip
FROM Orders
WHERE ShippedDate IS NOT NULL;

List all products with their total quantities sold:
SELECT ProductID, ProductName, SUM(Quantity) AS TotalQuantitySold
FROM [Order Details]
GROUP BY ProductID, ProductName
ORDER BY TotalQuantitySold DESC;

Find the number of orders placed by each employee:
SELECT EmployeeID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY EmployeeID;


