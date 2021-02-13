-- Iftakhar Husan


---------------------------------------------------------------------------------------------------
-- Collecting employee data
---------------------------------------------------------------------------------------------------

-- 1 - Select employees who live in Winnipeg.
SELECT * FROM emps WHERE city = 'Winnipeg';

-- 2 - Select firstname and surname of employees whose firstname starts with MI.
-- As, there is no 'firstname' attribute in 'emps' entity. So, I've replaced 'firstname' with 'gname'.
SELECT gname, surname FROM emps WHERE gname LIKE 'MI%';

-- 3 - Select employees (firstname and surname) whose employee number is between 50 and 70.
SELECT gname, surname FROM emps WHERE empnum BETWEEN 50 AND 70;

-- 4 - Select employees whose rate value is greater than 9 and employee number lower than 150.
SELECT * FROM emps WHERE rate>9 AND empnum<150;

-- 5 - Select employees whose phonenumber's third number is 7 and who come from Edmonton or Newton.
-- SUBSTRING ( string_to_slice, start, length ) --> string
-- The first character in the string_to_slice is 1
-- 'HELLO' here [H:1, E:2, L:3, L:4, O:5]
SELECT * FROM emps WHERE SUBSTRING(phone, 3, 1)='7' AND city IN ('Edmonton', 'Newton');
SELECT * FROM emps WHERE phone LIKE '__7%' AND city IN ('Edmonton', 'Newton');

-- 6 - Select all different cities and show the result set in descending order.
SELECT DISTINCT(city) FROM emps ORDER BY city DESC;

-- 7 - Select employees whose department is not A, B or C.
--      Try to find three different ways to create this query.
--      What choice would you prefer from these three?
SELECT * FROM emps WHERE dept NOT IN ('A', 'B', 'C'); -- Prefered
SELECT * FROM emps WHERE dept IN ('A', 'B', 'C') IS NOT TRUE;
SELECT * FROM emps WHERE dept!='A' AND dept!='B' AND dept!='C';
SELECT * FROM emps WHERE NOT dept='A' AND NOT dept='B' AND NOT dept='C';
SELECT * FROM emps WHERE dept NOT LIKE 'A' AND dept NOT LIKE 'B' AND dept NOT LIKE 'C';


---------------------------------------------------------------------------------------------------
-- Collecting department data
---------------------------------------------------------------------------------------------------

-- 8 - Select all departments, but show only five departments starting from tenth row.
SELECT * FROM dept LIMIT 5 OFFSET 9;

-- 9 - Select departments with budget between 57000 and 93000. Set column name as Limited.
-- confusion weather the renaming of the column is correct
SELECT budget AS Limited FROM dept WHERE budget BETWEEN 57000 AND 93000;
SELECT dept AS Limited FROM dept WHERE budget BETWEEN 57000 AND 93000;

-- 10 - Select department having ABEY M as a manager.
SELECT * FROM dept WHERE manager='ABEY M';
SELECT * FROM dept HAVING manager='ABEY M';
-- As the question asked to select single department limiting the result will improve the performance especially in large scale
SELECT * FROM dept WHERE manager='ABEY M' LIMIT 1;
SELECT * FROM dept HAVING manager='ABEY M' LIMIT 1;

-- 11 - Select departments having manager name starting with letter S and budget greater than 100000.
SELECT * FROM dept WHERE manager LIKE 'S%' AND budget>100000;
SELECT * FROM dept HAVING manager LIKE 'S%' AND budget>100000;


---------------------------------------------------------------------------------------------------
-- Other queries
---------------------------------------------------------------------------------------------------

-- 12 - Select departments with DEPT not being between H-T. DEPT and manager should be included in the result set.
SELECT dept, manager FROM dept WHERE dept NOT BETWEEN 'H' AND 'T';

-- 13 - Select employees whose firstnames second letter is A, last letter in surname is N and computer (PC) starts with string T0.
-- As, there is no 'firstname' attribute in 'emps' entity. So, I've replaced 'firstname' with 'gname'.
SELECT * FROM emps WHERE gname LIKE '_A%' AND surname LIKE '%N' AND pc LIKE 'T0%';
