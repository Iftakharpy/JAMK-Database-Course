-- Iftakhar Husan


---------------------------------------------------------------------------------------------------
-- Aggregate functions
-- https://www.w3schools.com/sql/sql_ref_mysql.asp - link to functions list
---------------------------------------------------------------------------------------------------

-- 1 - Select the average of rate values from departments M-P.
--       Set result set column name to be Average.
--       Result set value should be presented with two decimals.
SELECT ROUND(AVG(rate), 2) AS Average FROM emps WHERE dept BETWEEN 'M' AND 'P';

-- 2 - Select employee count of employees having rate value between 6-8.
--      Set result set column name to be EmpRateCount.
SELECT COUNT(empnum) AS EmpRateCount FROM emps WHERE rate BETWEEN 6 AND 8;
-- Employee counts for different rates
SELECT rate, COUNT(empnum) AS EmpRateCount FROM emps WHERE rate BETWEEN 6 AND 8 GROUP BY rate ORDER BY rate;

-- 3 - Count the sum for rate values of employees working in departments A-G?
SELECT SUM(rate) AS Total_rate FROM emps WHERE dept BETWEEN 'A' AND 'G';
-- Rate sum for individual departments
SELECT dept, SUM(rate) AS Total_rate FROM emps WHERE dept BETWEEN 'A' AND 'G' GROUP BY dept ORDER BY dept;

-- 4 - Select the maximum and minimum value of rate value from employees living in Davis.
--       Set result set column names to be Greatest and Smallest.
SELECT MAX(rate) AS Greatest, MIN(rate) AS Smallest FROM emps WHERE city='Davis';

-- 5 - Count the amount of employees having rate value over 10 from each department.
--      Department and employee count must be included in the result set.
--      Result set column name should be Count.
--      Set result set by Count column in descending order.
SELECT dept, COUNT(empnum) AS Count 
	FROM emps 
	WHERE rate > 10 
    GROUP BY dept 
    ORDER BY Count DESC;


---------------------------------------------------------------------------------------------------
-- String patterns
---------------------------------------------------------------------------------------------------

-- 6 - Create new usernames for employees using string functions.
--         - Username should include first two letters from firstname,
--         - last three letters from surname and
--         - first three numbers from phone number.
--      Use column name Username.
-- COALESCE() -- doc: https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql?view=sql-server-ver15
-- Used COALESCE to prevent setting username to NULL when one column's value is NULL
-- solve 1
SELECT CONCAT(LEFT(gname, 2), RIGHT(surname, 3), LEFT(phone, 3)) AS Username FROM emps;
-- solve 2
SELECT CONCAT(COALESCE(LEFT(gname, 2), ''),
            COALESCE(RIGHT(surname, 3), ''),
            COALESCE(LEFT(phone, 3), '')) AS Username,
        gname AS firstname,
        surname,
        phone 
    FROM emps;
-- solve 3
SELECT CONCAT(COALESCE(SUBSTRING(gname, 1, 2), ''),
                COALESCE(SUBSTRING(surname, -3, 3), ''),
                COALESCE(SUBSTRING(phone, 1, 3), '')) AS Username,
        gname AS firstname,
        surname,
        phone 
    FROM emps;


-- 7 - Select different cities and show city names in lowercase letters in the result set.
--      Use column name Locations.
--      Order result set by city name in ascending order.
SELECT DISTINCT(LOWER(city)) AS Locations FROM emps ORDER BY Locations ASC;

-- 8 - Select employee firstname, surname and the length of surname (use column name surname_length).
--      Include only employees whose surname length is greater than six characters.
SELECT gname AS firstname, surname, LENGTH(surname) AS surname_length 
    FROM emps 
    WHERE LENGTH(surname)>6
    ORDER BY surname_length;


---------------------------------------------------------------------------------------------------
-- Other functions
---------------------------------------------------------------------------------------------------

-- 9 - Categorize department budgets in the following manner:
--      budgets below 100000 dollars will be categorized as Low
--      and budgets greater than 100000 as High.
--      Include columns dept, duty, budget and a newly created column (use column name budget_categorization) in the result set.
SELECT dept, duty, budget,
    CASE 
        WHEN budget<100000 THEN 'Low'
        WHEN budget>100000 THEN 'High'
        ELSE 'Unspecified'
    END AS budget_categorization
    FROM dept
    ORDER BY budget DESC;

-- 10 - Count rate value averages for each city (use column name city_averages).
--      City and the average of rate values should be included in the result set.
--      Use descending order by rate value for the result set.
SELECT city, AVG(rate) AS city_averages
    FROM emps
    GROUP BY city
    ORDER BY city_averages DESC;



-- 11 - Analyze what the following SELECT query returns and why (not related to Ocelot training database).
/*  SQL SELECT query

SELECT CURRENT_USER, 
    CASE
        WHEN CAST(CURRENT_DATE AS CHAR(10)) <= '2011-02-22'
        THEN 'OK'
        ELSE 'Late'
    END as CheckIt
FROM TargetTable
*/


/*  
------------------------- What the SELECT query returns -----------------------------

1. Initially, I replaced "TargetTable" with "sdept".
    The query produced the following result: 
    `
    CURRENT_USER    |   CheckIt
    ----------------|-----------
    root@localhost	|   Late
    root@localhost	|   Late
    root@localhost	|   Late
    `
    This is because sdept table had 3 records. 
    As, CURRENT_DATE is '2021-02-19' which is greater than '2011-02-22' so CheckIt is 'Late' for every column.
    The CURRENT_USER was 'root@localhost' and that remains the same if someone doesn't change one's username.

2. In the next turn, I created a table and named it 'TargetTable' with 'name' attribute. 
    Then inserted a record with value 'Iftakhar'.
    Using the commands below:

    CREATE TABLE TargetTable(name VARCHAR(100));
    INSERT INTO TargetTable(name) VALUES('Iftakhar'); 

    After that I executed the query mantioned in the task 11 as it is. 
    It returned the following output:
    `
    CURRENT_USER    |   CheckIt
    ----------------|-----------
    root@localhost	|   Late
    `


------------------------- Analysis for the Why -----------------------------

- CURRENT_USER returns the current_user that's logged in.
- CURRENT_DATE returns current date in 'yyyy-mm-dd' format.
    In the query "CAST(CURRENT_DATE AS CHAR(10))" does the same thing.

In the SELECT query CURRENT_USER and CheckIt columns are returned in the result set.
    The number of rows depends on the number of rows stored in the "TargetTable".
    It will return the same number of rows stored in the "TargetTable".
        If "TargetTable" has 0 records then the query won't return any result.
    The result will always be the same. 
    Unless, someone changes the system datetime and the logged in user.
    
    CheckIt column's values will depend on `CAST(CURRENT_DATE AS CHAR(10)) <= '2011-02-22'` comparison operation.
    If the current date is smaller than or equals to the string '2011-02-22' then the value would be 'OK'.
    Otherwise the result value will be 'Late'.
    
    If the "TargetTable" doesn't exist in the currently selected database error will occur.
    The error message will be something like this `Error Code: 1146. Table 'exercise.TargetTable' doesn't exist`
    All of the columns will be identical in the result set.
*/
