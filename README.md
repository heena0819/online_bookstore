# Online Bookstore Database Project

This project is a SQL-based simulation of an **Online Bookstore** system. It includes the design and implementation of the database schema using SQL commands like `CREATE`, `INSERT`, and `SELECT`, and demonstrates how a typical online bookstore might handle books, authors, customers, orders, and payments.

##  Project Objectives

- Design a relational database for an online bookstore.
- Define relationships between books, customers, authors, and orders.
- Practice SQL skills including table creation, data insertion, joins, and queries.

## Tools Used

- **Database**: PostgreSQL
- **Language**: SQL

## Database Schema

The project consists of the following main tables:

- **Author**: Stores details about authors.
- **Book**: Contains information about books available in the store.
- **Customer**: Holds customer information.
- **Orders**: Tracks customer orders.
- **OrderDetails**: Stores detailed info about each order (books ordered and quantity).
- **Payments**: Manages payment transactions.

### Example Table Relationships

- A **book** is written by an **author**.
- A **customer** can place multiple **orders**.
- Each **order** can contain multiple **books**.
- Each **order** is associated with one **payment**.

## Sample Queries

The SQL script includes a variety of queries, such as:

- Fetching all book titles along with their authors.
- Calculating total sales per book.
- Listing all customers who have made a purchase.
- Retrieving orders within a certain date range.

