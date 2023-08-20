-- CREATE DATABASE indexes; -- Run this first + set up new connection thereafter
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- MySQL
    --   id SERIAL PRIMARY KEY,
    -- -- Postgresql
    first_name VARCHAR(300) NOT NULL,
    last_name VARCHAR(300) NOT NULL,
    email VARCHAR(300) UNIQUE NOT NULL,
    salary INT CHECK (salary > 0)
);
CREATE TABLE addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    --   id SERIAL PRIMARY KEY,
    street VARCHAR(300) NOT NULL,
    house_number VARCHAR(20) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(300) NOT NULL,
    -- could use separate table
    user_id INT REFERENCES users ON DELETE CASCADE
);
INSERT INTO users (first_name, last_name, email, salary)
VALUES ('Max', 'Schwarz', 'max@test.com', 11000),
    ('Manuel', 'Lorenz', 'manuel@test.com', 12800),
    ('Julie', 'Barnes', 'julie@test.com', 15000),
    ('Anna', 'Mayers', 'anna@test.com', 13000),
    ('Michael', 'Smit', 'michael@test.com', 9000),
    ('Frank', 'Kenneth', 'frank@test.com', 10000);
INSERT INTO addresses (street, house_number, postal_code, city, user_id)
VALUES ('Teststreet', '5A', '12345', 'Munich', 2),
    ('Some Place', '1', '12345', 'Munich', 1),
    ('My Street', '101', '98765', 'My City', 3),
    ('Foodstreet', '8', '41811', 'New York', 4),
    ('Teststreet', '10', '12345', 'Munich', 5),
    ('Teststreet', '11', '12345', 'Munich', 6);
EXPLAIN ANALYZE
SELECT *
FROM users
WHERE salary > 12000;
EXPLAIN ANALYZE
SELECT *
FROM addresses
WHERE street = 'Teststreet'
    AND city = 'Munich' CREATE INDEX salaryidx ON users(salary) CREATE INDEX multiaddr ON addresses(street, city) -- from left to right column optimized
    -- street and city will be optimized 
    -- street will be optimized
    -- city will not be optimized
    
CREATE INDEX salaryidx2 ON users(salary)
WHERE salary > 12000;