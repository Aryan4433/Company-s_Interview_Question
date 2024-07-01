use aryan_technology;
CREATE Table Tabless (
    Name	VARCHAR(512),
    Salary	INT
);

INSERT INTO Tabless (Name, Salary) VALUES ('Akash', '360000');
INSERT INTO Tabless (Name, Salary) VALUES ('Saurabh', '240000');
INSERT INTO Tabless (Name, Salary) VALUES ('Shubham', '120000');
INSERT INTO Tabless (Name, Salary) VALUES ('Anand', '240000');
INSERT INTO Tabless (Name, Salary) VALUES ('Pratek', '480000');


select * from tabless;

-- Salaries: Contains the employee's name and employee's annual salary.
-- Using the table you have to find the average monthly salary and maximum monthly salary of the employees with first letter of their names equal to A.
-- NOTE: Average monthly salary and Maximum monthly salary are guaranteed to be integers.

with cte as (
select Name, Salary,round(salary/12,0) as monthly_salary from tabless where Name like "A%")

select Round(Avg(monthly_salary),0) as Average_monthly_salary , Max(monthly_salary) as maximum_monthly_salary from cte; 


