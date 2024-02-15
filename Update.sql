UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

Update a single column for all records:
  UPDATE Employees
  SET LastName = 'Smith';

Update multiple columns for specific records:
  UPDATE Orders
  SET ShipDate = '2023-01-15', Shipped = 1
  WHERE OrderID = 10248;

Update based on a condition:
UPDATE Products
SET UnitsInStock = UnitsInStock - 1
WHERE ProductID = 5;

Update based on a join condition:
UPDATE Orders
  SET Orders.ShipDate = '2023-01-15', Orders.Shipped = 1
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'USA';

Update with data from another table:
  UPDATE Products
  SET Products.UnitsInStock = Products.UnitsInStock + OrderDetails.Quantity
  FROM Products
  JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
  WHERE OrderDetails.OrderID = 123;

Update based on a correlated subquery:
  UPDATE Employees
  SET Employees.Salary = Employees.Salary * 1.1
  WHERE EXISTS (
      SELECT 1
      FROM Departments
      WHERE Employees.DepartmentID = Departments.DepartmentID
      AND Departments.Location = 'New York'
  );
----------------------------------------------------------------

BEGIN TRANSACTION; -- Start the transaction

-- Your update statement(s) go here
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

-- More update statements if needed
UPDATE table_name
SET column3 = value3
WHERE condition;

-- Commit the transaction if everything is successful
COMMIT TRANSACTION;

--Note
BEGIN TRANSACTION: Starts a new transaction.
COMMIT TRANSACTION: Commits the transaction, making all changes permanent.
ROLLBACK TRANSACTION: Rolls back (undoes) all changes made during the transaction.
