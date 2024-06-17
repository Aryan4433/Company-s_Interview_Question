create table company_revenue 
(
company varchar(100),
year int,
revenue int
);

insert into company_revenue values 
('ABC1',2000,100),('ABC1',2001,110),('ABC1',2002,120),('ABC2',2000,100),('ABC2',2001,90),('ABC2',2002,120)
,('ABC3',2000,500),('ABC3',2001,400),('ABC3',2002,600),('ABC3',2003,800);


-- Q) Find the company only whose revenue is increasing increasing every year.
-- OAO Here in attached data from a company table. The out should be ABC1.
-- Note: Suppose a company revenue is increasing for 3 years and a very next year revenue is dipped in that case it should not come in output

select * from company_revenue;


with cte as (select *, lag(revenue,1,0) over(partition by company) as last_year_revenue from company_revenue) 
,cte1 as (
select *,case when revenue> last_year_revenue then 1 else 0 end as is_increasing from cte )

select distinct company from cte1 where company NOT IN (SELECT company FROM cte1 WHERE is_increasing = 0);