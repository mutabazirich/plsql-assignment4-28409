CREATE OR REPLACE PROCEDURE delete_employee (
    p_emp_id IN employees.emp_id%TYPE
)
IS
BEGIN
    DELETE FROM employees
    WHERE emp_id = p_emp_id;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee was deleted. No matching ID was found.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee deleted. Rows affected: ' || SQL%ROWCOUNT);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
