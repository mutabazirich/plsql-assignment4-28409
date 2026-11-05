CREATE OR REPLACE PROCEDURE set_employee_salary (
    p_emp_id     IN employees.emp_id%TYPE,
    p_new_salary IN employees.salary%TYPE
)
IS
    e_invalid_salary EXCEPTION;
BEGIN
    IF p_new_salary <= 0 THEN
        RAISE e_invalid_salary;
    END IF;

    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20012, 'Employee does not exist.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
EXCEPTION
    WHEN e_invalid_salary THEN
        RAISE_APPLICATION_ERROR(-20013, 'Salary must be greater than zero.');
    WHEN OTHERS THEN
        RAISE;
END;
/
