SET SERVEROUTPUT ON;

DECLARE
    TYPE id_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE name_table IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    TYPE salary_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE dept_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;

    v_ids id_table;
    v_names name_table;
    v_salaries salary_table;
    v_depts dept_table;

    e_bulk_errors EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_bulk_errors, -24381);
BEGIN
    SAVEPOINT before_bulk_insert_demo;

    v_ids(1) := 201; v_names(1) := 'David';  v_salaries(1) := 450000; v_depts(1) := 1;
    v_ids(2) := 101; v_names(2) := 'Robert'; v_salaries(2) := 500000; v_depts(2) := 2;
    v_ids(3) := 202; v_names(3) := 'Grace';  v_salaries(3) := 600000; v_depts(3) := 3;

    FORALL i IN 1 .. 3 SAVE EXCEPTIONS
        INSERT INTO employees (emp_id, emp_name, salary, dept_id)
        VALUES (v_ids(i), v_names(i), v_salaries(i), v_depts(i));

    DBMS_OUTPUT.PUT_LINE('All rows inserted.');
    ROLLBACK TO before_bulk_insert_demo;
EXCEPTION
    WHEN e_bulk_errors THEN
        DBMS_OUTPUT.PUT_LINE('Number of bulk errors: ' || SQL%BULK_EXCEPTIONS.COUNT);

        FOR j IN 1 .. SQL%BULK_EXCEPTIONS.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Failed collection position: ' ||
                SQL%BULK_EXCEPTIONS(j).ERROR_INDEX ||
                ' | Error: ' ||
                SQLERRM(-SQL%BULK_EXCEPTIONS(j).ERROR_CODE)
            );
        END LOOP;

        -- Remove successful inserts from this demonstration as well.
        ROLLBACK TO before_bulk_insert_demo;
END;
/
