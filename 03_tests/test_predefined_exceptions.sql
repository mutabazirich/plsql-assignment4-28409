SET SERVEROUTPUT ON;

-- NO_DATA_FOUND
DECLARE
    v_name employees.emp_name%TYPE;
BEGIN
    SELECT emp_name INTO v_name FROM employees WHERE emp_id = 999;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND: Employee was not found.');
END;
/

-- TOO_MANY_ROWS (department 1 has two sample employees)
DECLARE
    v_name employees.emp_name%TYPE;
BEGIN
    SELECT emp_name INTO v_name FROM employees WHERE dept_id = 1;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('TOO_MANY_ROWS: More than one employee was returned.');
END;
/

-- ZERO_DIVIDE
DECLARE
    v_result NUMBER;
BEGIN
    v_result := 10 / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('ZERO_DIVIDE: Cannot divide by zero.');
END;
/
