create table namaste_python (
file_name varchar(25),
content varchar(200)
);


insert into namaste_python values ('python bootcamp1.txt','python for data analytics 0 to hero bootcamp starting on Jan 6th')
,('python bootcamp2.txt','classes will be held on weekends from 11am to 1 pm for 5-6 weeks')
,('python bootcamp3.txt','use code NY2024 to get 33 percent off. You can register from namaste sql website. Link in pinned comment');



select * from namaste_python;
-- find the words which are repeating more than once considering all the rows of content column 

WITH SplitWords AS (
    SELECT value AS Word
    FROM namaste_python
    CROSS APPLY STRING_SPLIT(content, ' ')
)
SELECT Word, COUNT(*) as WordCount
FROM SplitWords
GROUP BY Word
HAVING COUNT(*) > 1;
