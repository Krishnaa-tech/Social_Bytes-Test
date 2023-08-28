# Creating Table & Adding data
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

INSERT INTO books (book_id, title, author, price, stock_quantity)
VALUES
    (1, 'Book A', 'Author X', 20.00, 100),
    (2, 'Book B', 'Author Y', 25.00, 150),
    (3, 'Book C', 'Author Z', 18.00, 200),
    (4, 'Book D', 'Author X', 22.50, 120),
    (5, 'Book E', 'Author Y', 27.50, 180);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO orders (order_id, book_id, quantity, order_date)
VALUES
    (1, 1, 5, '2023-01-15'),
    (2, 2, 3, '2023-02-20'),
    (3, 1, 2, '2023-03-10'),
    (4, 3, 4, '2023-04-05'),
    (5, 4, 6, '2023-05-12'),
    (6, 2, 5, '2023-06-18'),
    (7, 1, 8, '2023-07-25'),
    (8, 3, 3, '2023-08-05'),
    (9, 5, 7, '2023-09-10'),
    (10, 4, 2, '2023-10-15'),
    (11, 2, 10, '2023-11-20');

#  SQL query to find the top 3 bestselling products in terms of total quantity sold, along with their names and total quantities sold. 
SELECT
    b.title AS ProductName,
    SUM(o.quantity) AS TotalQuantitySold
FROM
    books b
JOIN
    orders o ON b.book_id = o.book_id
GROUP BY
    b.title
ORDER BY
    TotalQuantitySold DESC
LIMIT 3;
