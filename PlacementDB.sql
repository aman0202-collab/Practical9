-- ============================================================
--  Experiment 9 : Placement Dashboard using Data Controls
--  Database Script : PlacementDB (SQL Server LocalDB)
--  Run this script in SQL Server Management Studio (SSMS)
--  or Visual Studio SQL Server Object Explorer before
--  running the web application.
-- ============================================================

CREATE DATABASE PlacementDB;
GO

USE PlacementDB;
GO

-- ------------------------------------------------------------
--  Table 1 : Students
--  Stores every student with a flag (IsPlaced) that tells
--  whether the student is placed or not.
-- ------------------------------------------------------------
CREATE TABLE Students (
    StudentId   INT IDENTITY(1,1) PRIMARY KEY,
    StudentName NVARCHAR(100) NOT NULL,
    Department  NVARCHAR(50)  NOT NULL,
    IsPlaced    BIT           NOT NULL DEFAULT 0
);
GO

-- ------------------------------------------------------------
--  Table 2 : Placements
--  Stores one row for every placed student: the company,
--  the job role offered and the package in LPA.
-- ------------------------------------------------------------
CREATE TABLE Placements (
    PlacementId INT IDENTITY(1,1) PRIMARY KEY,
    StudentId   INT            NOT NULL REFERENCES Students(StudentId),
    CompanyName NVARCHAR(100)  NOT NULL,
    JobRole     NVARCHAR(100)  NOT NULL,
    PackageLPA  DECIMAL(5,2)   NOT NULL
);
GO

-- ------------------------------------------------------------
--  Sample data : Students (8 placed, 2 unplaced)
-- ------------------------------------------------------------
INSERT INTO Students (StudentName, Department, IsPlaced) VALUES
('Aarav Sharma',  'CE', 1),
('Priya Patel',   'CE', 1),
('Rohan Mehta',   'IT', 1),
('Sneha Iyer',    'CE', 1),
('Karan Singh',   'IT', 0),
('Ananya Gupta',  'EC', 1),
('Vikram Joshi',  'CE', 1),
('Neha Verma',    'IT', 1),
('Arjun Nair',    'EC', 0),
('Ishita Desai',  'CE', 1);
GO

-- ------------------------------------------------------------
--  Sample data : Placements (one row per placed student)
-- ------------------------------------------------------------
INSERT INTO Placements (StudentId, CompanyName, JobRole, PackageLPA) VALUES
(1,  'TCS',          'Software Developer',            4.50),
(2,  'Infosys',      'System Engineer',               3.60),
(3,  'Wipro',        'Project Engineer',              3.50),
(4,  'Accenture',    'Associate Software Engineer',   4.80),
(6,  'Cognizant',    'Programmer Analyst',            4.20),
(7,  'Tech Mahindra','Associate Software Engineer',   3.80),
(8,  'Capgemini',    'Software Engineer',             5.50),
(10, 'Amazon',       'Software Development Engineer', 12.00);
GO
