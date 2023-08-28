# Creating Table & Adding data
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Michael Johnson'),
    (4, 'Emily Brown'),
    (5, 'David Williams');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 1, '2023-03-10'),
    (4, 3, '2023-04-05'),
    (5, 4, '2023-05-12'),
    (6, 2, '2023-06-18'),
    (7, 1, '2023-07-25'),
    (8, 3, '2023-08-05'),
    (9, 5, '2023-09-10'),
    (10, 4, '2023-10-15'),
    (11, 2, '2023-11-20');

# Display the results in descending order of the order count and ascending order of customer names.

SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS OrderCount
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerName
ORDER BY
    OrderCount DESC,
    c.CustomerName ASC
LIMIT 5;
