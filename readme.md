## 1. What is PostgreSQL?

PostgreSQL is a relational database management system. It is open-source and one of the most widely used database systems. It supports Structured Query Language (SQL) and includes advanced features such as:

- Transactions  
- Indexing  
- Triggers  
- Stored Procedures  

PostgreSQL is known for its **reliability**, **flexibility**, and **compliance with standards**, making it popular for both small and large applications.

---

## 2. What is the purpose of a database schema in PostgreSQL?

A **schema** in PostgreSQL is a way to logically organize and group database objects such as:

- Tables  
- Views  
- Indexes  
- Functions  

Schemas help to:

- Separate different parts of the database logically  
- Prevent naming conflicts between objects  
- Manage permissions and access control more efficiently  

---

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

- **Primary Key**:  
  A column (or set of columns) that uniquely identifies each row in a table.  
  - Must be unique  
  - Cannot be `NULL`

- **Foreign Key**:  
  A column that links to the primary key of another table to maintain **referential integrity** between records.

---

## 4. What is the difference between the `VARCHAR` and `CHAR` data types?

- **`VARCHAR(n)`**:  
  Stores variable-length strings up to `n` characters. It uses space only for the actual content.  
  Example: `VARCHAR(50)` for names of varying length.

- **`CHAR(n)`**:  
  Stores fixed-length strings. Shorter strings are right-padded with spaces.  
  Example: `CHAR(10)` will always store exactly 10 characters.

---

## 5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.

The `WHERE` clause is used to **filter rows** based on specific conditions. It allows retrieval of only those rows that match certain criteria.

**Example:**
```sql
SELECT * FROM students WHERE age > 18;
