-- Create Database
CREATE DATABASE LibraryDB;

-- Use Database
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublicationYear INT,
    Genre VARCHAR(50),
    AvailableCopies INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    MembershipDate DATE,
    Email VARCHAR(100) UNIQUE
);

-- Borrow Table
CREATE TABLE Borrow (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert Authors
INSERT INTO Authors (FirstName, LastName, BirthDate)
VALUES
('George', 'Orwell', '1903-06-25'),
('Jane', 'Austen', '1775-12-16'),
('Mark', 'Twain', '1835-11-30');

-- Insert Books
INSERT INTO Books (Title, AuthorID, PublicationYear, Genre, AvailableCopies)
VALUES
('1984', 1, 1949, 'Dystopian', 5),
('Pride and Prejudice', 2, 1813, 'Romance', 3),
('The Adventures of Huckleberry Finn', 3, 1884, 'Adventure', 4);

-- Insert Members
INSERT INTO Members (FullName, MembershipDate, Email)
VALUES
('Alice Johnson', '2023-01-15', 'alice@example.com'),
('Bob Smith', '2023-02-20', 'bob@example.com'),
('Charlie Brown', '2023-03-05', 'charlie@example.com');

-- Insert Borrow Data
INSERT INTO Borrow (MemberID, BookID, BorrowDate, ReturnDate)
VALUES
(1, 1, '2023-04-01', '2023-04-10'),
(2, 2, '2023-04-05', NULL),
(3, 3, '2023-04-07', '2023-04-15');

-- View Data
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;

-- Join Queries
SELECT B.Title, A.FirstName, A.LastName
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;

SELECT M.FullName, B.Title, BR.BorrowDate, BR.ReturnDate
FROM Borrow BR
JOIN Members M ON BR.MemberID = M.MemberID
JOIN Books B ON BR.BookID = B.BookID;

SELECT M.FullName, B.Title
FROM Borrow BR
JOIN Members M ON BR.MemberID = M.MemberID
JOIN Books B ON BR.BookID = B.BookID
WHERE BR.ReturnDate IS NULL;

SELECT A.FirstName, COUNT(B.BookID) AS TotalBooks
FROM Authors A
LEFT JOIN Books B ON A.AuthorID = B.AuthorID
GROUP BY A.FirstName;