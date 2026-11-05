# Employee Management System – PL/SQL Assignment IV

## Project overview
This project demonstrates Oracle PL/SQL records, collections, cursors, bulk processing, stored procedures, stored functions, and exception handling through a simple Employee Management System.

## Team members
- Student 1: [Mutabazi Rich] – [28409]

## Technology
- Oracle Database 21c
- Oracle SQL Developer
- PL/SQL

## Database design
The project uses two related tables:

- `DEPARTMENTS`: stores department identifiers and names.
- `EMPLOYEES`: stores employee details and references `DEPARTMENTS` through `dept_id`.

The employee table uses a primary key on `emp_id`, a foreign key on `dept_id`, a NOT NULL constraint on `emp_name`, and a CHECK constraint requiring salary to be greater than zero.

## PL/SQL concepts demonstrated
- User-defined records and `%ROWTYPE`
- Associative arrays, nested tables, and VARRAYs
- Implicit cursor attributes: `SQL%FOUND`, `SQL%NOTFOUND`, and `SQL%ROWCOUNT`
- Explicit cursors using `OPEN`, `FETCH`, and `CLOSE`
- `BULK COLLECT`, `FORALL`, `SAVE EXCEPTIONS`, and `SQL%BULK_EXCEPTIONS`
- Stored procedures and stored functions
- Predefined and user-defined exceptions
- `RAISE_APPLICATION_ERROR`

## Repository structure
```text
00_schema/       Table creation and sample data
01_procedures/   Stored procedures and PL/SQL demonstrations
02_functions/    Stored functions
03_tests/        Success and error test scripts
screenshots/     SQL Developer execution evidence
docs/            Technical implementation notes
```

## Setup and execution
1. Open Oracle SQL Developer and connect to the Oracle 21c database used for the assignment.
2. Open `00_schema/01_create_tables.sql` and run it using **F5 (Run Script)**.
3. Open `00_schema/02_insert_sample_data.sql` and run it once using **F5**.
4. Run the scripts in `01_procedures/` to create the procedures and demonstrations.
5. Run the scripts in `02_functions/` to create the functions.
6. Run `03_tests/test_success_cases.sql` and `03_tests/test_error_cases.sql`.
7. Save screenshots of successful outputs and expected error messages in `screenshots/`.

Run the table-creation and sample-data scripts only once on a fresh schema. If you run the sample-data script again, primary-key errors may occur because the sample employees already exist.

## Testing notes
The test scripts use the sample departments and employees created by the schema scripts. Some tests intentionally trigger errors to demonstrate exception handling. Review the comments in each script before executing it.

## AI assistance disclosure
AI assistance was used to support learning, explain PL/SQL concepts, and help draft and review parts of the SQL/PLSQL scripts and documentation. The team members are responsible for reviewing, testing, understanding, and presenting the submitted work.

## Important
Replace the team-member placeholders with the correct details. Confirm that every script compiles and runs successfully in your Oracle 21c environment before submission. Keep the repository public if required by the assignment instructions.
