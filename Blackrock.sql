use aryan_technology;
create table orderss (
order_id integer,
order_date date
) ;
insert into orderss
values (1, '2022-10-21'), (2, '2022-10-22'),
(3, '2022-10-25'), (4, '2022-10-25');
select * from orderss;


-- take copy of orders table

create table copy as select * from orderss;

select * from copy;


-- new insert 
insert into orderss
values (5, '2022-10-26'), (6, '2022-10-26');


-- delete order id 1
SET SQL_SAFE_UPDATES = 0;
delete from orderss where order_id=1; 

-- now assign the new entry as "I" and deleted query as "D"


WITH cte AS (
    SELECT * 
    FROM orderss o 
    RIGHT JOIN copy c ON o.order_id = c.order_id
    UNION
    SELECT * 
    FROM orderss o 
    LEFT JOIN copy c ON o.order_id = c.order_id
)
SELECT *,
       CASE 
           WHEN o.order_id IS NULL THEN 'D'  
           WHEN c.order_id IS NULL THEN 'I' 
       END AS I_D 
FROM cte;