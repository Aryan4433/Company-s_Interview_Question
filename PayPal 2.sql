use aryan_technology;
create table emmpp(
emmpp_id int,
emmpp_name varchar(20),
department_id int,
salary int,
manager_id int,
emmpp_age int);

insert into emmpp
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emmpp
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emmpp
values (3, 'Vikas', 100, 10000,4,37);
insert into emmpp
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emmpp
values (5, 'Mudit', 200, 12000, 6,55);
insert into emmpp
values (6, 'Agam', 200, 12000,2, 14);
insert into emmpp
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emmpp
values (8, 'Ashish', 200,5000,2,12);
insert into emmpp
values (9, 'Mukesh',300,6000,6,51);
insert into emmpp
values (10, 'Rakesh',300,7000,6,50);



select * from emmpp;

-- PROBLEM STATEMENT
-- The question goes as follows: We need to obtain a list of departments with an average salary lower than the overall average salary of the company.
-- However, when calculating the company's average salary, you must exclude the salaries of the department you are comparing it with. For instance,
-- when comparing the average salary of the HR department with the company's average, the HR department's salaries shouldn't be taken into
-- consideration for the calculation of company average salary. Likewise, if you want to compare the average salary of the Finance department with the
-- company's average, the company's average salary should not include the salaries of the Finance department, and so on. Essentially, the company's
-- average salary will be dynamic for each department.




-- HARD CODE

with cte as(
select * ,Avg(salary) over(partition by department_id) as dep_avg_sal ,
 case 
 when department_id =100 then (select Avg(salary) from emmpp where department_id in (200,300))
 when department_id =200 then (select Avg(salary) from emmpp where department_id in (100,300)) 
 when department_id =300 then (select Avg(salary) from emmpp where department_id in (100,200)) end as avg_sal
from emmpp)

select distinct(department_id) from cte where dep_avg_sal<avg_sal;



-- SOFT CODE

SELECT DEPARTMENT_ID,AVG(SALARY) FROM EMMPP E1 GROUP BY DEPARTMENT_ID HAVING AVG(SALARY) < (SELECT AVG(SALARY) FROM EMMPP E2 WHERE E2.DEPARTMENT_ID != E1.DEPARTMENT_ID)