SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Display existing employee ---');
    display_employee(101);

    DBMS_OUTPUT.PUT_LINE('--- Display IT department employees ---');
    display_department_employees(1);

    DBMS_OUTPUT.PUT_LINE('--- Test salary function ---');
    DBMS_OUTPUT.PUT_LINE('Employee 101 salary: ' || get_employee_salary(101));

    DBMS_OUTPUT.PUT_LINE('--- Test department salary function ---');
    DBMS_OUTPUT.PUT_LINE('IT salary total: ' || get_department_salary_total(1));

    DBMS_OUTPUT.PUT_LINE('--- Test insert, update, and delete ---');
    add_employee(901, 'Test Employee', 300000, 1);
    update_employee_salary(901, 325000);
    display_employee(901);
    delete_employee(901);
END;
/
