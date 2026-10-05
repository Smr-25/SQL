CREATE DATABASE HospitalDB
USE HospitalDB

CREATE TABLE Patients
(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20),
LastName NVARCHAR(25),
BirthDate DATE CHECK( Birthdate <= GETDATE()),
Email NVARCHAR(40) UNIQUE
)



CREATE TABLE Departments
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(40) UNIQUE

)

CREATE TABLE Doctors
(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20),
LastName NVARCHAR(25),
Experience INT CHECK(Experience > 0),
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
)

CREATE TABLE PatientsDoctors
(

    DoctorId INT NOT NULL,
    PatientId INT NOT NULL,
    VisitDate DATETIME NOT NULL,
    Result NVARCHAR(255),
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
    FOREIGN KEY (PatientId) REFERENCES Patients(Id)
)




INSERT INTO Departments (Name)
VALUES ('Cardiology'),
       ('Neurology'),
       ('Pediatrics'),
       ('Dermatology');

INSERT INTO Doctors (FirstName, LastName, Experience, DepartmentId)
VALUES ('Kamran', 'Aliyev', 10, 1),
       ('Leyla', 'Mammadova', 7, 2),
       ('Rauf', 'Hasanov', 5, 3),
       ('Aysel', 'Huseynli', 12, 1);

INSERT INTO Patients (FirstName, LastName, BirthDate, Email)
VALUES ('Elvin', 'Gasimov', '1995-06-12', 'elvin.gasimov@example.com'),
       ('Narmin', 'Aliyeva', '2001-03-25', 'narmin.aliyeva@example.com'),
       ('Rashad', 'Huseynov', '1988-10-02', 'rashad.huseynov@example.com');

INSERT INTO PatientsDoctors (DoctorId, PatientId, VisitDate, Result)
VALUES (1, 1, '2024-09-10 14:00', 'Routine check-up, all normal'),
       (2, 1, '2024-11-05 10:30', 'Minor headache, medication prescribed'),
       (3, 2, '2025-02-20 09:00', 'Flu symptoms, recovery expected'),
       (1, 3, '2025-01-15 15:45', 'Cardiac test, follow-up needed');

SELECT d.*, dp.[Name] FROM Doctors d
JOIN Departments dp ON dp.id = d.DepartmentId


SELECT p.*,pd.Result,d.Id Doctor, d.FirstName,d.LastName FROM Patients p
JOIN PatientsDoctors pd ON pd.PatientId = p.id
JOIN Doctors d ON d.Id = pd.DoctorId

CREATE PROCEDURE GetPatientDiagnoses @PatientId INT
AS
BEGIN
SELECT p.*,d.Id Doctor, d.FirstName,d.LastName,pd.VisitDate FROM Patients p
JOIN PatientsDoctors pd ON pd.PatientId = p.id
JOIN Doctors d ON d.Id = pd.DoctorId
WHERE p.Id = @PatientId
END
drop procedure GetPatientDiagnoses 
EXEC GetPatientDiagnoses 1


CREATE PROCEDURE GetTodayAppointmentsByDoctor @DoctorId INT
AS
BEGIN
SELECT p.*,d.Id Doctor, d.FirstName,d.LastName,pd.VisitDate FROM Patients p
JOIN PatientsDoctors pd ON pd.PatientId = p.id
JOIN Doctors d ON d.Id = pd.DoctorId
WHERE CAST(pd.VisitDate AS DATE) = CAST(GETDATE() AS DATE)
END

EXEC GetTodayAppointmentsByDoctor 1

CREATE TABLE Medications  
(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(40) 

)


ALTER TABLE PatientsDoctors ADD Id INT IDENTITY PRIMARY KEY

CREATE TABLE AppointmentMedications (
    AppointmentId INT NOT NULL,
    MedicationId INT NOT NULL,
    PRIMARY KEY (AppointmentId, MedicationId),
    FOREIGN KEY (AppointmentId) REFERENCES PatientsDoctors(Id),
    FOREIGN KEY (MedicationId) REFERENCES Medications(Id)
);

INSERT INTO Medications ([Name]) VALUES 
('Paracetamol'),
('Amoxicillin'),
('Ibuprofen'),
('Ceftriaxone'),
('Metformin');

INSERT INTO AppointmentMedications (AppointmentId, MedicationId) VALUES
(1, 1),
(1, 3),
(2, 5),
(3, 2),
(4, 1),
(4, 4),
(5, 3);




SELECT p.*,m.[Name],pd.VisitDate FROM Patients p
JOIN PatientsDoctors pd ON pd.PatientId = p.id
JOIN AppointmentMedications ap ON ap.AppointmentId = pd.Id
JOIN Medications m ON ap.MedicationId = m.Id

SELECT p.*,m.[Name],d.Id Doctor, d.FirstName,d.LastName,pd.VisitDate FROM Patients p
JOIN PatientsDoctors pd ON pd.PatientId = p.id
JOIN Doctors d ON d.Id = pd.DoctorId
JOIN AppointmentMedications ap ON ap.AppointmentId = pd.Id
JOIN Medications m ON ap.MedicationId = m.Id


