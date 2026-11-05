SET SERVEROUTPUT ON;

DECLARE
    TYPE employee_id_table IS TABLE OF employees.emp_id%TYPE;
    v_employee_ids employee_id_table;
BEGIN
    -- BULK COLLECT: fetch all employee IDs in the selected department.
    SELECT emp_id
    BULK COLLECT INTO v_employee_ids
    FROM employees
    WHERE dept_id = 1
    ORDER BY emp_id;

    DBMS_OUTPUT.PUT_LINE('IDs retrieved: ' || v_employee_ids.COUNT);

    IF v_employee_ids.COUNT > 0 THEN
        -- FORALL: apply a small temporary increase to all selected employees.
        SAVEPOINT before_bulk_demo;

        FORALL i IN 1 .. v_employee_ids.COUNT
            UPDATE employees
            SET salary = salary + 1000
            WHERE emp_id = v_employee_ids(i);

        DBMS_OUTPUT.PUT_LINE('Rows updated by FORALL: ' || SQL%ROWCOUNT);

        -- Restore original salaries so this demonstration is repeatable.
        ROLLBACK TO before_bulk_demo;
        DBMS_OUTPUT.PUT_LINE('Demo updates rolled back.');
    END IF;
END;
/
