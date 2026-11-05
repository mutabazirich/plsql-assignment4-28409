CREATE OR REPLACE PROCEDURE display_employee (
    p_emp_id IN employees.emp_id%TYPE
)
IS
    v_employee employees%ROWTYPE;
BEGIN
    SELECT *
    INTO v_employee
    FROM employees
    WHERE emp_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE(
        'ID: ' || v_employee.emp_id ||
        ' | Name: ' || v_employee.emp_name ||
        ' | Salary: ' || v_employee.salary ||
        ' | Department: ' || v_employee.dept_id
    );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
