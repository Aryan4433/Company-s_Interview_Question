create table clocked_hours(
empd_id int,
swipe time,
flag char
);

insert into clocked_hours values
(11114,'08:30','I'),
(11114,'10:30','O'),
(11114,'11:30','I'),
(11114,'15:30','O'),
(11115,'09:30','I'),
(11115,'17:30','O');

select * from clocked_hours;

-- --find total number of clocked hours be each employee (inside the office), flag -I means punch in and O means punch out.
-- --Employee can do multiple punch in and punch out in a day. for each punch in there will be a punch out.
 with cte as (select *,row_number() over(partition by empd_id,flag order by swipe) as rn from clocked_hours)
 
 select empd_id , rn,min(swipe) as swipe_in , max(swipe) as swipe_out ,timediff(max(swipe),min(swipe)) as diff from cte group by empd_id,rn;