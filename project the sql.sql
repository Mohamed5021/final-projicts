select * from countries
select * from departments 
select * from locations
select * from regions
select * from jobs
select * from employees
select * from dependents
الموظف صاحب اعلي راتب
select employee_id,concat(first_name,' ',last_name)as name ,salary 
from employees
where salary = (select max(salary) from employees )
عدد الاقارب لدى كل موظف والعلاقة بينهم 
select e.employee_id,concat(e.first_name,' ',e.last_name)as name,d.relationship,count(d.dependent_id)
from employees e
join dependents d on e.employee_id = d.employee_id
group by 1,2,3
order by 4 desc
وظيفة كل موظف و راتبه
select e.employee_id,concat(e.first_name,' ',e.last_name)as name,e.salary,j.job_id,j.job_title
from employees e join jobs j
on e.job_id = j.job_id
group by 1,2,3,4,5
ادارة كل موظف و المدير الذي يديره ومكان الادارة
select e.employee_id,concat(e.first_name,' ',e.last_name)as name,e.manager_id,d.department_id,d.department_name,d.location_id,l.street_address,l.city
from employees e join departments d
on d.department_id=e.department_id
join locations l on d.location_id = l.location_id
group by 1,2,3,4,5,6,7,8
موقع كل ادارة و بلدها و القارة التي تقع فيها
select d.department_id,d.department_name,l.street_address,l.city,l.state_province,c.country_name,r.region_name
from departments d join locations l on d.location_id=l.location_id 
join countries c on c.country_id=l.country_id
join regions r on c.region_id = r.region_id
group by 1,2,3,4,5,6,7
عدد الموظفين في كل ادارة
select d.department_id,d.department_name,count(e.employee_id) as num_of_emp
from departments d join employees e on e.department_id=d.department_id
group by 1,2
order by 3 desc
تصنيف الموظفين حسب المرتب
select case when salary >7000 then 'rich' when salary >3000 then 'meddil' else 'poor' end as "rank",
count(employee_id)as numper
from employees
group by 1
عدد الموظفين الذين تم نعيينهم في كل سنة
select date_part('year',hire_date)hire_date ,count (employee_id)numper
from employees 
group by 1
order by 1 