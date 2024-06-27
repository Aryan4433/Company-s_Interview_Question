CREATE TABLE emp_salary
(
    emp_id INTEGER  ,
    name VARCHAR(20)  ,
    salary NVARCHAR(30),
    dept_id INTEGER
);


INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');

-- fetch those rows where dept_id and salary are same

with cte as (
select *, count(*) over(partition by salary,dept_id) as same from emp_salary)

select emp_id,name,salary,dept_id from cte where same>1; 
 
 
 