CREATE DATABASE TurboAz
USE TurboAz

CREATE TABLE CarTypes
(
    CarTypeId INT PRIMARY KEY IDENTITY,
    TypeName  NVARCHAR(20)
)

CREATE TABLE CarBrands
(
    CarBrandId INT PRIMARY KEY IDENTITY,
    BrandName  NVARCHAR(50)
)

CREATE TABLE CarModels
(
    CarModelId INT PRIMARY KEY IDENTITY,
    ModelName  NVARCHAR(50),
    CarBrandId INT,
    FOREIGN KEY (CarBrandId) REFERENCES CarBrands (CarBrandId)
)


CREATE TABLE Cars
(
    CarId        INT PRIMARY KEY IDENTITY,
    CarTypeId    INT,
    CarModelId   INT,
    Year         INT,
    FuelType     NVARCHAR(20),
    Transmission NVARCHAR(20),
    FOREIGN KEY (CarTypeId) REFERENCES CarTypes (CarTypeId),
    FOREIGN KEY (CarModelId) REFERENCES CarModels (CarModelId)
)

ALTER TABLE Cars
    ADD CarBrandId Int FOREIGN KEY (CarBrandId) REFERENCES CarBrands (CarBrandId)
INSERT INTO CarTypes (TypeName)
VALUES ('Sedan'),
       ('SUV'),
       ('Hatchback'),
       ('Convertible'),
       ('Coupe')

INSERT INTO CarBrands (BrandName)
VALUES ('Toyota'),
       ('Ford'),
       ('BMW'),
       ('Audi'),
       ('Honda'),
       ('Skoda'),
       ('Subaru')

INSERT INTO CarModels (ModelName, CarBrandId)
VALUES ('Camry', 1),
       ('Corolla', 1),
       ('Mustang', 2),
       ('Explorer', 2),
       ('3 Series', 3),
       ('X5', 3),
       ('A4', 4),
       ('Q5', 4),
       ('Civic', 5),
       ('Accord', 5),
       ('Octavia', 6),
       ('WRX STI', 7)

INSERT INTO Cars (CarTypeId, CarModelId, Year, FuelType, Transmission, CarBrandId)
VALUES (1, 1, 2020, 'Gasoline', 'Automatic', 1),
       (3, 2, 2019, 'Diesel', 'Manual', 1),
       (5, 3, 2021, 'Gasoline', 'Manual', 2),
       (2, 4, 2018, 'Gasoline', 'Automatic', 2),
       (1, 5, 2022, 'Diesel', 'Automatic', 3),
       (2, 6, 2020, 'Gasoline', 'Automatic', 3),
       (1, 7, 2019, 'Diesel', 'Manual', 4),
       (2, 8, 2021, 'Gasoline', 'Automatic', 4),
       (1, 9, 2018, 'Gasoline', 'Manual', 5),
       (1, 10, 2020, 'Diesel', 'Automatic', 5),
       (3, 11, 2019, 'Gasoline', 'Manual', 6),
       (2, 12, 2021, 'Gasoline', 'Manual', 7)


--Query 1
SELECT *
FROM Cars c
         JOIN CarBrands cb ON cb.CarBrandId = c.CarBrandId
         JOIN CarModels cm ON cm.CarModelId = c.CarModelId
         JOIN CarTypes ct ON ct.CarTypeId = c.CarTypeId
