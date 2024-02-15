CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    HireDate DATE
);

CREATE TABLE Customers
(
    CustomerID NVARCHAR(5) PRIMARY KEY,
    CompanyName NVARCHAR(50),
    ContactName NVARCHAR(50),
    City NVARCHAR(50)
);

SELECT ProductName, UnitPrice, UnitsInStock
INTO ProductInventory
FROM Products;

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID NVARCHAR(5),
    OrderDate DATE DEFAULT GETDATE(),
    ShipDate DATE DEFAULT NULL,
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE ExampleTable (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) DEFAULT 'John',
    Age INT DEFAULT 30,
    IsActive BIT DEFAULT 1
);

CREATE TABLE ExampleTable (
    ID INT PRIMARY KEY,
    CountryCode NVARCHAR(3) CHECK (CountryCode IN ('IND', 'USA', 'UK')),
);
-------------------------------------------------------------------------------------------------------------
ALTER TABLE table_name
{ 
  ADD column_name data_type [constraint],
  DROP COLUMN column_name,
  ALTER COLUMN column_name data_type [constraint],
  ADD CONSTRAINT constraint_name {constraint_type} (column_name),
  DROP CONSTRAINT constraint_name
};

Adding a new column:
  ALTER TABLE TableName
  ADD NewColumnName DataType;

Dropping an existing column
  ALTER TABLE TableName
  DROP COLUMN ColumnName;

Modifying the data type of an existing column:
  ALTER TABLE TableName
  ALTER COLUMN ColumnName NewDataType;

Adding a constraint (e.g., PRIMARY KEY, FOREIGN KEY, CHECK):
  ALTER TABLE TableName
  ADD CONSTRAINT ConstraintName {constraint_type} (ColumnName);

Dropping a constraint:
  ALTER TABLE TableName
  DROP CONSTRAINT ConstraintName;

Renaming a column:
  ALTER TABLE TableName
  DROP COLUMN OldColumnName;
  
  ALTER TABLE TableName
  ADD NewColumnName DataType;
  
Renaming a table:
  EXEC sp_rename 'OldTableName', 'NewTableName';

