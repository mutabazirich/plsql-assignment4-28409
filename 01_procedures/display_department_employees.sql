CREATE OR REPLACE PROCEDURE display_department_employees (
    p_dept_id IN employees.dept_id%TYPE
)
IS
    CURSOR c_employees IS
        SELECT emp_id, emp_name, salary
        FROM employees
        WHERE dept_id = p_dept_id
        ORDER BY emp_id;

    v_employee c_employees%ROWTYPE;
    v_count PLS_INTEGER := 0;
BEGIN
    OPEN c_employees;

    LOOP
        FETCH c_employees INTO v_employee;
        EXIT WHEN c_employees%NOTFOUND;

        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE(
            v_employee.emp_id || ' | ' ||
            v_employee.emp_name || ' | ' ||
            v_employee.salary
        );
    END LOOP;

    CLOSE c_employees;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No employees found in this department.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employees displayed: ' || v_count);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        IF c_employees%ISOPEN THEN
            CLOSE c_employees;
        END IF;
        RAISE;
END;
/
