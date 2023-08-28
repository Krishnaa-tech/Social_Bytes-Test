# Creating Table & Adding data

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary)
VALUES
    (1, 'John', 'Doe', 50000.00),
    (2, 'Jane', 'Smith', 60000.00),
    (3, 'Michael', 'Johnson', 75000.00),
    (4, 'Emily', 'Brown', 55000.00),
    (5, 'David', 'Williams', 80000.00);

# SQL Query to get the nth highest salary from Employee table 
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 2;
