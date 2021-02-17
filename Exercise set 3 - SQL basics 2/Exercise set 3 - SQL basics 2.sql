-- Iftakhar Husan


---------------------------------------------------------------------------------------------------
-- Aggregate functions
-- https://www.w3schools.com/sql/sql_ref_mysql.asp - link to functions list
---------------------------------------------------------------------------------------------------

-- 1 - Select the average of rate values from departments M-P.
--       Set result set column name to be Average.
--       Result set value should be presented with two decimals.
SELECT ROUND(AVG(rate), 2) AS Average FROM emps WHERE dept BETWEEN 'M' AND 'P'; --assumed

-- 2 - Select employee count of employees having rate value between 6-8.
--      Set result set column name to be EmpRateCount.
SELECT count(*) AS EmpRateCount FROM emps WHERE rate BETWEEN 6 AND 8; --checked

-- 3 - Count the sum for rate values of employees working in departments A-G?
SELECT SUM(rate) AS Total FROM emps WHERE dept BETWEEN 'A' AND 'G'; --assumed

-- 4 - Select the maximum and minimum value of rate value from employees living in Davis.
--       Set result set column names to be Greatest and Smallest.
SELECT MAX(rate) AS Greatest, MIN(rate) AS Smallest FROM emps WHERE city='Davis'; --checked

-- 5 - Count the amount of employees having rate value over 10 from each department.
--      Department and employee count must be included in the result set.
--      Result set column name should be Count.
--      Set result set by Count column in descending order.
SELECT dept, rate, COUNT(*) AS Count 
	FROM emps 
	WHERE rate > 10 
    GROUP BY dept 
    ORDER BY count DESC; --checked


---------------------------------------------------------------------------------------------------
-- String patterns
---------------------------------------------------------------------------------------------------

-- 6 - Create new usernames for employees using SUBSTRING function.
--      Username should include two letters from firstname,
--          last three letters from surname
--          and first three numbers from phone number.
--      Use column name Username.


-- 7 - Select different cities and show city names in lowercase letters in the result set.
--      Use column name Locations.
--      Order result set by city name in ascending order.


-- 8 - Select employee firstname, surname and the length of surname (use column name surname_length).
--      Include only employees whose surname length is greater than six characters.


---------------------------------------------------------------------------------------------------
-- Other functions
---------------------------------------------------------------------------------------------------

-- 9 - Categorize department budgets in the following manner:
--      budgets below 100000 dollars will be categorized as Low
--      and budgets greater than 100000 as High.
--      Include columns dept, duty, budget and a newly created column (use column name budget_categorization) in the result set.


-- 10 - Count rate value averages for each city (use column name city_averages).
--      City and the average of rate values should be included in the result set.
--      Use descending order by rate value for the result set.


-- 11 - Analyze what the following SELECT query returns and why (not related to Ocelot training database).
