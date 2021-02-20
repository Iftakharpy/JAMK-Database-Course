-- Iftakhar Husan


------------------------------------------------------------------------------------------
-- Join
------------------------------------------------------------------------------------------

-- 1 - Select employees who work on department A and create a column 
--      where employee names are presented in a following format: 
--          Surname First_letter_of_firstname (For example Johnson B). 
--          Order result set by surname.
--      In addition for this new name column, present department Duty in the result set.
SELECT  e.surname, e.gname as firstname,
        CONCAT(COALESCE(e.surname, ''), ' ', LEFT(COALESCE(e.gname, ''), 1)) AS EmployeeName,
        d.duty
FROM emps AS e
INNER JOIN dept AS d
ON e.dept=d.dept
WHERE e.dept = 'A'
ORDER BY e.surname;

-- 2 - Select all employees and include also those who don't have department set.
--      Include firstname, surname, department and duty of department in the result set.
SELECT e.gname as firstname, e.surname, e.dept, d.duty
FROM emps AS e
LEFT JOIN dept AS d
ON e.dept=d.dept
ORDER BY e.dept;

-- 3 - Select employees who have MB as a province (PROV) and whose manager is Black D.
--      Present employee number and whole name in the result set.


-- 4 - Select all managers who have more than 10 employees on their department.
--      Present manager and employee count in the result set.
--      Order result set by employee count in descending order.


-- 5 - Create two columns for the result set:
--          One for employees so that employee name is presented in the following format:
--              Firstname Surname (for example Mike Johnson) and
--              another which tells whether the person is an employee or a manager.
--      Give columns the following names for the result set:
--          Name and Type.
--      Order results primarily by type and secondarily by name.



------------------------------------------------------------------------------------------
-- Union
------------------------------------------------------------------------------------------

-- 6 - Use UNION to combine the following two queries:
--      Select employees whose department is between A-D and employees whose firstname starts with letter B.
--      Include department, firstname, surname and city in the result set.


-- 7 - Use both UNION and JOIN and get the following information in one result set:
--          Employees who work in department having budget between 50000-100000
--          Employees whose computer identifier (PC) starts with letter T
--          Result set should include department, budget, employees firstname and surname as well as computer's identifier
--          Result set should be in ascending order by department



------------------------------------------------------------------------------------------
-- Subqueries
------------------------------------------------------------------------------------------

-- 8 - Select employees working in department A who have different rate value than any employees in department B.
--      Tip: Use IN subquery!


-- 9 - Select employees whose department's duty is same as the employee Peter Curry.
--      Result set should include department, duty and the firstname and surname of employee.


-- 10 - Select firstname, surname and phone numbers of employees whose department's duty is marketing
--          or whose department's manager is Mark G.


-- 11 - Use subquery to select all employees whose rate value is the greatest possible.
