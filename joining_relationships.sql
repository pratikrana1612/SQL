SELECT u.id,
    first_name,
    a.street,
    c.name AS city_name
FROM users AS u
    INNER JOIN addresses AS a ON u.address_id = a.id
    INNER JOIN cities AS c ON a.city_id = c.id
WHERE city_Id = 1
    or city_Id = 2;


SELECT *
FROM addresses AS a
    LEFT JOIN users AS u ON u.address_id = a.id
    LEFT JOIN cities AS c ON a.city_Id = c.id;

SELECT c.name AS city_name,
    a.house_number,
    a.street
FROM cities AS c
    LEFT JOIN addresses AS a ON c.id = a.city_id
    LEFT JOIN users AS u ON u.address_id = a.id -- WHERE u.first_name IS NOT NULL


SELECT *
FROM users
WHERE id < 3
UNION
SELECT *
FROM users
WHERE id > 5;

SELECT id,first_name FROM users
UNION 
SELECT id,street FROM addresses