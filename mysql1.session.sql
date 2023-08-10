-- CREATE TABLE users(
--   full_name VARCHAR(200),
--   yearly_salary INT,
--   current_status ENUM('employed', 'self-employed', 'unemployed')
-- )
-- INSERT INTO users (full_name, yearly_salary, current_status)
-- VALUES (
--     'Pratik Rana',
--     100000,
--     'self-employed'
--   );
-- INSERT INTO users (full_name, yearly_salary, current_status)
-- VALUES (
--     'Rohan Prajapati',
--     150000,
--     'employed' c
--   );
-- INSERT INTO users (full_name, yearly_salary, current_status)
-- VALUES ('Shruti Prajapti', 0, 'unemployed');
-- CREATE TABLE employers(
--   company_name VARCHAR(200),
--   company_address VARCHAR(300),
--   yearly_revenue NUMERIC(5, 2),
--   is_hiring BOOLEAN DEFAULT FALSE
-- );
-- CREATE TABLE conversations(
--   user_name VARCHAR(200),
--   employer_name VARCHAR(200),
--   message TEXT,
--   date_sent TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- )
-- INSERT INTO employers (
--     company_name,
--     company_address,
--     yearly_revenue,
--     is_hiring
--   )
-- VALUES (
--     'Gopal',
--     'parle-g ni baju ma',
--     '0.77',
--     true
--   );
-- INSERT INTO employers (
--     company_name,
--     company_address,
--     yearly_revenue,
--     is_hiring
--   ) -- VALUES (
--   'Parle-g',
--   'raipur bajiya vada ni baju ma',
--   0.82
-- );
INSERT INTO conversations (user_name, employer_name, message)
VALUES (
    'Pratik',
    'gopal',
    'i want some people to work '
  );
ALTER TABLE employers
MODIFY COLUMN yearly_revenue FLOAT(5, 2);
ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(300);

ALTER TABLE users
MODIFY COLUMN full_name VARCHAR(300) NOT NULL,
MODIFY COLUMN current_status ENUM('employed', 'self-employed', 'unemployed') NOT NULL

ALTER TABLE users
ADD CONSTRAINT yearly_salary_positive CHECK (yearly_salary > 0)

UPDATE users
SET yearly_salary=NULL
WHERE full_name='Shruti Prajapti'

-- DROP TABLE users;
-- DROP TABLE conversations;
-- drop TABLE employers;

CREATE TABLE users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(300) NOT NULL,
  yearly_salary INT CHECK (yearly_salary>0),
  current_status ENUM('employed', 'self-employed', 'unemployed')
);

CREATE TABLE employers(
  id INT PRIMARY KEY AUTO_INCREMENT,
  company_name VARCHAR(200) NOT NULL,
  company_address VARCHAR(300) NOT NULL,
  yearly_revenue FLOAT CHECK (yearly_revenue>0),
  is_hiring BOOLEAN DEFAULT FALSE
);

CREATE TABLE conversations(
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  company_id INT,
  message TEXT NOT NULL 
);