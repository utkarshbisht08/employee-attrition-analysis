-- KPI Summary
-- ==========================================

** KPI 1
Total Employees

** KPI 2
Employees Attrited

** KPI 3
Attrition Rate

** KPI 4
Average Monthly Income

SELECT 
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS Employees_Attrited,
    ROUND(COUNTIF(Attrition = true)* 100/COUNT(*),2)  AS Attrition_Rate,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Income 
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`;



-- ==========================================
-- Business Question 1
-- Which department has the highest attrition?
-- ==========================================

SELECT Department, COUNT(*) AS total_emp_attrited
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE Attrition = true
GROUP BY Department;


-- ==========================================
-- Business Question 2
-- Which age groups are most likely to leave the organization?
-- ==========================================

SELECT
 CASE
   WHEN Age BETWEEN 18 AND 24 THEN '18-24'
   WHEN Age BETWEEN 25 AND 34 THEN '26-34'
   WHEN Age BETWEEN 35 AND 44 THEN '36-44'
   WHEN Age BETWEEN 45 AND 54 THEN '46-54'
   ELSE '55+'
END AS Age_Group,
 ROUND(COUNTIF(Attrition = true) * 100 / COUNT(*),2) AS Attrition_Rate
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
GROUP BY Age_Group
ORDER BY Attrition_Rate DESC;


-- ==========================================
-- Business Question 3
-- Does the salary have any impact on employee attrition rates?
-- ==========================================

SELECT
  CASE
    WHEN MonthlyIncome < 5000 THEN 'Low'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
    WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN 'High'
    ELSE 'Very High'
END AS Salary_Group,
ROUND(COUNTIF(Attrition = true) * 100 /COUNT(*),2) AS Attrition_Rate
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
GROUP BY Salary_Group
ORDER BY Attrition_Rate DESC;

-- ==========================================
-- Business Question 4
-- Does the job satisfaction level correlate with employee attrition?
-- ==========================================

SELECT JobSatisfaction,
ROUND(COUNTIF(Attrition = true) * 100 / COUNT(*),2) AS Attrition_Rate
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
GROUP BY JobSatisfaction
ORDER BY Attrition_Rate DESC;

-- ==========================================
-- Business Question 5
-- Does the overtime hours worked have any impact on employee attrition rates?
-- ==========================================

SELECT OverTime, 
  ROUND(COUNTIF(Attrition = true) * 100 / COUNT(*),2) AS Attrition_Rate
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

-- ==========================================
-- Business Question 6
-- Does the distance from home to office have any impact on employee attrition rates?
-- ==========================================

SELECT
 CASE 
  WHEN DistanceFromHome BETWEEN 0 AND 5 THEN '0-5'
  WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10'
  WHEN DistanceFromHome BETWEEN 11 AND 15 THEN '11-15'
  WHEN DistanceFromHome BETWEEN 16 AND 20 THEN '16-20'
  ELSE '21+'
 END AS Home_Distance,
  ROUND(COUNTIF(Attrition = true) * 100 / COUNT(*),2) AS Attrition_Rate
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
GROUP BY Home_Distance
ORDER BY Attrition_Rate DESC;