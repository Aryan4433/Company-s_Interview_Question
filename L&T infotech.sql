
create table e
(
emp_name varchar(10),
dep_id int,
salary int
);

insert into e values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000);

select * from e;

-- --write a query to print highest and lowest salary emp in each deprtment


select distinct dep_id, FIRST_VALUE(emp_name) over(partition by dep_id order by salary desc) as emp_max_salary,
FIRST_VALUE(emp_name) over(partition by dep_id order by salary) as emp_min_salary from e;