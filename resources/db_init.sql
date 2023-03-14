CREATE TABLE employees
(
    id            INTEGER PRIMARY KEY NOT NULL,
    full_name     VARCHAR(255)        NOT NULL,
    department_id INTEGER             NOT NULL,
    job_id        INTEGER             NOT NULL,
    salary_id     INTEGER             NOT NULL,
    hire_date_id  INTEGER             NOT NULL
);

CREATE TABLE departments
(
    id          INTEGER PRIMARY KEY               NOT NULL,
    department  VARCHAR(50)                       NOT NULL,
    employee_id INTEGER REFERENCES employees (id) NOT NULL
);

CREATE TABLE salary
(
    id          INTEGER PRIMARY KEY               NOT NULL,
    salary      DECIMAL(12)                       NOT NULL,
    employee_id INTEGER REFERENCES employees (id) NOT NULL
);

CREATE TABLE hire_date
(
    id          INTEGER PRIMARY KEY               NOT NULL,
    hire_date   DATE                              NOT NULL,
    employee_id INTEGER REFERENCES employees (id) NOT NULL
);

CREATE TABLE jobs
(
    id          INTEGER PRIMARY KEY               NOT NULL,
    job_name    VARCHAR(50)                       NOT NULL,
    employee_id INTEGER REFERENCES employees (id) NOT NULL
);





