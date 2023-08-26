-- Create the 'library' database
CREATE DATABASE library;

-- Use the 'library' database
USE library;

-- Create the 'Books' table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(30),
    Category VARCHAR(30),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(30),
    Publisher VARCHAR(30)
);

-- Create the 'Branch' table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(30),
    Contact_no VARCHAR(15),
    FOREIGN KEY (Manager_Id) REFERENCES Employee(Emp_Id) ON DELETE CASCADE
);

-- Create the 'Employee' table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(30),
    Position VARCHAR(30),
    Salary DECIMAL(10, 2)
);

-- Create the 'Customer' table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_name VARCHAR(30),
    Customer_address VARCHAR(30),
    Reg_date DATE
);

-- Create the 'IssueStatus' table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(30),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN) ON DELETE CASCADE
);

-- Create the 'ReturnStatus' table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(30),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);

-- Insert 10 books into the 'Books' table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('9781234567891', 'The Catcher in the Rye', 'Fiction', 10.00, 'Yes', 'J.D. Salinger', 'Little, Brown'),
    ('9789876543211', 'To Kill a Mockingbird', 'Fiction', 12.00, 'No', 'Harper Lee', 'Grand Central'),
    ('9780241952476', '1984', 'Fiction', 11.00, 'Yes', 'George Orwell', 'Penguin Books'),
    ('9783698521471', 'The Hobbit', 'Fantasy', 15.00, 'No', 'J.R.R. Tolkien', 'Houghton Mifflin'),
    ('9781853260002', 'Romeo and Juliet', 'Drama', 10.00, 'Yes', 'William Shakespeare', 'Wordsworth Editions'),
    ('9789088888889', 'The Da Vinci Code', 'Mystery/Thriller', 12.99, 'Yes', 'Dan Brown', 'Doubleday'),
    ('9789999999991', 'The Lord of the Rings', 'Fantasy', 16.00, 'Yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
    ('9780765342984', 'Ender''s Game', 'Science Fiction', 11.99, 'Yes', 'Orson Scott Card', 'Tor Books'),
    ('9780345339683', 'Dune', 'Science Fiction', 14.99, 'Yes', 'Frank Herbert', 'Ace Books'),
    ('9780451457998', 'Neuromancer', 'Science Fiction', 9.99, 'Yes', 'William Gibson', 'Ace Books');


-- Insert 8 employees names into the 'Employee' table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary)
VALUES
    (113, 'Rahul Sharma', 'Manager', 45000.00),
    (114, 'Pooja Patel', 'Librarian', 25000.00),
    (115, 'Amit Kumar', 'Cataloguer', 28000.00),
    (116, 'Sneha Verma', 'Librarian', 26000.00),
    (117, 'Rajesh Singh', 'Circulation Desk Staff', 29000.00),
    (118, 'Neha Gupta', 'Manager', 47000.00),
    (119, 'Deepak Mishra', 'Manager', 49000.00),
    (120, 'Anjali Singh', 'Manager', 50000.00);

-- Insert 5 branches in India into the 'Branch' table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
    (6, 113, 'Mumbai, Maharashtra', '022-1234567'),
    (7, 118, 'Delhi, Delhi', '011-9876543'),
    (8, 119, 'Bangalore, Karnataka', '080-4567890'),
    (9, 114, 'Chennai, Tamil Nadu', '044-5678901'),
    (10, 120, 'Kolkata, West Bengal', '033-6789012');


-- Insert 12 customers into the 'Customer' table
INSERT INTO Customer (Customer_name, Customer_address, Reg_date)
VALUES
    ('Rajesh Kumar', 'Mumbai, Maharashtra', '2022-01-10'),
    ('Preeti Sharma', 'Delhi, Delhi', '2022-02-15'),
    ('Amit Verma', 'Bangalore, Karnataka', '2022-03-20'),
    ('Anjali Singh', 'Chennai, Tamil Nadu', '2022-04-25'),
    ('Neha Gupta', 'Kolkata, West Bengal', '2022-05-30'),
    ('Suresh Patel', 'Ahmedabad, Gujarat', '2022-06-05'),
    ('Rekha Reddy', 'Hyderabad, Telangana', '2022-07-10'),
    ('Manoj Mishra', 'Pune, Maharashtra', '2022-08-15'),
    ('Deepa Sharma', 'Jaipur, Rajasthan', '2022-09-20'),
    ('Rajeev Singh', 'Lucknow, Uttar Pradesh', '2022-10-25'),
    ('Ananya Roy', 'Kochi, Kerala', '2022-11-30'),
    ('Sandeep Kumar', 'Indore, Madhya Pradesh', '2022-12-05');


-- Insert 5 records into the 'IssueStatus' table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (1, 1, 'The Catcher in the Rye', '2023-08-01', '9781234567891'),
    (2, 2, 'To Kill a Mockingbird', '2023-08-02', '9789876543211'),
    (3, 3, '1984', '2023-08-03', '9780241952476'),
    (4, 4, 'The Hobbit', '2023-08-04', '9783698521471'),
    (5, 5, 'Romeo and Juliet', '2023-08-05', '9781853260002');


-- Insert 5 records into the 'ReturnStatus' table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Catcher in the Rye', '2023-08-10', '9781234567891'),
    (2, 2, 'To Kill a Mockingbird', '2023-08-12', '9789876543211'),
    (3, 3, '1984', '2023-08-15', '9780241952476'),
    (4, 4, 'The Hobbit', '2023-08-18', '9783698521471'),
    (5, 5, 'Romeo and Juliet', '2023-08-20', '9781853260002');


-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM IssueStatus AS I
JOIN Books AS B ON I.Isbn_book = B.ISBN
JOIN Customer AS C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Book_Count
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs. 50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000.00;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT B.Branch_no, COUNT(*) AS Employee_Count
FROM Branch AS B
LEFT JOIN Employee AS E ON B.Manager_Id = E.Emp_Id
GROUP BY B.Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT C.Customer_name
FROM Customer AS C
JOIN IssueStatus AS I ON C.Customer_Id = I.Issued_cust
WHERE DATE_FORMAT(I.Issue_date, '%Y-%m') = '2023-06';

-- 9. Retrieve 'book_title' from the 'Books' table containing "history."
SELECT Book_title
FROM Books
WHERE Category LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT B.Branch_no, COUNT(*) AS Employee_Count
FROM Branch AS B
LEFT JOIN Employee AS E ON B.Manager_Id = E.Emp_Id
GROUP BY B.Branch_no
HAVING COUNT(*) > 5;
