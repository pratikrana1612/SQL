CREATE DATABASE relations;

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- id SERIAL PRIMARY KEY,
    first_name VARCHAR(300)  NOT NULL,
    last_name VARCHAR(300)  NOT NULL,
    email VARCHAR(300) NOT NULL,
    address_id INT ,
    FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE RESTRICT
);

CREATE TABLE addresses(
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- id SERIAL PRIMARY KEY,
    street VARCHAR(200) NOT NULL,
    house_number VARCHAR(200) NOT NULL,
    city_Id INT,
    FOREIGN KEY (city_id) REFERENCES cities(id) ON DELETE RESTRICT
);

CREATE TABLE cities(
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

INSERT INTO cities(name)
VALUES('Berlin'),('New York'),('London');

INSERT INTO addresses (street, house_number, city_Id)
VALUES (
    'Teststreet',
    '8A',
    3
  ),
  (
    'Some Street',
    '10',
    1
  ),(
    'Teststreet',
    '8A',
    3
  ),(
    'Mystreet',
    '101',
    2
  );

INSERT INTO users (first_name, last_name, email, address_id)
VALUES (
    'Rana',
    'Pratik',
    'ranapratik1612@gmail.com',
    2
),
(
    'Gapa',
    'Jaivik',
    'jaivik123@gmail.com',
    4
),(
    'Prajapati',
    'Rohan',
    'rohan332@gmail.com',
    3
);



INSERT INTO cities (name)
VALUES ('Munich'), ('Rome'), ('Tokyo'), ('Washington, D.C.');

INSERT INTO addresses (street, house_number, city_id)
VALUES 
  ('Beerstreet', '91', 4),
  ('Beerstreet', '12', 4),
  -- ('Pizzastreet', '1', 5),
  ('Burgerstreet', '9', 2),
  ('Anotherstreet', '12', 1),
  ('Smallstreet', '11', 3);


INSERT INTO users (first_name, last_name, email, address_id)
VALUES 
  ('Marina', 'Marks', 'marina@test.com', 2),
  ('Hans', 'Mayer', 'hansm@test.com', 5)
  -- ('Maria', 'Marionatti', 'maria@test.com', 7),
  -- ('Michael', 'Smith', 'michael@test.com', 8);

DROP TABLE users;
DROP TABLE addresses;
DROP TABLE cities;

SELECT * FROM users AS u
LEFT JOIN addresses AS a ON u.address_id=a.id
LEFT JOIN cities AS c ON a.city_Id=c.id;