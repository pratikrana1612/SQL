CREATE DATABASE my_events;
CREATE TABLE cities(name VARCHAR(300) PRIMARY KEY);
CREATE TABLE location(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(300) NOT NULL,
    street VARCHAR(300) NOT NULL,
    house_number VARCHAR(30) NOT NULL,
    postal_code VARCHAR(30) NOT NULL,
    city_name VARCHAR(200) REFERENCES cities ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(300) NOT NULL,
    last_name VARCHAR(300) NOT NULL,
    birthdate DATE NOT NULL,
    email VARCHAR(300) NOT NULL
);
CREATE TABLE organizers(
    password VARCHAR(500) NOT NULL,
    user_id INT PRIMARY KEY REFERENCES users ON DELETE CASCADE
);
CREATE TABLE events(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL CHECK(LENGTH(name) > 5),
    date TIMESTAMP NOT NULL,
    image VARCHAR(300),
    description TEXT NOT NULL,
    max_participants INT CHECK(max_participants > 0),
    min_age INT CHECK(min_age > 0),
    location_id INT REFERENCES location(id) ON DELETE CASCADE,
    organizer_id INT REFERENCES organizers(user_id) ON DELETE CASCADE
);
CREATE TABLE tags(name VARCHAR(100) PRIMARY KEY);
CREATE TABLE events_users(
    event_id INT REFERENCES events ON DELETE CASCADE,
    user_id INT REFERENCES users ON DELETE CASCADE,
    PRIMARY KEY (event_id, user_id)
);
CREATE TABLE events_tags(
    event_id INT REFERENCES events ON DELETE CASCADE,
    tag_name VARCHAR(100) REFERENCES tags ON DELETE CASCADE,
    PRIMARY KEY (event_id, tag_name)
);
-- DROP TABLE events;
-- DROP TABLE location;
-- DROP TABLE cities;
-- DROP TABLE tags;
-- drop TABLE users;
-- DROP TABLE organizers;
-- DROP TABLE events_users
INSERT INTO tags (name)
VALUES ('socialize'),
    ('learn'),
    ('connect'),
    ('dinner'),
    ('breakfast');
INSERT INTO cities (name)
VALUES ('Munich'),
    ('Berlin'),
    ('Cologne'),
    ('Frankfurt'),
    ('Hamburg');
INSERT INTO location (
        title,
        street,
        house_number,
        postal_code,
        city_name
    )
VALUES (
        'Beerhall',
        'Beerstreet',
        '5A',
        '80135',
        'Munich'
    ),
    (NULL, 'Beerstreet', '10', '81035', 'Munich'),
    (NULL, 'Gardenstreet', '101', '80031', 'Munich'),
    (
        'The Green One',
        'Veggiestreet',
        '12',
        '12141',
        'Berlin'
    ),
    (NULL, 'Park Plaza', '1', '11011', 'Berlin'),
    (
        'Partyhouse',
        'Carnevalstreet',
        '3',
        '12345',
        'Cologne'
    ),
    (NULL, 'Some Street', '18', '72657', 'Hamburg');
ALTER TABLE location
MODIFY title VARCHAR(300)
INSERT INTO users (first_name, last_name, birthdate, email)
VALUES ('Max', 'Schwarz', '1989-05-01', 'max@test.com'),
    (
        'Manuel',
        'Lorenz',
        '1988-10-19',
        'manuel@test.com'
    ),
    (
        'Julie',
        'Barnes',
        '1986-02-13',
        'julie@test.com'
    ),
    (
        'Michael',
        'Smith',
        '1982-11-11',
        'michael@test.com'
    );
INSERT INTO organizers (password, user_id)
VALUES ('mypw1', 1),
    -- passwords would typically be stored encrypted
    ('somepw2', 2);
INSERT INTO events (
        name,
        date,
        image,
        description,
        max_participants,
        min_age,
        location_id,
        organizer_id
    )
VALUES (
        'New in town',
        '2022-02-01 17:30:00',
        'path/to/image.jpg',
        'You are new in town? Join us and meet like-minded new people!',
        20,
        16,
        1,
        1
    );
INSERT INTO events_tags (event_id, tag_name)
VALUES (1, 'socialize'),
    (1, 'connect'),
    (1, 'dinner');
INSERT INTO events_users (event_id, user_id)
VALUES (1, 3),
    (1, 4);
SELECT *
FROM events AS e
    INNER JOIN location AS l ON e.location_id = l.id
    INNER Join events_users AS eu ON e.id = eu.event_id
    INNER JOIN users AS u ON u.id = eu.user_id
SELECT *
FROM location AS l
    LEFT JOIN events AS e ON e.location_id = l.id;

SELECT *
FROM cities AS c
    LEFT JOIN location AS l ON c.name = l.city_name
    LEFT JOIN events AS e ON e.location_id = l.id
WHERE city_name = 'Munich'

SELECT first_name
FROM users
WHERE first_name like 'ma_'

SELECT count(id)
FROM location

SELECT c.name,
    count(l.id)
FROM cities AS c
    LEFT Join location AS l on c.name = l.city_name
GROUP BY c.name
HAVING COUNT(l.id) > 1

SELECT *
FROM cities AS c
    LEFT Join location AS l on c.name = l.city_name

UPDATE events
SET location_id = 8
WHERE id = 1