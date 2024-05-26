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
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/897f0c31-cfc6-4280-9eda-909863e47cb6)


### Number of Employees per Department till now 
```sql
SELECT COUNT(Department) AS total_no_of_employee, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY total_no_of_employee;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/04c98e24-61db-4b46-b306-1b712bf0cbef)


### Number of Employees per Salary Category till now
```sql
SELECT COUNT(salary) AS total_no_worked_in, salary 
FROM HR_comma_sep$
GROUP BY salary   
ORDER BY total_no_worked_in; 
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/88be79c4-617e-4987-9e5c-8fdf901f213d)


### Employee Promotion in the Last 5 Years or not 
```sql
SELECT COUNT(promotion_last_5years) AS total_promotion_count, promotion_last_5years 
FROM HR_comma_sep$
GROUP BY promotion_last_5years;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/6b6689c5-9427-45a9-acaf-c74f34bb90ad)


### Employees Promoted and Left the Company
```sql
SELECT COUNT(*) AS total_left 
FROM HR_comma_sep$
WHERE promotion_last_5years = 1 AND "left" = 1;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/d867cebf-9eee-43fd-bc68-4ab32423ed3a)


### Total Employees Left the Company
```sql
SELECT COUNT(*) AS total_left 
FROM HR_comma_sep$
WHERE "left" = 1;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/87cf52ec-b07d-4c55-8bf4-c1fd0299b1d0)


### Turnover Rate by Department
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate, Department 
FROM HR_comma_sep$
GROUP BY Department;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/4c0b2e19-7bad-4f54-b21b-2166355449c0)


### Salary Level with Highest Turnover Rate
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY turnover_rate DESC; 
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/81866f7f-b122-4d8b-986c-bbaa633b298a)


### Average Satisfaction Level by Department
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY avg_satisfaction DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/8e4cabbe-11ec-46a1-8f5d-94e565785731)


### Satisfaction Level: Employees Who Left vs. Stayed
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, "left" 
FROM HR_comma_sep$
GROUP BY "left"
ORDER BY avg_satisfaction DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/62854ccc-de2f-4e11-9152-b7cb90747683)


### Average Monthly Hours Worked by Department
```sql
SELECT AVG(average_montly_hours) AS avg_hours, Department 
FROM HR_comma_sep$
GROUP BY Department
ORDER BY avg_hours DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/d0b57b54-1ca2-4358-be49-1c12fe6e186b)


### Turnover Rate Among Employees with Work Accidents
```sql
SELECT (SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_work_accident 
FROM HR_comma_sep$
WHERE Work_accident = 1;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/daf7c0b6-b9d3-4e08-be6c-ee681ca6fad4)


### Average Number of Projects by Salary Level
```sql
SELECT AVG(number_project) AS avg_number_project, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY avg_number_project DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/12f946d3-b145-4341-8626-2d04f7c7c90c)


### Effect of Salary on Satisfaction and Retention by Department
```sql
SELECT salary, Department, AVG(satisfaction_level) AS avg_satisfaction, 
(SUM(CASE WHEN "left" = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS turnover_rate 
FROM HR_comma_sep$
GROUP BY Department, salary
ORDER BY Department, salary DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/9c22c5f8-57cc-4d01-b091-69a30f6571e9)


### Average Satisfaction Level by Tenure
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction, time_spend_company 
FROM HR_comma_sep$
GROUP BY time_spend_company
ORDER BY avg_satisfaction DESC;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/e70a5493-5fec-4b9f-9859-1e06eb401835)


### Average Last Evaluation Score: Employees Who Left vs. Stayed
```sql
SELECT AVG(last_evaluation) AS avg_last_evaluation, "left" 
FROM HR_comma_sep$
GROUP BY "left";
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/ee1854d0-9f6c-4ab4-86d3-46707f4b48d7)


### Satisfaction Level: Promoted vs. Not Promoted
```sql
SELECT AVG(satisfaction_level) AS avg_satisfaction_level, promotion_last_5years 
FROM HR_comma_sep$
GROUP BY promotion_last_5years;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/67565b01-ee5b-4528-b3af-ca74a173a593)


### Effect of Salary Level on Average Monthly Hours Worked
```sql
SELECT AVG(average_montly_hours) AS avg_monthly_hours, salary 
FROM HR_comma_sep$
GROUP BY salary
ORDER BY avg_monthly_hours;
```
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/c4523ca7-0b48-4c00-a159-29c7258067b6)


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
![image](https://github.com/Sudarshan028/sql_HR_Analysis/assets/160358210/2f4094e7-aa99-4e38-b1e1-d0649a334602)


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
