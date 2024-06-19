create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

select * from entries;


with a as( select count(name) as No_of_visist ,min(floor) as most_visited_floor, group_concat(resources,' ') as resource_used  from entries where name = "A" )

,b as( select count(name) as No_of_visist ,max(floor) as most_visited_floor, group_concat(resources,' ') as resource_used  from entries where name = "B" )


select * from a union all select * from b;