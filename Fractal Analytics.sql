use aryan_technology;
CREATE TABLE drivers (
    driver_id INT,
    score INT,
    trips INT
);

INSERT INTO drivers (driver_id, score, trips) VALUES
    (21, 45, 15),
    (22, 32, 32),
    (23, 16, 17),
    (24, 19, 34),
    (25, 29, 25);
    
    
    
    CREATE TABLE positions (
    position_id INT,
    position_name VARCHAR(255),
    min_score INT,
    max_score INT
);

INSERT INTO positions (position_id, position_name, min_score, max_score) VALUES
    (1, 'Part time', 1, 20),
    (2, 'Full time', 21, 40),
    (3, 'Half time', 41, 60);



  CREATE TABLE fare (
    position_id INT,
    p_trips INT,
    p_fare DECIMAL(10, 2),
    s_fare DECIMAL(10, 2)
);

INSERT INTO fare (position_id, p_trips, p_fare, s_fare) VALUES
    (1, 2, 10, 20),
    (2, 10, 30, 20),
    (3, 15, 35, 20);
    
    
-- calaulate the total fare obtained by drivers and sort it in ASC

select * from drivers;
select * from positions;
select * from fare;


select d.driver_id ,
case
	when d.trips <= f.p_trips then d.trips*f.p_fare
    else (f.p_trips* f.p_fare) + ((d.trips - f.p_trips)*f.s_fare) 
end as total_fare

from drivers d join positions p on d.score between p.min_score and p.max_score join fare f on p.position_id=f.position_id; 










