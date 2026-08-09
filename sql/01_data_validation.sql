-- =====================================================
-- DATA VALIDATION
-- =====================================================

-- 1. Total Number of Records
SELECT COUNT(*) AS total_employee
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`;


-- 2. Duplicate Record Check
SELECT COUNT(EmployeeNumber) AS total_employee,
COUNT (DISTINCT  EmployeeNumber) AS total_emoployee_unique
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`;


-- 3. NULL Value Check
I validated all fields used in my KPI calculations and business analyses before beginning the analysis

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE Department IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE Age IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE JobRole IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE OverTime IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE DistanceFromHome IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE MonthlyIncome IS NULL;

SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE JobSatisfaction IS NULL;

-- 4. Invalid Age Values
SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE age < 0
OR age > 100;

-- 5. Invalid Monthly Income Values
SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE MonthlyIncome < 0;

-- 6. Invalid Distance From Home Values
SELECT *
FROM `project-a1832c28-dfc8-4997-80b.hr_attrition.hr_attrition_analysis`
WHERE DistanceFromHome < 0;
