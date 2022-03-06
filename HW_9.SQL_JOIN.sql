 --1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

select employee_name,monthly_salary
from employee_salary
join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id;

 --2. ������� ���� ���������� � ������� �� ������ 2000.

select employee_name,monthly_salary 
from employee_salary
join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id
where monthly_salary < 2000;

 --3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_name,monthly_salary
from employee_salary
left join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id
where employee_name is null;

 --4. ������� ��� ���������� ������� ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_name,monthly_salary
from employee_salary
left join employees on employee_salary.employee_id=employees.id
join salary on employee_salary.salary_id=salary.id
where employee_name is null and monthly_salary < 2000;

 --5. ����� ���� ���������� ���� �� ��������� ��.

select employee_name
from employee_salary
join employees on employee_salary.employee_id=employees.id
left join salary on employee_salary.salary_id=salary.id
where monthly_salary is NULL

 --6. ������� ���� ���������� � ���������� �� ���������.

select employee_name,role_name
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id;

 --7. ������� ����� � ��������� ������ Java �������������.

select employee_name,role_name 
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id        
where role_name like '%Java%';

-- 8. ������� ����� � ��������� ������ Python �������������.

select employee_name,role_name 
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id        
where role_name like '%Python%';

 --9. ������� ����� � ��������� ���� QA ���������.

select employee_name,role_name 
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id        
where role_name like '%QA engineer%';

 --10. ������� ����� � ��������� ������ QA ���������.

select employee_name,role_name 
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id        
where role_name like '%Manual QA engineer%';

-- 11. ������� ����� � ��������� ��������������� QA

select employee_name,role_name 
from roles_employee
join employees on roles_employee.employee_id=employees.id
join roles on roles_employee.role_id=roles.id        
where role_name like '%Automation QA engineer%';

 --12. ������� ����� � �������� Junior ������������ (�������� ������� � ���� ������� ������� ���������, ����� � ��)

select table1.employee_name,monthly_salary
from (
      select employee_name,role_name /*�������� �����+���������*/
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary /*�������� �����+��*/
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name /*������� 2 ������������� ������� �� ������ ����*/
      where role_name like '%Junior%';

 --13. ������� ����� � �������� Middle ������������

select table1.employee_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where role_name like '%Middle%';

 --14. ������� ����� � �������� Senior ������������

select table1.employee_name,monthly_salary 
from (
      select employee_name,role_name /*�������� �����+���������*/
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary /*�������� �����+��*/
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name /*������� 2 ������������� ������� �� ������ ����*/
      where role_name like '%Senior%';  

 --15. ������� �������� Java �������������

select monthly_salary 
from (
      select employee_name,role_name
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where role_name like '%Java%';

 --16. ������� �������� Python �������������

select monthly_salary 
from (
      select employee_name,role_name
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where role_name like '%Python%';

 --17. ������� ����� � �������� Junior Python �������������

select table1.employee_name,monthly_salary
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary /*�������� �����+��*/
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name /*������� 2 ������������� ������� �� ������ ����*/
      where role_name like '%Junior Python%';

-- 18. ������� ����� � �������� Middle JS �������������

select table1.employee_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%Middle JavaScript%'; 

 --19. ������� ����� � �������� Senior Java �������������

select table1.employee_name,monthly_salary
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%Senior Java%'; 

 --20. ������� �������� Junior QA ���������

select monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%Junior QA%';

 --21. ������� ������� �������� ���� Junior ������������

select avg(monthly_salary)
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%Junior%';

 --22. ������� ����� ������� JS �������������

select sum(monthly_salary)
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%JavaScript%';

 --23. ������� ����������� �� QA ���������

select min(monthly_salary)
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%QA%';

 --24. ������� ������������ �� QA ���������

select max(monthly_salary) 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%QA%';

 --25. ������� ���������� QA ���������

select count(table1.employee_name) 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.

select count(role_name) 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%Middle%';

-- 27. ������� ���������� �������������

select count(table1.employee_name)
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%developer%';

 --28. ������� ���� (�����) �������� �������������.

select sum(monthly_salary)
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name
      where role_name like '%developer%';

 --29. ������� �����, ��������� � �� ���� ������������ �� ����������� 

select table1.employee_name,role_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      order by monthly_salary;

 --30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select table1.employee_name,role_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where monthly_salary between 1700 and 2300
      order by monthly_salary;  

 --31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300

select table1.employee_name,role_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where monthly_salary < 2300
      order by monthly_salary;

 --32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000

select table1.employee_name,role_name,monthly_salary 
from (
      select employee_name,role_name 
      from roles_employee
      join employees on roles_employee.employee_id=employees.id
      join roles on roles_employee.role_id=roles.id) as table1
join (
      select employee_name,monthly_salary 
      from employee_salary
      join employees on employee_salary.employee_id=employees.id
      join salary on employee_salary.salary_id=salary.id) as table2
      on table1.employee_name = table2.employee_name 
      where monthly_salary in (1100,1500,2000)
      order by monthly_salary;