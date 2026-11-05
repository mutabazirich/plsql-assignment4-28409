SET SERVEROUTPUT ON;

DECLARE
    -- User-defined record
    TYPE employee_record IS RECORD (
        emp_id   employees.emp_id%TYPE,
        emp_name employees.emp_name%TYPE,
        salary   employees.salary%TYPE,
        dept_id  employees.dept_id%TYPE
    );
    v_employee employee_record;

    -- Associative array of employee records
    TYPE employee_array IS TABLE OF employee_record INDEX BY PLS_INTEGER;
    v_employees employee_array;

    -- Nested table of employee names
    TYPE name_table IS TABLE OF VARCHAR2(100);
    v_names name_table := name_table();

    -- VARRAY for up to four department names
    TYPE department_array IS VARRAY(4) OF VARCHAR2(100);
    v_departments department_array :=
        department_array('IT', 'HR', 'Finance', 'Marketing');

    v_index PLS_INTEGER := 0;
BEGIN
    -- Fetch one row into a user-defined record
    SELECT emp_id, emp_name, salary, dept_id
    INTO v_employee.emp_id, v_employee.emp_name,
         v_employee.salary, v_employee.dept_id
    FROM employees
    WHERE emp_id = 101;

    DBMS_OUTPUT.PUT_LINE('User-defined record: ' || v_employee.emp_name);

    -- Fetch a complete table row using %ROWTYPE
    DECLARE
        v_full_row employees%ROWTYPE;
    BEGIN
        SELECT *
        INTO v_full_row
        FROM employees
        WHERE emp_id = 102;

        DBMS_OUTPUT.PUT_LINE('%ROWTYPE record: ' || v_full_row.emp_name);
    END;

    -- Fill an associative array
    FOR r IN (SELECT emp_id, emp_name, salary, dept_id
              FROM employees ORDER BY emp_id) LOOP
        v_index := v_index + 1;
        v_employees(v_index).emp_id := r.emp_id;
        v_employees(v_index).emp_name := r.emp_name;
        v_employees(v_index).salary := r.salary;
        v_employees(v_index).dept_id := r.dept_id;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Associative array count: ' || v_employees.COUNT);

    -- Fill a nested table with employee names
    FOR r IN (SELECT emp_name FROM employees ORDER BY emp_id) LOOP
        v_names.EXTEND;
        v_names(v_names.LAST) := r.emp_name;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Nested table count: ' || v_names.COUNT);

    -- Display VARRAY values
    FOR i IN 1 .. v_departments.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Department VARRAY item: ' || v_departments(i));
    END LOOP;
END;
/
