# Practical 9 — Placement Dashboard using Data Controls

**Subject:** .NET Technologies (01CE1523) — Experiment 9

## Aim

Create a Placement Dashboard using Data Controls (GridView, Repeater and DataList) in ASP.NET Web Forms, connected to a SQL Server database using ADO.NET.

## Features

- **Default.aspx — Placement Dashboard**
  - Placement summary filled from the database: Total Students, Placed Students, Unplaced Students, Placement Percentage and Highest Package (LPA)
  - `GridView` data control showing all student placement records
  - Link to the Company Summary page
- **Companies.aspx — Company Summary**
  - `Repeater` data control showing placement records in a table (Placement ID, Student ID, Company, Job Role, Package)
  - `DataList` data control showing the same records in a free-form list layout
- Data is read with ADO.NET (`SqlConnection`, `SqlCommand`, `SqlDataAdapter`, `DataTable`); the connection string `PlacementDB` is stored in `Web.config`.

## Database

SQL Server LocalDB database **PlacementDB** with two tables:

| Table | Columns |
|---|---|
| Students | StudentId (PK), StudentName, Department, IsPlaced |
| Placements | PlacementId (PK), StudentId (FK), CompanyName, JobRole, PackageLPA |

## Steps to Run

1. Run **PlacementDB.sql** in SQL Server Management Studio (SSMS) to create the database, both tables and the sample data.
2. Open **Practical9.sln** in Visual Studio 2022.
3. Check the connection string in `Practical9/Web.config` — it uses `(localdb)\MSSQLLocalDB` with Integrated Security.
4. Press **F5** (or Ctrl+F5) to run. `Default.aspx` opens as the Placement Dashboard; use the "View Company Summary" link to open `Companies.aspx`.
