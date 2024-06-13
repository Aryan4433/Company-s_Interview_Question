create database company;
use company;

CREATE TABLE city_distance
(
    distance INT,
    source VARCHAR(512),
    destination VARCHAR(512)
);


INSERT INTO city_distance(distance, source, destination) VALUES ('100', 'New Delhi', 'Panipat');
INSERT INTO city_distance(distance, source, destination) VALUES ('200', 'Ambala', 'New Delhi');
INSERT INTO city_distance(distance, source, destination) VALUES ('150', 'Bangalore', 'Mysore');
INSERT INTO city_distance(distance, source, destination) VALUES ('150', 'Mysore', 'Bangalore');
INSERT INTO city_distance(distance, source, destination) VALUES ('250', 'Mumbai', 'Pune');
INSERT INTO city_distance(distance, source, destination) VALUES ('250', 'Pune', 'Mumbai');
INSERT INTO city_distance(distance, source, destination) VALUES ('2500', 'Chennai', 'Bhopal');
INSERT INTO city_distance(distance, source, destination) VALUES ('2500', 'Bhopal', 'Chennai');
INSERT INTO city_distance(distance, source, destination) VALUES ('60', 'Tirupati', 'Tirumala');
INSERT INTO city_distance(distance, source, destination) VALUES ('80', 'Tirumala', 'Tirupati');


select * from city_distance;

-- Ques ITC Infotech SQL Interview Question -> 3 solutions
-- remove duplicate in case of source, destination, distance are same and keep the first value only


select distance, source,destination from (select *, row_number() over(partition by distance)as rnk from city_distance) a where a.rnk= 1 ;

















