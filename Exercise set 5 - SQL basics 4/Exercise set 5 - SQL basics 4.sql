-- Iftakhar Husan


------------------------------------------------------------------------------------------
-- Create tables
------------------------------------------------------------------------------------------

-- 1 - Create a new table called SALARIES with the following columns:
--      salaryID (primary key)
--      salary (the amount of salary described with two decimals)
CREATE TABLE SALARIES(
    salaryID INT NOT NULL PRIMARY KEY,
    salary DECIMAL(10, 2)
); -- solve 1
CREATE TABLE SALARIES(
    salaryID INT NOT NULL,
    salary DECIMAL(10, 2),

    PRIMARY KEY (salaryID)
); -- solve 2
CREATE TABLE SALARIES(
    salaryID INT UNSIGNED AUTO_INCREMENT NOT NULL,
    salary DECIMAL(10, 2),

    PRIMARY KEY (salaryID)
); -- solve 3


-- 2 - Create a connection between SALARIES and EMPS tables 
--      (Tip: First think what column you should bring from EMPS table and then create a new column for it).
--      Use the following options in foreign key definition:
--          UPDATE CASCADE
--          DELETE NO ACTION
ALTER TABLE SALARIES 
    ADD COLUMN EMPLOYEE DECIMAL(3,0) NOT NULL,
    ADD CONSTRAINT FK_SALARIES_EMPS_EMPNUM FOREIGN KEY(EMPLOYEE)
        REFERENCES EMPS(EMPNUM)
        ON UPDATE CASCADE
        ON DELETE NO ACTION;


------------------------------------------------------------------------------------------
-- Editing table properties
------------------------------------------------------------------------------------------

-- 3 - Add a new column called fromdate.
--      The current date should be added automatically for this column when new data is inserted.
ALTER TABLE SALARIES
    ADD COLUMN FROMDATE DATE DEFAULT CAST(NOW() AS DATE);

-- 4 - Add automatic counter for salaryID column so that,
--      this field value will be automatically generated each time a new data is inserted.
ALTER TABLE SALARIES 
    MODIFY salaryID INT UNSIGNED AUTO_INCREMENT NOT NULL;


------------------------------------------------------------------------------------------
-- Input validation
------------------------------------------------------------------------------------------

-- 5 - Create input validation check with TRIGGER so that salaries exceeding 10000 euros cannot be inserted to the table.
DELIMITER $$
CREATE TRIGGER validate_salary BEFORE INSERT ON SALARIES
FOR EACH ROW
    BEGIN
        IF NEW.salary > 10000 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID SALARY: SALARY>10000';
        END IF;
    END $$
DELIMITER ;

-- 6 - Modify previously created input validation so that inserted value must also be even (num % 2 = 0).
-- should delete the previously created trigger
DROP TRIGGER validate_salary; -- Drop old trigger
-- Create new trigger
-- solve 1
DELIMITER $$
CREATE TRIGGER validate_salary BEFORE INSERT ON SALARIES
FOR EACH ROW
    BEGIN
        IF NEW.salary > 10000 OR NEW.salary%2=1 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID SALARY: SALARY>10000 or SALARY is not even';
        END IF;
    END $$
DELIMITER ;
-- solve 2 - precise message
DELIMITER $$
CREATE TRIGGER validate_salary BEFORE INSERT ON SALARIES
FOR EACH ROW
    BEGIN
        IF NEW.salary > 10000 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID SALARY: SALARY>10000';
		ELSEIF  NEW.salary%2 = 1 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID SALARY: SALARY is not even';
        END IF;
    END $$
DELIMITER ;

-- Note: Triggers can't be ALTERED.
