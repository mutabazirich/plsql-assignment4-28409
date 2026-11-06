
CREATE TABLE departments (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(100) NOT NULL
);

CREATE TABLE employees (
    emp_id   NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100) NOT NULL,
    salary   NUMBER(12,2) NOT NULL CHECK (salary > 0),
    dept_id  NUMBER NOT NULL,
    CONSTRAINT fk_employees_department
        FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

PROMPT Tables created successfully.
