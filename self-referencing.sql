CREATE TABLE employees(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(300) NOT NULL,
    last_name VARCHAR(300) NOT NULL,
    supervisor_id INT REFERENCES employees(id) ON DELETE
    SET NULL
)

SELECT *
FROM employees AS e1
    INNER JOIN employees AS e2 ON e1.id=e2.supervisor_id

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL
);

CREATE TABLE user_friends(
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    friend_id INT REFERENCES users(id) ON DELETE CASCADE,
    CHECK (user_id < friend_id),
    PRIMARY KEY (user_id,friend_id)
)

INSERT INTO users (name)
VALUES ('Pratik'),('Rohan'),('Jigar');

INSERT INTO user_friends (user_id, friend_id)
VALUES (2,3);


-- DROP TABLE user_friends;
-- DROP TABLE users;