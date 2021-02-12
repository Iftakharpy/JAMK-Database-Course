-- Iftakhar Husan

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
SELECT * FROM emps WHERE substring(phone, 3, 1)='7' AND city IN ('Edmonton', 'Newton');

-- 6 - Select all different cities and show the result set in descending order.
SELECT distinct(city) FROM emps ORDER BY city DESC;

-- 7 - Select employees whose department is not A, B or C. Try to find three different ways to create this query. What choice would you prefer from these three?
SELECT * FROM emps WHERE dept NOT IN ('A', 'B', 'C'); -- Prefered
SELECT * FROM emps WHERE dept IN ('A', 'B', 'C') IS NOT TRUE;
SELECT * FROM emps WHERE NOT dept='A' AND NOT dept='B' AND NOT dept='C';
SELECT * FROM emps WHERE dept NOT LIKE 'A' AND dept NOT LIKE 'B' AND dept NOT LIKE 'C';

-- 8 - Select all departments, but show only five departments starting from tenth row.
SELECT * FROM dept LIMIT 5 OFFSET 10;

-- 9 - Select departments with budget being 57000 and 93000. Set column name as Limited.
SELECT BUDGET as LIMITED FROM dept WHERE budget IN (57000, 93000);

-- 10 - Select department having ABEY M as a manager.
SELECT * FROM dept WHERE manager='ABEY M';

-- 11 - Select departments having manager name starting with letter S and budget greater than 100000.
SELECT * FROM dept WHERE manager LIKE 'S%' AND budget>100000;

-- 12 - Select departments with DEPT not being between H-T. DEPT and manager should be included in the result set.
SELECT * FROM dept WHERE dept NOT BETWEEN 'H' AND 'T';

-- 13 - Select employees whose firstnames second letter is A, last letter in surname is N and computer (PC) starts with string T0.
-- As, there is no 'firstname' attribute in 'emps' entity. So, I've replaced 'firstname' with 'gname'.
SELECT * FROM emps WHERE gname LIKE '_A%' AND surname LIKE '%N' AND pc LIKE 'T0%';
