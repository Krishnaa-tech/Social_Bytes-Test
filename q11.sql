CREATE TABLE Student (
    ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(25)
);

INSERT INTO Student (ID, Name, Age, Address)
VALUES
    (1, 'John Doe', 20, '123 Main St'),
    (2, 'Jane Smith', 22, '456 Elm St'),
    (3, 'Michael Johnson', 21, '789 Oak St'),
    (4, 'Emily Brown', 19, '101 Pine St'),
    (5, 'David Williams', 23, '222 Maple St');
    
