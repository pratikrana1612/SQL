CREATE TABLE projects(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    deadline DATE
);
CREATE TABLE buildings(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL
);
CREATE TABLE teams(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    building_id INT,
    FOREIGN KEY (building_id) REFERENCES buildings(id) ON DELETE
    SET NULL
);
CREATE TABLE employees(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    birthdate DATE NOT NULL,
    email VARCHAR(300) UNIQUE NOT NULL,
    team_id INT DEFAULT 1,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE
    SET DEFAULT
);
CREATE TABLE intranet_accounts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(300) NOT NULL,
    password VARCHAR(300) NOT NULL,
    FOREIGN KEY (email) REFERENCES employees(email) ON DELETE CASCADE
);
CREATE TABLE projects_employees(
    id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    FOREIGN KEY(emp_id) REFERENCES employees(id) ON DELETE CASCADE,
    FOREIGN KEY(project_id) REFERENCES projects(id) ON DELETE CASCADE
);
INSERT INTO employees(first_name, last_name, birthdate, email)
VALUES (
        'Praitk',
        'Rana',
        '2003-12-16',
        'ranapartik1612@gmail.com'
    ),
    (
        'Jigar',
        'Rana',
        '1996-10-17',
        'ranajigar1017@gmail.com'
    );
INSERT INTO intranet_accounts (email, password)
VALUES (
        'ranapartik1612@gmail.com',
        'password'
    ),
    (
        'ranajigar1017@gmail.com',
        'password2'
    )
INSERT INTO buildings (name)
VALUES ('Main Building'),
    ('Research Lab'),
    ('Darkroom');
INSERT INTO teams (name, building_id)
VALUES ('Admin', 1),
    ('Data Analysts', 3),
    ('R&D', 2);
INSERT INTO employees (first_name, last_name, birthdate, email, team_id)
VALUES (
        'Julie',
        'Barnes',
        '1988-10-01',
        'julie@test.com',
        3
    ),
    (
        'Max',
        'Schwarz',
        '1989-06-10',
        'max@test.com',
        1
    ),
    (
        'Manuel',
        'Lorenz',
        '1987-01-29',
        'manu@test.com',
        2
    ),
    (
        'Michael',
        'Smith',
        '1977-05-12',
        'michael@test.com',
        2
    );
INSERT INTO intranet_accounts (email, password)
VALUES ('max@test.com', 'abcae1'),
    ('manu@test.com', 'fdasfdas1'),
    ('julie@test.com', 'adsfsaf3'),
    ('michael@test.com', 'adsfsaf3');
INSERT INTO projects (title, deadline)
VALUES ('Mastering SQL', '2024-10-01'),
    ('New Hire Onboarding', '2022-02-28'),
    ('New Course Evaluation', '2022-01-01');
INSERT INTO projects_employees (emp_id, project_id)
VALUES (1, 2),
    (2, 2),
    (1, 3),
    (3, 1),
    (3, 3),
    (2, 3);
SELECT *
FROM employees AS e
    INNER JOIN intranet_accounts AS ia ON e.email = ia.email;
SELECT e.id,e.first_name,pe.emp_id,pe.project_id,p.id,p.title,p.deadline
FROM employees AS e
    LEFT JOIN projects_employees AS pe ON  e.id=pe.emp_id
    LEFT JOIN projects AS p ON p.id=pe.project_id

SELECT *
FROM employees AS e
    LEFT JOIN teams AS t ON t.id=e.team_id
    WHERE t.name='Data Analysts'

SELECT * 
FROM employees AS e
    INNER JOIN teams AS t ON e.team_id=t.id
    INNER JOIN buildings AS b ON b.id=t.building_id
    ORDER BY e.birthdate

-- DROP TABLE intranet_accounts;
    -- DROP TABLE employees;
    -- DROP TABLE teams;
    -- DROP TABLE projects;
    -- DROP TABLE buildings;
    -- DROP TABLE projects_employees;

DELETE FROM buildings WHERE id=2;
DELETE FROM employees WHERE id=2;