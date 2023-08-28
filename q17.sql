# Creating Table & Adding data
CREATE TABLE SalaryTable (
    EmployeeID INT,
    SalaryDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO SalaryTable (EmployeeID, SalaryDate, Salary)
VALUES
    (1, '2023-01-01', 5000.00),
    (1, '2023-02-01', 5500.00),
    (1, '2023-03-01', 6000.00),
    (1, '2023-04-01', 6200.00),
    (1, '2023-05-01', 6500.00),
    (2, '2023-01-01', 4500.00),
    (2, '2023-02-01', 4800.00),
    (2, '2023-03-01', 5200.00),
    (2, '2023-04-01', 5400.00),
    (2, '2023-05-01', 5800.00);

# Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 month but exclude the most recent month? 
  
WITH MonthlySalaries AS (
    SELECT
        EmployeeID,
        DATE(SalaryDate, '-1 day', 'start of month') AS SalaryMonth,
        Salary
    FROM SalaryTable
),
RankedSalaries AS (
    SELECT
        EmployeeID,
        SalaryMonth,
        Salary,
        ROW_NUMBER() OVER (PARTITION BY EmployeeID ORDER BY SalaryMonth DESC) AS RowNum
    FROM MonthlySalaries
)
SELECT
    rs.EmployeeID,
    rs.SalaryMonth,
    SUM(Salary) OVER (PARTITION BY rs.EmployeeID ORDER BY rs.SalaryMonth DESC ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS CumulativeSalary
FROM RankedSalaries rs
WHERE rs.RowNum > 1
ORDER BY rs.EmployeeID ASC, rs.SalaryMonth DESC;
