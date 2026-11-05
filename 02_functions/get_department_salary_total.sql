CREATE OR REPLACE FUNCTION get_department_salary_total (
    p_dept_id IN employees.dept_id%TYPE
)
RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT NVL(SUM(salary), 0)
    INTO v_total
    FROM employees
    WHERE dept_id = p_dept_id;

    RETURN v_total;
END;
/
