-- Iftakhar Husan


------------------------------------------------------------------------------------------
-- Create tables
------------------------------------------------------------------------------------------

-- 1 - Create a new table called SALARIES with the following columns:
--      salaryID (primary key)
--      salary (the amount of salary described with two decimals)


-- 2 - Create a connection between SALARIES and EMPS tables 
--      (Tip: First think what column you should bring from EMPS table and then create a new column for it).
--      Use the following options in foreign key definition:
--          UPDATE CASCADE
--          DELETE NO ACTION



------------------------------------------------------------------------------------------
-- Editing table properties
------------------------------------------------------------------------------------------

-- 3 - Add a new column called fromdate.
--      The current date should be added automatically for this column when new data is inserted.


-- 4 - Add automatic counter for salaryID column so that,
--      this field value will be automatically generated each time a new data is inserted.



------------------------------------------------------------------------------------------
-- Input validation
------------------------------------------------------------------------------------------

-- 5 - Create input validation check with TRIGGER so that salaries exceeding 10000 euros cannot be inserted to the table.


-- 6 - Modify previously created input validation so that inserted value must also be even (num % 2 = 0).
