select * from HR_comma_sep$;

--number of employee ,worked in different different department 
select count(Department) as total_no_of_employee,Department from HR_comma_sep$
group by Department
order by total_no_of_employee;

--number of employee ,lies in different differnt category
select count(salary) as total_no_worked_in , salary from HR_comma_sep$
group by salary   
order by total_no_worked_in; 

---number of employee , who get promotion in last 5 years or not get
select count(promotion_last_5years) as total_promotion_count, promotion_last_5years from HR_comma_sep$
group by promotion_last_5years;

--number of employee, who get promotion and left the company
select count(*) as total_left from HR_comma_sep$
where "promotion_last_5years" = 1 and "left" = 1;

--Employee Turnover Analysis

--How many employees have left the company?
select count(*) as total_left from HR_comma_sep$
where "left" = 1;

--trunover rate in the department
select (sum(case when "left" = 1 then 1 else 0 end) * 100.0 /count(*)) as counnnt , Department from HR_comma_sep$
group by Department;

--Which salary level has the highest turnover rate?
select (sum(case when "left" = 1 then 1 else 0 end) * 100.0 /count(*)) as counnnt , salary from HR_comma_sep$
group by salary
order by counnnt desc; 

--What is the average satisfaction level of employees in the  department?

select avg(satisfaction_level) as avg_satisfaction , Department from HR_comma_sep$
group by Department
order by avg_satisfaction desc;

--How does the average satisfaction level differ between employees who have left and those who have stayed?
select avg(satisfaction_level) as avg_satisfaction , "left" from HR_comma_sep$
group by "left"
order by avg_satisfaction desc;

-- What is the average monthly hours worked by employees in the department?
select avg(average_montly_hours) as avg_hours, Department from HR_comma_sep$
group by Department
order by avg_hours desc;

--What percentage of employees who experienced work accidents have left the company?
select (sum(case when "left" = 1 then 1 else 0 end)* 100.0/count(*)) as turnover_work_accident from HR_comma_sep$
where Work_accident =1 ;

--What is the average number of projects handled by employees at different salary levels?
select avg(number_project) as avg_number_project , salary from HR_comma_sep$
group by salary
order by avg_number_project desc;

--How does salary level affect employee satisfaction and retention in the department?
select salary, Department, avg(satisfaction_level) as avg_satisfaction, 
(sum(case when "left" = 1 then 1 else 0 end)*100.0/count(*)) as trunover_to_left 
from HR_comma_sep$
group by Department, salary
order by department, salary desc;

--What is the average satisfaction level for employees based on their tenure in the company?
select avg(satisfaction_level) as avg_satisfaction, time_spend_company from HR_comma_sep$
group by time_spend_company
order by avg_satisfaction desc;

--What is the average last evaluation score for employees who left compared to those who stayed?
select avg(last_evaluation) as avg_last_evaluation, "left" from HR_comma_sep$
group by "left";

--What is the average satisfaction level of employees who were promoted versus those who were not?
select avg(satisfaction_level) as avg_satisfaction_level, promotion_last_5years from HR_comma_sep$
group by promotion_last_5years;

--How does salary level affect the average monthly hours worked by employees?
select avg(average_montly_hours) as avg_monthly_hours,salary from HR_comma_sep$
group by salary
order by avg_monthly_hours;

---- Which factors are the strongest predictors of employee departure?
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

--


select * from HR_comma_sep$;
