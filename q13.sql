# Creating Table & Adding data
-- Create Person table
CREATE TABLE Person (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Insert sample data into Person table
INSERT INTO Person (PersonId, FirstName, LastName)
VALUES
    (1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Michael', 'Johnson'),
    (4, 'Emily', 'Brown'),
    (5, 'David', 'Williams');

-- Create Address table
CREATE TABLE Address (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(50),
    State VARCHAR(50)
);

-- Insert sample data into Address table
INSERT INTO Address (AddressId, PersonId, City, State)
VALUES
    (1, 1, 'New York', 'NY'),
    (2, 2, 'Los Angeles', 'CA'),
    (3, 3, 'Chicago', 'IL'),
    (4, 4, 'Houston', 'TX'),
    (5, 5, 'Miami', 'FL');


# Retrieve the names and addresses of all persons from the "Person" table along with their corresponding addresses from the "Address" table.
SELECT
    p.FirstName,
    p.LastName,
    a.City,
    a.State
FROM
    Person p
JOIN
    Address a ON p.PersonId = a.PersonId;
