-- Run this script once after creating the tables.
INSERT INTO departments (dept_id, dept_name) VALUES (1, 'IT');
INSERT INTO departments (dept_id, dept_name) VALUES (2, 'HR');
INSERT INTO departments (dept_id, dept_name) VALUES (3, 'Finance');
INSERT INTO departments (dept_id, dept_name) VALUES (4, 'Marketing');

INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (101, 'John', 500000, 1);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (102, 'Mary', 450000, 2);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (103, 'Peter', 600000, 3);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (104, 'Alice', 550000, 1);
INSERT INTO employees (emp_id, emp_name, salary, dept_id)
VALUES (105, 'James', 400000, 4);

COMMIT;

PROMPT Sample departments and employees inserted.
