# postgresql-bookstore-project
This is a PostgreSQL database for a fictional e-commerce bookstore, designed to practice advanced SQL and database management

Basics queries
For this example I used an INNER JOIN to connect the authors and books tables on their common author_id column and selected the right information from each.

SELECT b.title, a.first_name, a.last_name
FROM authors a
JOIN books b ON a.author_id = b.author_id;
