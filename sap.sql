use aryan_technology;	



create table sal (name varchar(20) , salary int);

insert into sal values ("Aryan",20),("ritu",),("sahil",null);


select name from sal where salary< (select avg(salary) from sal);