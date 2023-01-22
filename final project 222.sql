select * from countries
select * from departments
select * from dependents
select * from employees
select * from Jobs
select * from Locations
select * from regions


select d.department_id , department_name , count(employee_id) as "num of employee"
from departments d, employees e
where e.department_id = d.department_id
group by (d.department_id, department_name )




select concat(first_name,' ',last_name) as "employee full name" ,salary  
from employees
where salary = (select max(salary) from employees)

--
select concat(e.first_name,' ',e.last_name) as "employee full name",relationship,count(dependent_id) as "num of dependents"
from employees e,dependents s
where e.employee_id=s.employee_id
group by("employee full name",relationship)

select d.department_id ,d.department_name,l.city,c.country_name,r.region_name
from departments d,countries c,locations l,regions r
where d.location_id=l.location_id and l.country_id=c.country_id and c.region_id=r.region_id
		 
select concat(e.first_name,' ',e.last_name) as "employee full name",j.job_title ,e.salary 		 
from employees e,jobs j
where e.job_id=j.job_id