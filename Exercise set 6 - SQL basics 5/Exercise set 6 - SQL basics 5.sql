-- Iftakhar Husan

-------------------------------------------------------------------------

-- 1 - Insert two new rows for SALARIES table:
--      3500 euros for employee 10
--      3300 euros for employee 20
INSERT INTO SALARIES(EMPLOYEE, SALARY) VALUES(10, 3500);
INSERT INTO SALARIES(EMPLOYEE, SALARY) VALUES(20, 3300);

-- 2 - Change the salary for employee 20 so that it will be 3600 euros.
UPDATE SALARIES SET SALARY=3600 WHERE EMPLOYEE=20;

-- 3 - Create a new table called SALARYHISTORY with similar structure as SALARY table.
CREATE SALARYHISTORY LIKE SALARIES;

-- 4 - Copy the content of SALARY table to SALARYHISTORY with one query.
INSERT INTO SALARYHISTORY SELECT * FROM SALARIES;

-- 5 - Remove the salary information of employee 20 from SALARY and SALARYHISTORY tables.
START TRANSACTION;
    DELETE FROM SALARIES WHERE EMPLOYEE = 20;
    DELETE FROM SALARYHISTORY WHERE EMPLOYEE = 20;
COMMIT; -- solve 1

-- solve 2
    DELETE FROM SALARIES WHERE EMPLOYEE = 20;
    DELETE FROM SALARYHISTORY WHERE EMPLOYEE = 20;
