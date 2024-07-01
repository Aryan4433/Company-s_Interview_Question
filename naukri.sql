use aryan_technology;
create table job_positions (id  int,
title varchar(100),
groupss varchar(10),
levels varchar(10),     
payscale int, 
totalpost int );
 insert into job_positions values (1, 'General manager', 'A', 'l-15', 10000, 1); 
insert into job_positions values (2, 'Manager', 'B', 'l-14', 9000, 5); 
insert into job_positions values (3, 'Asst. Manager', 'C', 'l-13', 8000, 10);  

  create table job_employees ( id  int, 
                                                 name   varchar(100),     
                                                  position_id  int 
                                                );  
  insert into job_employees values (1, 'John Smith', 1); 
insert into job_employees values (2, 'Jane Doe', 2);
 insert into job_employees values (3, 'Michael Brown', 2);
 insert into job_employees values (4, 'Emily Johnson', 2); 
insert into job_employees values (5, 'William Lee', 3); 
insert into job_employees values (6, 'Jessica Clark', 3); 
insert into job_employees values (7, 'Christopher Harris', 3);
 insert into job_employees values (8, 'Olivia Wilson', 3);
 insert into job_employees values (9, 'Daniel Martinez', 3);
 insert into job_employees values (10, 'Sophia Miller', 3);
 
 
 select * from job_positions;
 select * from job_employees;
 
 
 select * from job_positions j inner join job_employees p on j.id = p.position_id;


SELECT 
    p.title AS TITLE,
    p.groupss AS 'GROUP',
    p.levels AS LEVEL,
    p.payscale AS PAYSCALE,
    COALESCE(e.name, 'Vacant') AS EMPLOYEE_NAME
FROM 
    job_positions p
LEFT JOIN 
    job_employees e
ON 
    p.id = e.position_id
ORDER BY 
    p.id, e.id;
 