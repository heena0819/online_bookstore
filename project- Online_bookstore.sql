DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10, 2),
	Stock INT);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(150),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID SERIAL REFERENCES Customers(Customer_ID),
	Book_ID SERIAL REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--IMPORT DATA INTO BOOKS TABLE
--IMPORT DATA INTO CUSTOMERS TABLE
--IMPORT DATA INTO ORDERS TABLE

-- BASIC QUERIES

--Retrieve all books in the 'fiction' genre:

SELECT * FROM Books
WHERE Genre = 'Fiction';

--Find books published after the year 1950:

SELECT * FROM Books
WHERE Published_Year > 1950;

--List all customers from the Canada:

SELECT * FROM Customers
WHERE Country = 'Canada';

--Show orders placed in November 2023:

SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--Retrieve the total stock of books available:

SELECT SUM(Stock) AS Total_Stock
FROM Books;

--Find the details of the most expensive book:

SELECT * FROM Books
ORDER BY Price DESC
LIMIT 1;

--Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM Orders 
WHERE Quantity > 1;

--Retrieve all orders where the total amount exceeds $20:

SELECT * FROM Orders 
WHERE Total_Amount > 20;

--List all genres available in the Books table:

SELECT DISTINCT Genre FROM Books;

--Find the book with the lowest stock:

SELECT * FROM Books 
ORDER BY Stock ASC 
LIMIT 1;

--Calculate the total revenue generated from all orders:

SELECT SUM(Total_Amount) AS Revenue FROM ORDERS;


--ADVANCE QUERIES


--Retrieve the total number of books sold for each genre:

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o JOIN Books b 
ON o.book_ID = b.book_ID
GROUP BY b.Genre;

--Find the average price of books in the "Fantasy" genre:

SELECT AVG(Price) AS Avg_Price
FROM Books
WHERE Genre = 'Fantasy';

--List customers who have placed at least 2 orders:

SELECT c.name, o.customer_ID, COUNT(o.Order_ID) AS Order_Count
FROM Orders o JOIN Customers c
ON o.customer_ID = c.customer_ID
GROUP BY o.Customer_ID, c.name
HAVING COUNT(Order_ID) >= 2;

--Find the most frequently ordered book:

SELECT c.name, o.Book_ID, COUNT(o.Order_ID) AS Order_Count FROM
Orders o JOIN Customers c
ON o.customer_ID = c.customer_ID
GROUP BY o.Book_ID, c.name
ORDER BY Order_Count DESC
LIMIT 1;
 
--Show the top 3 most expensive books of 'Fantasy' Genre:

SELECT * FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

--Retrieve the total quantity of books sold by each author:

SELECT b.Author, SUM(o.Quantity) AS Books_Sold FROM 
Books b JOIN Orders o
ON b.book_ID = o.book_ID
GROUP BY b.Author;

--List the cities where customers who spent over $30 are located:

SELECT DISTINCT c.City, o.Total_Amount FROM
Orders o JOIN Customers c
ON c.customer_ID = o.customer_ID
WHERE o.Total_Amount > 30;


--Find the customer who spent the most on orders:

SELECT c.customer_ID, c.name, SUM(o.Total_Amount) AS Total_Spent FROM
Orders o JOIN Customers c
ON c.customer_ID = o.customer_ID
GROUP BY c.customer_ID, c.name
ORDER BY Total_Spent DESC
LIMIT 1;




