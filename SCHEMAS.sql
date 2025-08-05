DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;

CREATE TABLE IF NOT EXISTS authors(
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR (20) NOT NULL,
    last_name VARCHAR (20) NOT NULL,
    birth_date DATE
);

CREATE TABLE IF NOT EXISTS books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR (255) NOT NULL UNIQUE,
    author_id INT REFERENCES authors(author_id),
    publication_date DATE,
    price NUMERIC(6,2) CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    email VARCHAR (80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers (customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_amount NUMERIC (10,2) CHECK (total_amount >= 0)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id INT REFERENCES orders (order_id),
    book_id INT REFERENCES books (book_id),
    quantity INT CHECK (quantity > 0),
    price_at_purchase NUMERIC (6,2) NOT NULL,
    PRIMARY KEY (order_id, book_id)
);