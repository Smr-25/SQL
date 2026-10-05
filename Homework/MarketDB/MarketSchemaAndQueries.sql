CREATE DATABASE Market
USE Market

CREATE TABLE Products (
    Id INT ,
    [Name] NVARCHAR(50) ,
    Price DECIMAL(10, 2)
)
ALTER TABLE Products ADD Brand NVARCHAR(50)

INSERT INTO Products (Id, [Name], Price, Brand) VALUES
(1, 'Laptop', 999.99, 'TechBrand'),
(2, 'Smartphone', 499.99, 'PhoneCo'),
(3, 'Tablet', 299.99, 'GadgetInc'),
(4, 'Headphones', 199.99, 'SoundMaster'),
(5, 'Smartwatch', 149.99, 'WristTech'),
(6, 'Camera', 599.99, 'PhotoPro'),
(7, 'Printer', 89.99, 'PrintWorks'),
(8, 'Monitor', 249.99, 'DisplayTech'),
(9, 'Keyboard', 49.99, 'KeyMasters'),
(10, 'Mouse', 29.99, 'ClickCo'),
(11, 'External Hard Drive', 79.99, 'StorageSolutions'),
(12, 'Router', 59.99, 'NetConnect'),
(13, 'Smart TV', 799.99, 'VisionElectronics'),
(14, 'Gaming Console', 399.99, 'GameWorld'),
(15, 'Speakers', 129.99, 'SoundMaster')

SELECT * FROM Products

UPDATE Products SET Price = Price * 0.9 WHERE Brand = 'SoundMaster'
UPDATE Products SET Brand = 'TechGiant' WHERE Id = 1
DELETE Products WHERE Price < 50
DELETE Products WHERE Brand = 'PrintWorks'

SELECT * FROM Products
WHERE Price < (SELECT AVG(Price) FROM Products);

SELECT * FROM Products
WHERE Price > 10.00

SELECT * FROM Products
WHERE LEN(Brand) > 5;

SELECT CONCAT([Name], ' - ', Brand) AS ProductInfo
FROM Products
WHERE LEN(COALESCE(Brand, '')) > 5;

CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(255) NOT NULL ,
    Age INT CHECK(Age > 0) NOT NULL ,
    Email NVARCHAR(50) UNIQUE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 200 AND Salary < 2000)
)

SELECT * FROM Employees


INSERT INTO Employees (FullName, Age, Email, Salary) VALUES
('Aysel Aliyeva', 28, 'aysel.aliyeva@example.com', 350.50),
('Orxan Mammadov', 34, 'orxan.mammadov@example.com', 1200.00),
('Leyla Huseyn', 22, 'leyla.huseyn@example.com', 420.75),
('Rauf Ibrahim', 45, 'rauf.ibrahim@example.com', 1800.00),
('Ramiz Rahim', 30, 'nigar.rahim@example.com', 600.25)


SELECT EmployeeId,FullName, Email, Salary FROM Employees WHERE Salary > 1000.00

SELECT EmployeeId, FullName, Age FROM Employees WHERE Age < 30

SELECT * FROM Employees WHERE Email LIKE '%@example.com'


UPDATE Employees
SET Email = 'orxan.newemail@example.com'
WHERE EmployeeId = 2;

DELETE FROM Employees WHERE EmployeeId = 5;