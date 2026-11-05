CREATE OR REPLACE PROCEDURE add_employee (
    p_emp_id   IN employees.emp_id%TYPE,
    p_emp_name IN employees.emp_name%TYPE,
    p_salary   IN employees.salary%TYPE,
    p_dept_id  IN employees.dept_id%TYPE
)
IS
BEGIN
    INSERT INTO employees (emp_id, emp_name, salary, dept_id)
    VALUES (p_emp_id, p_emp_name, p_salary, p_dept_id);

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee inserted. Rows affected: ' || SQL%ROWCOUNT);
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20010, 'An employee with this ID already exists.');
    WHEN OTHERS THEN
        RAISE;
END;
/
