CREATE TABLE tables
                        (    employee_id	INT,
    entry_details	VARCHAR(512),
    timestamp_details	VARCHAR(512)
);


INSERT INTO tables  VALUES ('1000', 'login', '2023-06-16 01:00:15.34');
INSERT INTO tables  VALUES ('1000', 'login', '2023-06-16 02:00:15.34');
INSERT INTO tables  VALUES ('1000', 'login', '2023-06-16 03:00:15.34');
INSERT INTO tables  VALUES ('1000', 'logout', '2023-06-16 12:00:15.34');
INSERT INTO tables  VALUES ('1001', 'login', '2023-06-16 01:00:15.34');
INSERT INTO tables  VALUES ('1001', 'login', '2023-06-16 02:00:15.34');
INSERT INTO tables  VALUES ('1001', 'login', '2023-06-16 03:00:15.34');
INSERT INTO tables  VALUES ('1001', 'logout', '2023-06-16 12:00:15.34');

select * from tables;



CREATE TABLE tableNames
                        (    employeeid	INT,
    phone_number	INT,
    isdefault	VARCHAR(512)
);

INSERT INTO tableNames  VALUES ('1001', '9999', 'false');
INSERT INTO tableNames VALUES ('1001', '1111', 'false');
INSERT INTO tableNames VALUES ('1001', '2222', 'true');
INSERT INTO tableNames  VALUES ('1003', '3333', 'false');

select * from tables;
select * from tablenames;
-- employeeid, totalentry, totallogin, totallogout, latest login, latest logout, employee_default_phone_number



with login as(
select employee_id, count(*) as totallogin,max(timestamp_details)as latest_login from tables where entry_details ="login" group by employee_id)
 
, logout as (
select employee_id, count(*) as totallogout,max(timestamp_details)as latest_logout from tables where entry_details ="logout" group by employee_id)


select a.employee_id, a.totallogin, b.totallogout, a.latest_login,b.latest_logout,s.phone_number,s.isdefault from login a inner join logout b on a.employee_id = b.employee_id left join tablenames s on a.employee_id= s.employeeid and s.isdefault="True";
