select * from student

USE schooldb
SELECT id, name, Aggregation.gender, Aggregation.Total_students, Aggregation.Average_Age, Aggregation.Total_Score
FROM student
INNER JOIN
(SELECT gender, count(gender) AS Total_students, AVG(age) AS Average_Age, SUM(total_score) AS Total_Score
FROM student
GROUP BY gender) AS Aggregation
on Aggregation.gender = student.gender

--Combines all rows in result set with aggregate results that no data is lost even though data is repeated
USE schooldb
SELECT id, name, gender,
COUNT(gender) OVER (PARTITION BY gender) AS Total_students,
AVG(age) OVER (PARTITION BY gender) AS Average_Age,
SUM(total_score) OVER (PARTITION BY gender) AS Total_Score
FROM student