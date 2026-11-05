SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Duplicate employee ID test ---');
    BEGIN
        add_employee(101, 'Duplicate Person', 300000, 1);
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE('--- Non-positive salary test ---');
    BEGIN
        update_employee_salary(101, 0);
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE('--- User-defined invalid salary exception test ---');
    BEGIN
        set_employee_salary(101, -100);
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;

    DBMS_OUTPUT.PUT_LINE('--- Missing employee update test ---');
    update_employee_salary(999, 300000);

    DBMS_OUTPUT.PUT_LINE('--- Missing employee delete test ---');
    delete_employee(999);

    DBMS_OUTPUT.PUT_LINE('--- NO_DATA_FOUND function test ---');
    BEGIN
        DBMS_OUTPUT.PUT_LINE(get_employee_salary(999));
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;
END;
/
