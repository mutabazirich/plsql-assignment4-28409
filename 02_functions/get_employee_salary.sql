CREATE OR REPLACE FUNCTION get_employee_salary (
    p_emp_id IN employees.emp_id%TYPE
)
RETURN NUMBER
IS
    v_salary employees.salary%TYPE;
BEGIN
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE emp_id = p_emp_id;

    RETURN v_salary;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'Employee does not exist.');
END;
/
