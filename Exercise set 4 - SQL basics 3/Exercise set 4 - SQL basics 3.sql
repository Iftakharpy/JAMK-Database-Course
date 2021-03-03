-- Iftakhar Husan


------------------------------------------------------------------------------------------
-- Join
------------------------------------------------------------------------------------------

-- 1 - Select employees who work on department A and create a column 
--      where employee names are presented in a following format: 
--          Surname First_letter_of_firstname (For example Johnson B). 
--          Order result set by surname.
--      In addition for this new name column, present department Duty in the result set.
SELECT CONCAT(COALESCE(e.surname, ''), ' ', LEFT(COALESCE(e.gname, ''), 1)) AS EmployeeName,
        d.duty
FROM emps AS e
INNER JOIN dept AS d
ON e.dept=d.dept
WHERE e.dept = 'A'
ORDER BY e.surname;

-- 2 - Select all employees and include also those who don't have department set.
--      Include firstname, surname, department and duty of department in the result set.
--      (Please notice that by default all employees have department set so this query won't return any rows with default data!)
SELECT e.gname AS firstname, e.surname, e.dept, d.duty
FROM emps AS e
LEFT JOIN dept AS d
ON e.dept=d.dept
ORDER BY e.dept, firstname; -- extra: order

-- 3 - Select employees who have MB as a province (PROV) and whose manager is Black D.
--      Present employee number and whole name in the result set.
SELECT e.empnum, 
        CONCAT(COALESCE(e.gname, ''), ' ', COALESCE(e.surname, '')) AS whole_name
FROM emps AS e
INNER JOIN dept AS d
ON e.dept=d.dept
WHERE e.prov='MB' AND d.manager='Black D'
ORDER BY e.empnum; -- extra: order

-- 4 - Select all managers who have more than 10 employees on their department.
--      Present manager and employee count in the result set.
--      Order result set by employee count in descending order.
-- solve 1
SELECT st.manager, st.employee_count
FROM ( SELECT d.manager, COUNT(e.empnum) AS employee_count
       FROM emps AS e
       INNER JOIN dept AS d
       ON e.dept = d.dept
       GROUP BY d.manager
    ) AS st -- sub_table
WHERE st.employee_count > 10
ORDER BY st.employee_count DESC;
-- solve 2
SELECT d.manager, COUNT(e.empnum) AS employee_count
    FROM emps AS e
    INNER JOIN dept AS d
    ON e.dept = d.dept
    GROUP BY d.manager
    HAVING employee_count>10
    ORDER BY employee_count DESC;

-- 5 - Create two columns for the result set:
--          One for employees so that employee name is presented in the following format:
--              Firstname Surname (for example Mike Johnson) and
--              another which tells whether the person is an employee or a manager.
--      Give columns the following names for the result set:
--          Name and Type.
--      Order results primarily by type and secondarily by name.
-- solve 1
-- with name format: 'surname first_latter_of_firstname'
SELECT  CONCAT(COALESCE(e.surname, ''), ' ', COALESCE(e.gname, '')) AS Name,
        CASE
            -- manager_name format = 'surname first_latter_of_firstname'
            WHEN CONCAT(COALESCE(e.surname, ''), ' ', COALESCE(LEFT(e.gname, 1), '')) -- employee name formatted to compare with manager name
                IN (SELECT manager FROM dept) THEN 'manager'
            ELSE 'employee'
        END AS Type
FROM emps AS e
ORDER BY Type, Name;
-- solve 2
-- with name format: 'firstname first_latter_of_surname'
SELECT  CONCAT(COALESCE(e.surname, ''), ' ', COALESCE(e.gname, '')) AS Name,
        CASE
            -- manager_name format = 'firstname first_latter_of_surname'
            WHEN CONCAT(COALESCE(e.gname, ''), ' ', COALESCE(LEFT(e.surname, 1), '')) -- employee name formatted to compare with manager name
                IN (SELECT manager FROM dept) THEN 'manager'
            ELSE 'employee'
        END AS Type
FROM emps AS e
ORDER BY Type, Name;


------------------------------------------------------------------------------------------
-- Union
------------------------------------------------------------------------------------------

-- 6 - Use UNION to combine the following two queries:
--          1. Select employees whose department is between A-D and
--          2. Select employees whose firstname starts with letter B.
--      Include department, firstname, surname and city in the result set.
SELECT dept, gname AS firstname, surname, city FROM emps WHERE dept BETWEEN 'A' AND 'D' -- 1
    UNION
SELECT dept, gname AS firstname, surname, city FROM emps WHERE LEFT(gname, 1)='B' -- 2
ORDER BY dept, firstname; -- extra: order

-- 7 - Use both UNION and JOIN and get the following information in one result set:
--              1. Employees who work in department having budget between 50000-100000
--              2. Employees whose computer identifier (PC) starts with letter T
--          Result set should include department, budget, employees firstname and surname as well as computer's identifier
--          Result set should be in ascending order by department
-- solve 1
SELECT gname AS firstname, surname, pc, e.dept, budget 
    FROM emps AS e 
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE budget BETWEEN 50000 AND 100000 -- 1
        UNION
SELECT gname as firstname, surname, pc, e.dept, budget
    FROM emps AS e
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE LEFT(pc, 1)='T' -- 2
ORDER BY dept ASC;
-- solve 2
SELECT gname AS firstname, surname, pc, e.dept, budget 
    FROM emps AS e 
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE (budget BETWEEN 50000 AND 100000) OR LEFT(pc, 1)='T'
ORDER BY dept ASC;


------------------------------------------------------------------------------------------
-- Subqueries
------------------------------------------------------------------------------------------

-- 8 - Select employees working in department A who have different rate value than any employees in department B.
--      Tip: Use IN subquery!
SELECT empnum, gname AS firstname, surname, dept, rate
FROM emps AS e
WHERE dept='A' AND
      rate NOT IN (SELECT DISTINCT(rate) FROM emps WHERE dept='B')
ORDER BY rate DESC; -- extra: order

-- 9 - Select employees whose department's duty is same as the employee Peter Curry.
--      Result set should include department, duty and the firstname and surname of employee.
SELECT e.dept, duty, gname AS firstname, surname
FROM emps AS e
INNER JOIN dept AS d
ON e.dept=d.dept
WHERE duty = (SELECT d.duty
            FROM emps AS e
            INNER JOIN dept AS d
            ON e.dept=d.dept
            WHERE gname = 'Peter' AND surname = 'Curry')
ORDER BY gname; -- extra: order

-- 10 - Select firstname, surname and phone numbers of employees whose department's duty is marketing
--          or whose department's manager is Mark G.
-- solve 1
SELECT gname AS firstname, surname, phone
    FROM emps AS e
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE LOWER(duty)='marketing' OR manager = 'Mark G'
ORDER BY surname, firstname; -- extra: order
-- solve 2
SELECT gname AS firstname, surname, phone
    FROM emps AS e
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE LOWER(duty)='marketing' 
        UNION
SELECT gname AS firstname, surname, phone
    FROM emps AS e
    INNER JOIN dept AS d
    ON e.dept=d.dept
    WHERE manager = 'Mark G'
ORDER BY surname, firstname; -- extra: order

-- 11 - Use subquery to select all employees whose rate value is the greatest possible.
SELECT gname AS firstname, surname, rate
FROM emps AS e
WHERE rate=(SELECT MAX(rate) FROM emps)
ORDER BY firstname; -- extra: order
