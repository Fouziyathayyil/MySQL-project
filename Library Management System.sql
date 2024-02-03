CREATE DATABASE library;

USE library;

# create table branch
CREATE TABLE branch(
Branch_no INT PRIMARY KEY,
Manager_id INT,
Branch_address VARCHAR(100),
Contact_no VARCHAR(20)
);

# create table employee
CREATE TABLE employee(
Emp_id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES branch(Branch_no)
);

# create table customer
CREATE TABLE customer(
Customer_id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(100),
Reg_date DATE
);

# create table issuestatus
CREATE TABLE issuestatus(
Issue_id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id),
FOREIGN KEY (Isbn_book) REFERENCES books(Isbn)
);

# create table returnstatus
CREATE TABLE returnstatus(
Return_id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(50),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Isbn_book2) REFERENCES books(Isbn)
);

# create table books
CREATE TABLE books(
Isbn INT PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(50),
Rental_price DECIMAL(10,2),
Status VARCHAR(3),
Author VARCHAR(50),
Publisher VARCHAR(50)
);

INSERT INTO branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES
    (1, 101, '123 Main St', '555-1234'),
    (2, 102, '456 Oak St', '555-5678'),
    (3, 103, '789 Pine St', '555-9876'),
    (4, 104, '321 Elm St', '555-4321'),
    (5, 105, '555 Maple St', '555-8765'),
    (6, 106, '876 Birch St', '555-2109'),
    (7, 107, '234 Cedar St', '555-6789'),
    (8, 108, '987 Walnut St', '555-3456'),
    (9, 109, '543 Oak St', '555-8901'),
    (10, 110, '678 Pine St', '555-6543');
    
INSERT INTO employee (Emp_id, Emp_name, Position, Salary, Branch_no)
VALUES
    (201, 'John Doe', 'Manager', 60000.00, 1),
    (202, 'Jane Smith', 'Clerk', 45000.00, 1),
    (203, 'Bob Johnson', 'Clerk', 50000.00, 2),
    (204, 'Mary White', 'Manager', 62000.00, 2),
    (205, 'Sam Black', 'Clerk', 48000.00, 3),
    (206, 'Emily Green', 'Clerk', 52000.00, 3),
    (207, 'David Brown', 'Manager', 65000.00, 4),
    (208, 'Sara Jones', 'Clerk', 47000.00, 4),
    (209, 'Chris Davis', 'Manager', 70000.00, 5),
    (210, 'Lisa Taylor', 'Clerk', 49000.00, 5);
    
INSERT INTO customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES
    (301, 'Alice Brown', '789 Elm St', '2022-01-15'),
    (302, 'Charlie Davis', '101 Pine St', '2021-12-10'),
    (303, 'Eva Wilson', '543 Maple St', '2022-02-20'),
    (304, 'Greg Miller', '876 Oak St', '2021-11-05'),
    (305, 'Hannah Smith', '234 Cedar St', '2022-03-25'),
    (306, 'Ian Johnson', '987 Birch St', '2022-04-12'),
    (307, 'Jenny White', '321 Pine St', '2021-10-30'),
    (308, 'Kevin Black', '555 Walnut St', '2022-05-18'),
    (309, 'Laura Taylor', '876 Cedar St', '2021-09-15'),
    (310, 'Mike Davis', '678 Birch St', '2022-06-10');
    
INSERT INTO books (Isbn, Book_title, Category, Rental_price, Status, Author, Publisher)
VALUES
    (101, 'The Great Gatsby', 'Fiction', 5.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
    (102, 'To Kill a Mockingbird', 'Fiction', 6.99, 'yes', 'Harper Lee', 'J.B. Lippincott'),
    (103, '1984', 'Science Fiction', 7.99, 'yes', 'George Orwell', 'Penguin'),
    (104, 'The Catcher in the Rye', 'Fiction', 8.99, 'yes', 'J.D. Salinger', 'Little, Brown'),
    (105, 'Brave New World', 'Science Fiction', 9.99, 'yes', 'Aldous Huxley', 'Harper'),
    (106, 'The Lord of the Rings', 'Fantasy', 10.99, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
    (107, 'Pride and Prejudice', 'Classic', 11.99, 'yes', 'Jane Austen', 'Thomas Egerton'),
    (108, 'The Hobbit', 'Fantasy', 12.99, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
    (109, 'To the Lighthouse', 'Classic', 13.99, 'yes', 'Virginia Woolf', 'Hogarth Press'),
    (110, 'Moby-Dick', 'Adventure', 14.99, 'yes', 'Herman Melville', 'Richard Bentley');
    
INSERT INTO issuestatus (Issue_id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (401, 301, 'The Great Gatsby', '2022-02-01', 101),
    (402, 302, 'To Kill a Mockingbird', '2022-01-20', 102),
    (403, 303, '1984', '2022-03-10', 103),
    (404, 304, 'The Catcher in the Rye', '2021-11-15', 104),
    (405, 305, 'Brave New World', '2022-04-05', 105),
    (406, 306, 'The Lord of the Rings', '2022-04-20', 106),
    (407, 307, 'Pride and Prejudice', '2021-10-25', 107),
    (408, 308, 'The Hobbit', '2022-05-10', 108),
    (409, 309, 'To the Lighthouse', '2021-09-30', 109),
    (410, 310, 'Moby-Dick', '2022-06-15', 110);
    
INSERT INTO returnstatus (Return_id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (501, 301, 'The Great Gatsby', '2022-02-15', 101),
    (502, 302, 'To Kill a Mockingbird', '2022-02-10', 102),
    (503, 303, '1984', '2022-03-25', 103),
    (504, 304, 'The Catcher in the Rye', '2022-01-01', 104),
    (505, 305, 'Brave New World', '2022-04-20', 105),
    (506, 306, 'The Lord of the Rings', '2022-05-05', 106),
    (507, 307, 'Pride and Prejudice', '2021-11-10', 107),
    (508, 308, 'The Hobbit', '2022-05-25', 108),
    (509, 309, 'To the Lighthouse', '2021-10-15', 109),
    (510, 310, 'Moby-Dick', '2022-06-30', 110);
    
# Retrieve the book title, category, and rental price of all available books
SELECT book_title, category, rental_price FROM books WHERE status='yes';

# List the employee names and their respective salaries in descending order of salary
SELECT Emp_name , salary FROM employee ORDER BY salary DESC;

#  Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title , c.customer_name 
FROM books b join issuestatus i ON b.isbn=i.isbn_book
JOIN customer c ON i.issued_cust=c.customer_id;

# Display the total count of books in each category.
SELECT category, count(*) AS total_books FROM books GROUP BY category;

# Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name , position FROM employee WHERE salary >50000;

# List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT customer_name from customer WHERE Reg_date < '2022-01-01'
AND customer_id NOT IN (SELECT Issued_cust FROM issuestatus);

# Display the branch numbers and the total count of employees in each branch
SELECT Branch_no , count(*) AS emp_count FROM employee GROUP BY Branch_no;

#  Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.customer_name FROM customer c JOIN issuestatus i
ON c.customer_id = i.issued_cust
WHERE month(i.issue_date)=6 AND year(i.issue_date) =2023;

# Retrieve book_title from book table containing history
SELECT Book_title FROM books WHERE category='History';

# Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_no , count(*) AS emp_count FROM employee GROUP BY branch_no HAVING count(*)>5;
 