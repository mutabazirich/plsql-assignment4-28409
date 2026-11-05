CREATE OR REPLACE PROCEDURE update_employee_salary (
    p_emp_id      IN employees.emp_id%TYPE,
    p_new_salary  IN employees.salary%TYPE
)
IS
BEGIN
    IF p_new_salary <= 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Salary must be greater than zero.');
    END IF;

    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Salary updated. Rows affected: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee matched that ID. Rows affected: ' || SQL%ROWCOUNT);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
