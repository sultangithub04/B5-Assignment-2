1. What is PostgreSQL?
PostgreSQLis relational database management system, its open source and mostly used database system. Its supports Structured Query Language (SQL).  It have advanced features like transactions, indexing, triggers, and stored procedures. Its known forreliability, flexibility, and compliance with standards, making  popular for both small and large applications.
________________________________________
2. What is the purpose of a database schema in PostgreSQL?
Schema ofPostgreSQL is a way to organize and group database objects such as tables, views, indexes, and functions.
Schemas help:
•	Separate different parts of the database logically.
•	Prevent name conflicts between objects.
•	Manage permissions and access control more easily.
________________________________________
3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
•	Primary Key:
A column (or a set of columns) that uniquely identifies each row in a table. It cannot contain NULL values and must be unique.

•	Foreign Key:
A column that creates a link between two tables. It references the primary key of another table and ensures referential integrity.

________________________________________
4. What is the difference between the VARCHAR and CHAR data types?
•	VARCHAR(n): Stores a variable length string up to n characters. Only uses space needed for the actual content.

Example: VARCHAR(50) for names of varying length.
•	CHAR(n): Stores a fixed length string of exactly n characters. If the string is shorter, it is padded with spaces.
Example: CHAR(10) will always store 10 characters, even if only 4 are used.
________________________________________
5. Explain the purpose of the WHERE clause in a SELECT statement.
WHERE used forfilter rows based on conditions. Its allows to select only those rows that meet certain criteria.
Example:
SELECT * FROM students WHERE age > 18;
Returns only the students who are older than 18.
________________________________________
6. What are the LIMIT and OFFSET clauses used for?
This is commonly used for pagination.
LIMIT: Specifies maximum number of rows return.
OFFSET: Skips a specific number rowbefore starting to return results.
Example:
SELECT * FROM students LIMIT 5 OFFSET 10;
This returns 5 students, starting from the 11st row (skips first 10).

