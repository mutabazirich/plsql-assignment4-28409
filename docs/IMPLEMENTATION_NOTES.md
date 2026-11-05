# Implementation Notes – Employee Management System

## 1. Scenario
The Employee Management System stores employees and the departments to which they belong. It supports basic employee retrieval, insertion, salary updates, deletion, department employee listing, and salary calculations.

## 2. Database design
`DEPARTMENTS` has `dept_id` as its primary key and `dept_name` as a required field.

`EMPLOYEES` has `emp_id` as its primary key. `dept_id` is a foreign key referencing `DEPARTMENTS(dept_id)`. Employee names and salaries are required, and salary must be greater than zero.

## 3. Records
The record demonstration uses a programmer-defined `RECORD` type to group employee fields. It also uses `employees%ROWTYPE` to declare a record matching the full employees table row.

## 4. Collections
The demonstration includes:
- An associative array indexed by `PLS_INTEGER`.
- A nested table of employee names.
- A VARRAY for a bounded list of department names.

Collections allow PL/SQL to store and process multiple values in memory.

## 5. Implicit cursors
The insert, update, and delete procedures use implicit cursor attributes:
- `SQL%FOUND` indicates whether the most recent DML statement affected at least one row.
- `SQL%NOTFOUND` indicates that it affected no rows.
- `SQL%ROWCOUNT` reports the number of rows affected.

## 6. Explicit cursors
`display_department_employees` declares, opens, fetches from, and closes an explicit cursor to display employees belonging to a selected department.

## 7. Bulk processing
`bulk_processing_demo.sql` demonstrates `BULK COLLECT` to fetch employee IDs into a collection and `FORALL` to perform a batch update. The demo rolls back its temporary update so it can be run repeatedly.

`bulk_save_exceptions_demo.sql` demonstrates `FORALL ... SAVE EXCEPTIONS`, `SQL%BULK_EXCEPTIONS`, and `SQLERRM` by deliberately attempting an insert with an already-used employee ID. Successful inserts from the demonstration are rolled back.

Bulk processing reduces repeated communication between the PL/SQL and SQL engines compared with row-by-row processing.

## 8. Stored procedures
The procedures display an employee, add an employee, update a salary, delete an employee, and list employees in a department. They demonstrate input parameters and DML operations.

## 9. Stored functions
`get_employee_salary` returns one employee's salary. `get_department_salary_total` returns the sum of salaries for a department. The first function handles a missing employee using `NO_DATA_FOUND`.

## 10. Exception handling
The project demonstrates predefined exceptions including `NO_DATA_FOUND`, `TOO_MANY_ROWS`, and `ZERO_DIVIDE`; the named `DUP_VAL_ON_INDEX` exception; the user-defined `e_invalid_salary` exception in `set_employee_salary`; and custom errors through `RAISE_APPLICATION_ERROR`.

## 11. Test plan
Run the success test script to verify employee display, department listing, salary retrieval, department salary totals, and insert/update/delete operations.

Run the error test script to verify duplicate employee IDs, invalid salary values, missing employee updates/deletes, and missing employee lookup.

Run the predefined exception test script to demonstrate the expected predefined exceptions.

## 12. Limitations and verification
The scripts are teaching examples and should be reviewed and executed in the target Oracle 21c schema before submission. Capture actual SQL Developer output in the `screenshots/` folder. Update these notes if the final implementation changes.
