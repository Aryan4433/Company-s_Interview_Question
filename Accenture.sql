use company;
CREATE TABLE employees  (employee_id int,employee_name varchar(15), email_id varchar(15) );

INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com'); 
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('106','Anjali Chouhan', 'JO.DA@ABC.COM');
INSERT INTO employees (employee_id,employee_name, email_id) VALUES ('107','Ankit Bansal', 'AN.BA@ABC.COM');

select * from employees;


-- In the above table data you can see there are 1 email is duplicate(102,105,106) but I want to fetch only lower case email into my output. In my output I
-- am expecting only 102 and 105 emp_id. 


select employee_id,employee_name, email_id from (select * , row_number() over(partition by email_id) as rnk from employees)a where a.rnk<=2;
