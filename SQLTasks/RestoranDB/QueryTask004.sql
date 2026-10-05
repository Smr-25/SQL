CREATE DATABASE Restoran
USE Restoran

CREATE TABLE Meals
(
    Id     INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(20),
    Price  DECIMAL(8, 2)
    )
DROP TABLE Meals

CREATE TABLE [Tables]
(
    Id INT PRIMARY KEY IDENTITY,
    No INT
)

DROP TABLE [Tables]

CREATE TABLE Orders
(
    Id      INT PRIMARY KEY IDENTITY,
    [Date]  DATETIME,
    TableId INT,
    MealId  INT,
    FOREIGN KEY (TableId) REFERENCES [Tables] (Id),
    FOREIGN KEY (MealId) REFERENCES Meals (Id)
)

DROP TABLE Orders

    INSERT INTO Meals([Name], Price)
    VALUES ('Dolma', 8.50),
    ('Plov', 7.00),
    ('Kabab', 10.00),
    ('Qutab', 4.50),
    ('Dovga', 3.00),
    ('Sac qovurma', 12.00),
    ('Balıq', 11.50),
    ('Kükü', 5.00);

INSERT INTO Tables ([No])
VALUES (1),
       (2),
       (3),
       (4),
       (5);

INSERT INTO Orders (TableId, MealId, Date)
VALUES (1, 1, '2025-10-21 13:00:00'),
       (1, 3, '2025-10-21 13:27:00'),
       (2, 2, '2025-10-21 14:00:00'),
       (2, 4, '2025-10-21 14:02:00'),
       (3, 6, '2025-10-21 15:10:00'),
       (3, 7, '2025-10-21 15:12:00'),
       (4, 5, '2025-10-21 16:00:00'),
       (5, 8, '2025-10-21 17:20:00'),
       (1, 2, '2025-10-22 12:00:00'),
       (2, 1, '2025-10-22 12:10:00'),
       (3, 3, '2025-10-22 12:15:00'),
       (4, 4, '2025-10-22 12:30:00'),
       (5, 6, '2025-10-22 13:00:00'),
       (1, 8, '2025-10-22 14:00:00'),
       (2, 5, '2025-10-22 19:15:00')


--Query 1
SELECT t.no                     TableNo,
       (SELECT COUNT(*)
        FROM Orders o
        WHERE o.TableId = t.id) OrderCount
FROM [Tables] t

--Query 2
SELECT m.[Name]                MealName,
       (SELECT COUNT(*) AS TotalOrders
        FROM Orders o
        WHERE o.MealId = m.Id) MealOrderCount
FROM Meals m


--Query 3
SELECT o.id, o.tableid, o.mealid, m.[Name], o.date
FROM Orders o
         JOIN Meals m ON m.Id = o.MealId


--Query 4
SELECT o.id, o.tableid, o.mealid, m.[Name], t.No, o.date
FROM Orders o
         JOIN Meals m ON m.Id = o.MealId
         JOIN [Tables] t ON t.Id = o.TableId

--Query 5
SELECT t.No,
       (SELECT SUM(m.Price)
        FROM Orders o
                 JOIN Meals m ON o.MealId = m.Id
        WHERE t.id = o.TableId)
FROM Tables t


--Query 6
SELECT MIN(o.Date)                              FirstDate,
       MAX(o.Date)                              LastDate,
       DATEDIFF(hour, MIN(o.Date), MAX(o.Date)) DateDifference
FROM Orders o
         JOIN Tables T on o.TableId = T.Id
WHERE T.No = 1

--Query 7
SELECT o.TableId, o.MealId, o.Date
FROM Orders o
         JOIN Tables T on o.TableId = T.Id
WHERE DATEDIFF(minute, o.Date, GETDATE()) = 30

--Query 8
SELECT t.No
FROM Tables t
         LEFT JOIN Orders o ON t.Id = o.TableId
WHERE o.Id IS NULL;

--Query 9
SELECT t.No
FROM Tables t
         LEFT JOIN Orders o
                   ON o.TableId = t.Id
                       AND o.Date >= DATEADD(MINUTE, -60, GETDATE())
WHERE o.Id IS NULL;

