create database project;

SET SQL_SAFE_UPDATES=0;

use project;

-- 1- Average Attrition Rate for all Departments --

SELECT
  Department,
        CONCAT(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100,'%') AS Avg_AttritionRate
    FROM hr1
    GROUP BY Department;

-- 2– Average Hourly Rate of Male Research Scientist --
 
 SELECT
    AVG(HourlyRate) AS AverageHourlyRate_of_Male_ResearchScientist
FROM hr1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

-- 3– Attrition Rate vs Monthly Income --


SELECT
    CASE
        WHEN MonthlyIncome <= 10000 THEN '0-10000'
        WHEN MonthlyIncome <= 20000 THEN '10001-20000'
        WHEN MonthlyIncome <= 30000 THEN '20001-30000'
        WHEN MonthlyIncome <= 40000 THEN '30001-40000'
       ELSE 'Above 40000'
    END AS MonthlyIncomeBin,
CONCAT(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100,'%') AS AttritionRate
FROM
    hr1 JOIN hr2
    ON  hr1.employeenumber=hr2.employeeid
GROUP BY
    MonthlyIncomeBin
ORDER BY
    MonthlyIncomeBin ASC;

-- 4 – Average Working Years for Each Department --


SELECT
  Department,
AVG(TotalWorkingYears) AS AverageWorkingYears
FROM hr1 JOIN hr2 ON  hr1.employeenumber=hr2.employeeid
GROUP BY Department;

-- 5– Job Role vs Work Life Balance --


SELECT
    JobRole,
    COUNT(CASE WHEN WorkLifeBalance = 1 THEN 1 END) AS 'Poor',
	COUNT(CASE WHEN WorkLifeBalance = 2 THEN 2 END) AS 'Average',
	COUNT(CASE WHEN WorkLifeBalance = 3 THEN 3 END) AS 'Good',
	COUNT(CASE WHEN WorkLifeBalance = 4 THEN 4 END) AS 'Excellent'
FROM
    hr1 JOIN hr2 
    ON  hr1.employeenumber=hr2.employeeid
GROUP BY
    JobRole;

-- 6- Attrition Rate vs Years Since Last Promotion --


SELECT
    CASE
        WHEN YearsSinceLastPromotion <= 5 THEN '0-5'
        WHEN YearsSinceLastPromotion <= 10 THEN '6-10'
        WHEN YearsSinceLastPromotion <= 15 THEN '11-15'
        WHEN YearsSinceLastPromotion <= 20 THEN '16-20'
		WHEN YearsSinceLastPromotion <= 25 THEN '21-25'
		WHEN YearsSinceLastPromotion <= 30 THEN '26-30'
       ELSE 'Above 30'
    END AS YearsSinceLastPromotionBin,
CONCAT(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100,'%') AS AttritionRate
FROM
    hr1 JOIN hr2
    ON  hr1.employeenumber=hr2.employeeid
GROUP BY
    YearsSinceLastPromotionBin
ORDER BY
   YearsSinceLastPromotionBin ASC;

    

