CREATE DATABASE IF NOT EXISTS salarydata;
USE salarydata;

-- Show all the rows and columns in the table
SELECT * FROM salaries;

-- Show only the employee name and job title
SELECT EmployeeName, JobTitle 
FROM salaries;

-- Show the number of employees in the table
SELECT count(EmployeeName)NumberofEmployees
FROM salaries;

-- Show the unique job titles in the table
SELECT DISTINCT JobTitle
FROM salaries;

-- Show the job title and overtime pay for all employees with an overtime pay greater than 50000.
SELECT JobTitle, OvertimePay
FROM salaries
WHERE OvertimePay > 50000;

-- What is the average base pay for all employees;
SELECT FORMAT(avg(BasePay),2)AverageBasePay
FROM salaries;

-- Show the top 10 highest paid employees.
SELECT EmployeeName, JobTitle, FORMAT(TotalPay,2)Salary
FROM salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- Show the average of BasePay, OvertimePay and OtherPay for each employee
SELECT JobTitle, FORMAT(avg(BasePay),2)AvgBasePay, FORMAT(avg(OvertimePay),2)AvgOvertimePay,
FORMAT(avg(OtherPay),2)AvgOtherPay 
FROM salaries
GROUP BY JobTitle;

-- Show all employees who have the word "Manager" in their job title
SELECT EmployeeName, JobTitle 
FROM salaries
WHERE JobTitle LIKE '%Manager%';

-- Show all employees with a job title not equal to "Manager"
SELECT EmployeeName, JobTitle
FROM salaries
WHERE JobTitle <> 'Manager';

-- Show all employees with a total pay between 50,000 and 75,000
SELECT EmployeeName, JobTitle, TotalPay
FROM salaries
WHERE TotalPay BETWEEN 50000 AND 75000;

-- Show all employees with a base pay less than 50,000 OR TotalPay greater than 100,000
SELECT EmployeeName, JobTitle, BasePay, TotalPay
FROM salaries 
WHERE BasePay < 50000 OR TotalPay > 100000
ORDER BY BasePay DESC;

-- Show all employees with a total pay benefits value between 125,000 and 150,000 and a job title containing the word director
SELECT * FROM salaries 
WHERE TotalPayBenefits BETWEEN 125000 and 150000
AND JobTitle LIKE '%Director%';

-- Show all employees by ordering their TotalPay in decsending order
SELECT * FROM salaries 
ORDER BY TotalPay DESC;

-- Show all job titles with an average base pay of at least 100,000 and order them in descending order
SELECT JobTitle, ROUND(avg(BasePay),2)AvgBasePay
FROM salaries
GROUP BY JobTitle
HAVING avg(BasePay) >= 100000
ORDER BY AvgBasePay DESC;

ALTER TABLE salaries
DROP COLUMN Status;

ALTER TABLE salaries
DROP COLUMN notes;

ALTER TABLE salaries
DROP COLUMN benefits;

SELECT * FROM salaries;

-- Update the base pay of all employees with the job title containing 'Manager' by increasing by 10%

SELECT * FROM salaries;

UPDATE salaries
SET BasePay = BasePay+(BasePay*0.1)
WHERE JobTitle LIKE '%Manager%';

-- Delete all employees who do not have a base pay
DELETE FROM salaries
WHERE BasePay = 0 OR BasePay IS NULL;