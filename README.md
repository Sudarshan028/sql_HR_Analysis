# Employee Analytics SQL Project

## Introduction
Welcome to the Employee Analytics SQL Project! This repository contains a series of SQL queries designed to analyze various aspects of employee data from a fictional company. The goal of this project is to explore patterns and correlations within the dataset to gain insights into employee satisfaction, performance, retention, and other important metrics.

## Dataset Description
The dataset includes the following columns:
- `satisfaction_level`: Employee satisfaction level
- `last_evaluation`: Last evaluation score
- `number_project`: Number of projects assigned
- `average_montly_hours`: Average monthly hours worked
- `time_spend_company`: Number of years the employee has been with the company
- `Work_accident`: Whether the employee has had a work accident (0 or 1)
- `left`: Whether the employee has left the company (0 or 1)
- `promotion_last_5years`: Whether the employee was promoted in the last 5 years (0 or 1)
- `Department`: Department where the employee works
- `salary`: Salary level (low, medium, high)

## Questions and Analysis
This project addresses several key questions to uncover insights from the data. The following are some of the important questions explored:

### View All Data
```sql
SELECT * FROM HR_comma_sep$;
```

### Number of Employees per Department
```sql
SELECT COUNT(Department) AS total_no_of_employee, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY total_no_of_employee;
```

### Number of Employees per Salary Category
```sql
SELECT COUNT(salary) AS total_no_worked_in, salary 
FROM HR_comma_sep$
GROUP BY salary   
ORDER BY total_no_worked_in; 
```

### Employee Promotion in the Last 5 Years
```sql
SELECT COUNT(promotion_last_5years) AS total_promotion_count, promotion_last_5years 
FROM HR_comma_sep$
GROUP BY promotion_last_5years;
```

### Employees Promoted and Left the Company
```sql
SELECT COUNT(*) AS total_left 
FROM HR_comma_sep$
WHERE promotion_last_5years = 1 AND "left" = 1;
```

### Total Employees Left the Company
```sql
SELECT COUNT(*) AS total_left 
FROM HR_comma_sep$
WHERE "left" = 1;
```

### Turnover Rate by Department
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate, Department 
FROM HR_comma_sep$
GROUP BY Department;
```

### Salary Level with Highest Turnover Rate
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY turnover_rate DESC; 
```

### Average Satisfaction Level by Department
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY avg_satisfaction DESC;
```

### Satisfaction Level: Employees Who Left vs. Stayed
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, "left" 
FROM HR_comma_sep$
GROUP BY "left"
ORDER BY avg_satisfaction DESC;
```

### Average Monthly Hours Worked by Department
```sql
SELECT AVG(average_montly_hours) AS avg_hours, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY avg_hours DESC;
```

### Turnover Rate Among Employees with Work Accidents
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_work_accident 
FROM HR_comma_sep$
WHERE Work_accident = 1;
```

### Average Number of Projects by Salary Level
```sql
SELECT AVG(number_project) AS avg_number_project, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY avg_number_project DESC;
```

### Effect of Salary on Satisfaction and Retention by Department
```sql
SELECT salary, Department, AVG(satisfaction_level) AS avg_satisfaction, 
(SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate 
FROM HR_comma_sep$
GROUP BY Department, salary
ORDER BY Department, salary DESC;
```

### Average Satisfaction Level by Tenure
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, time_spend_company 
FROM HR_comma_sep$
GROUP BY time_spend_company
ORDER BY avg_satisfaction DESC;
```

### Average Last Evaluation Score: Employees Who Left vs. Stayed
```sql
SELECT AVG(last_evaluation) AS avg_last_evaluation, "left" 
FROM HR_comma_sep$
GROUP BY "left";
```

### Satisfaction Level: Promoted vs. Not Promoted
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction_level, promotion_last_5years 
FROM HR_comma_sep$
GROUP BY promotion_last_5years;
```

### Effect of Salary Level on Average Monthly Hours Worked
```sql
SELECT AVG(average_montly_hours) AS avg_monthly_hours, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY avg_monthly_hours;
```

### Strongest Predictors of Employee Departure
```sql
SELECT 
    AVG(satisfaction_level) AS avg_satisfaction_left, 
    AVG(last_evaluation) AS avg_evaluation_left, 
    AVG(number_project) AS avg_projects_left,
    AVG(average_montly_hours) AS avg_hours_left,
    AVG(time_spend_company) AS avg_tenure_left,
    AVG(Work_accident) AS avg_accidents_left,
    AVG(promotion_last_5years) AS avg_promotions_left
FROM HR_comma_sep$
WHERE "left" = 1;
```

## Set Up Your Database
1. Import the dataset into your SQL database.
2. Ensure you have the necessary permissions to run the queries.

## Run the Queries
1. Navigate to the `hrproject/` directory.
2. Execute the SQL files in your database to perform the analyses.

## Contributions
Contributions are welcome! If you have any improvements or additional queries to suggest, feel free to create a pull request or open an issue.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---
