# Creating Table & Adding data
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Company VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Company, Salary)
VALUES
    (1, 'John', 'Doe', 'Company A', 50000.00),
    (2, 'Jane', 'Smith', 'Company A', 60000.00),
    (3, 'Michael', 'Johnson', 'Company B', 75000.00),
    (4, 'Emily', 'Brown', 'Company B', 55000.00),
    (5, 'David', 'Williams', 'Company A', 80000.00),
    (6, 'Sarah', 'Jones', 'Company B', 72000.00),
    (7, 'James', 'Wilson', 'Company C', 62000.00),
    (8, 'Linda', 'Davis', 'Company C', 58000.00),
    (9, 'Robert', 'Anderson', 'Company A', 70000.00),
    (10, 'Karen', 'Martinez', 'Company C', 65000.00);

# Write a SQL query to find the median salary of each company.? 

WITH RankedSalaries AS (
    SELECT
        EmployeeID,
        Company,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) AS RowAsc,
        ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary DESC) AS RowDesc
    FROM Employee
)
SELECT
    Company,
    AVG(Salary) AS MedianSalary
FROM RankedSalaries
WHERE RowAsc = RowDesc
   OR RowAsc + 1 = RowDesc
   OR RowAsc = RowDesc + 1
GROUP BY Company;
