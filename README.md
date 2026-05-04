# Library Management System (SQL Project)

## Overview.

This project is a relational database system designed to manage a library. It stores and organizes data related to authors, books, members, and borrowing transactions. The project demonstrates practical use of SQL for real-world data management.

## Features

* Manage authors and their books
* Maintain records of library members
* Track book borrowing and return activity
* Identify books that are not yet returned

## Tech Stack

* MySQL
* SQL (DDL, DML, Joins, Aggregations)

## Database Structure

The database consists of the following tables:

* Authors: Stores author details
* Books: Stores book information
* Members: Stores member details
* Borrow: Tracks book issue and return records

## Relationships

* One author can have multiple books
* One member can borrow multiple books
* Each borrow record links a member to a book

## Key Concepts Used

* Primary Key and Foreign Key constraints
* INNER JOIN and LEFT JOIN
* Aggregate functions such as COUNT
* Data integrity using UNIQUE and NOT NULL constraints

## Sample Queries

### Retrieve Books with Authors

```sql
SELECT B.Title, A.FirstName, A.LastName
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID;
```

### Find Pending Returns

```sql
SELECT M.FullName, B.Title
FROM Borrow BR
JOIN Members M ON BR.MemberID = M.MemberID
JOIN Books B ON BR.BookID = B.BookID
WHERE BR.ReturnDate IS NULL;
```

## How to Run

1. Open MySQL Workbench or phpMyAdmin
2. Create a new database or use an existing one
3. Copy and execute the SQL script provided in the repository
4. Run SELECT queries to verify and explore the data

## Future Improvements

* Implement fine calculation for late returns
* Add stored procedures for issuing and returning books
* Integrate with a frontend interface
* Build a Power BI dashboard for reporting

## Author

Kunal Rajput
Aspiring Data Analyst
