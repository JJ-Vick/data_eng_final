SELECT COUNT(*)
FROM dataset;

SELECT *
FROM dataset
LIMIT 10;

SELECT income, COUNT(*)
FROM dataset
GROUP BY income;

SELECT education, AVG(hours_per_week)
FROM dataset
GROUP BY education
ORDER BY AVG(hours_per_week) DESC;

SELECT workclass, COUNT(*)
FROM dataset
GROUP BY workclass
ORDER BY COUNT(*) DESC;