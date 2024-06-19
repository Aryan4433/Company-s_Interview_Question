use aryan_technology;
Create table candidates(
id int primary key,
positions varchar(10) not null,
salary int not null);

insert into candidates values(1,'junior',5000);
insert into candidates values(2,'junior',7000);
insert into candidates values(3,'junior',7000);
insert into candidates values(4,'senior',10000);
insert into candidates values(5,'senior',30000);
insert into candidates values(6,'senior',20000);

select * from candidates;

with j as (
select count(positions)as juniors  from candidates where positions="junior")
,s as (
select count(positions)as seniors  from candidates where positions="senior" and salary<30000)

select * from j ,s;


