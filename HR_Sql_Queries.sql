SELECT * FROM hr_attrition_db.hr_data_clean;

## Handled Duplicate values

SELECT EmpID, COUNT(*)
FROM hr_data_clean
GROUP BY EmpID
HAVING COUNT(*) > 1;

SELECT *
FROM hr_data_clean
WHERE EmpID = 'RM1467';

DELETE from hr_data_clean
where EmpID = 'RM1467'
and YearsWithCurrManager = 1;

## Missing values ( i have checked where the information is important to fill)

SELECT 
sum(case when EmpID is NULL Then 1 else 0 END ) as EmpID_null
from hr_data_clean;

## KPI 
-- Total Employees

SELECT
Count(*) as Total_employee
FROM hr_data_clean;
 

-- KPI- AVG salary

SELECT
CONCAT(ROUND(Avg(MonthlyIncome)/1000,1),'K') AS Avg_salary
from hr_data_clean;

## KPI- Attrition rate

SELECT
ROUND((SUM(CASE WHEN Attrition = 'Yes' then 1 ELSE 0 END)*100 /COUNT(*)),2) AS Attrition_percentage
from hr_data_clean;

## KPI- Avg Employee Tenure 

SELECT
ROUND(AVG(YearsAtCompany),1) AS Avg_tenure
from hr_data_clean;

## KPI - Avg Performance rating

SELECT
ROUND(AVG(PerformanceRating),1) AS Avg_performance
from hr_data_clean;

## KPI- Promotion Percentage

SELECT
Round(SUM(CASE WHEN YearsSinceLastPromotion>0 THEN 1 ELSE 0 END)*100/COUNT(*),1) AS Promotion_rate
FROM hr_data_clean;

## Attrition Analysis
## Gender wise Attrition

SELECT
Gender,
ROUND(SUM(CASE WHEN Attrition = 'Yes' then 1 ELSE 0 END)*100/COUNT(*),1) AS Attrition_Num
FROM hr_data_clean
GROUP BY Gender;

## Department wise Attrition

SELECT
Department,
ROUND(SUM(CASE WHEN Attrition = 'Yes' then 1 ELSE 0 END)*100/COUNT(*),1) AS Attrition_Num
FROM hr_data_clean
GROUP BY Department
ORDER BY Attrition_Num DESC ;

## Salary Comparison as per department

SELECT
Department,
CONCAT(ROUND(AVG(MonthlyIncome)/1000,1),'K') AS Avg_salary
from hr_data_clean
GROUP BY Department
ORDER BY Avg_salary DESC;

## distance from home as per deparment

SELECT
Department,
Round(AVG(DistanceFromHome),1) AS Avg_distance
FROM hr_data_clean
GROUP BY Department
ORDER BY Avg_distance DESC;

## Overtime Analysis

SELECT
OverTime,
COUNT(*) AS Count
FROM hr_data_clean
WHERE Attrition ='Yes'
GROUP BY OverTime;

## promotion Analysis

SELECT
Department,
count(*) as Total_employee,
ROUND(SUM(CASE WHEN YearsSinceLastPromotion>0 THEN 1 ELSE 0 END)*100.0/Count(*),1) as Promotion_rate
FROM hr_data_clean
GROUP BY Department
ORDER BY Promotion_rate DESC;

## overview Page 
# Gender classification

SELECT
Gender,
Count(*) AS Total_gender
FROM hr_data_clean
GROUP BY Gender;

