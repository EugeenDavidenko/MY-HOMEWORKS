--1.Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
)


--2.Наполнить таблицу employee 70 строками.

 insert into employees (employee_name)
 values ('Eugeen_1'),
	('Eugeen_2'),
        ('Eugeen_3'),
	('Eugeen_4'),
	('Eugeen_5'),
        ('Eugeen_6'),
	('Eugeen_7'),
	('Eugeen_8'),
	('Eugeen_9'),
	('Eugeen_10'),
	('Bocman_1'),
	('Bocman_2'),
	('Bocman_3'),
	('Bocman_4'),
	('Bocman_5'),
	('Bocman_6'),
	('Bocman_7'),
	('Bocman_8'),
	('Bocman_9'),
	('Bocman_10'),
	('Alex_1'),
	('Alex_2'),
	('Alex_3'),
	('Alex_4'),
	('Alex_5'),
	('Alex_6'),
	('Alex_7'),
        ('Alex_8'),
        ('Alex_9'),
        ('Alex_10'),
        ('Vitya_1'),
        ('Vitya_2'),
        ('Vitya_3'),
        ('Vitya_4'),
        ('Vitya_5'),
        ('Vitya_6'),
        ('Vitya_7'),
        ('Vitya_8'),
        ('Vitya_9'),
        ('Vitya_10'),
        ('Migus_1'),
        ('Migus_2'),
        ('Migus_3'),
        ('Migus_4'),
        ('Migus_5'),
	('Migus_6'),
        ('Migus_7'),
	('Migus_8'),
	('Migus_9'),
	('Migus_10'),
	('Bocha_1'),
	('Bocha_2'),
	('Bocha_3'),
        ('Bocha_4'),
        ('Bocha_5'),
        ('Bocha_6'),
        ('Bocha_7'),
        ('Bocha_8'),
        ('Bocha_9'),
        ('Bocha_10'),
	('Pasha_1'),
	('Pasha_2'),
	('Pasha_3'),
        ('Pasha_4'),
	('Pasha_5'),
        ('Pasha_6'),
        ('Pasha_7'),
        ('Pasha_8'),
        ('Pasha_9'),
        ('Pasha_10')
        

/*3.Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null*/

create table salary (
            id serial primary key,
monthly_salary int not null
);

/*4.Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500*/

insert into salary (monthly_salary)
values  (1000),
	(1100),
	(1200),
     	(1300),
	(1400),
	(1500),
	(1600),
	(1700),
	(1800),
	(1900),
	(2000),
	(2100),
	(2200),
	(2300),
	(2400),
	(2500);
	   
/*5.Создать таблицуemployee_salary 
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null */

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

/*6.Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
Данные для первых 10 строк берем из задания. 
Чтобы указать несуществующие employee_id указываем в 10 строках employee_id > 70 т.к. это максимальное значение id в таблице employees.
выполняем запрос. */

insert into employee_salary (employee_id,salary_id)
values  (3,7),
        (1,4),
        (5,9),
	(40,13),
	(23,4),
	(11,2),
	(52,10),
	(15,13),
	(26,4),
	(16,1),
	(33,7),
	(71,3),
	(4,5),
	(72,6),
	(25,15),
	(73,10),
	(51,9),
	(74,11),
	(30,14),
	(75,16),
	(35,2),
	(76,6),
	(44,9),
	(77,12),
	(45,15),
	(78,14),
	(50,11),
	(79,8),
	(55,5),
	(80,2),
	(22,1),
	(32,4),
	(27,7),
	(41,10),
	(37,13),
	(53,16),
	(49,12),
	(17,9),
	(20,6),
	(42,3);
		
/*7.Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique*/

create table roles(
id serial primary key,
role_name int not null unique
);

/*8. Поменять тип столба role_name с int на varchar(30)*/

alter table roles 
alter column role_name type varchar(30)

/*9.Наполнить таблицу roles 20 строками:*/
insert into roles (role_name)
values  ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

/*10.Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)*/

create table roles_employee (
          id serial  primary key,
 employee_id int not null unique ,
     role_id int not null references roles(id),
     foreign key (employee_id) references employees (id),
     foreign key (role_id) references roles(id)
);

/*11.Наполнить таблицу roles_employee 40 строками:*/
insert into roles_employee (employee_id,role_id)
values  (7,2),
        (20,4),
        (3,9),
        (5,13),
        (23,4),
        (11,2),
        (10,9),
        (22,13),
        (21,3),
        (34,4),
        (6,7),
        (1,1),
        (2,5),
        (4,6),
        (8,8),
        (9,10),
        (12,11),
        (13,12),
        (14,14),
        (15,15),
        (16,16),
        (17,17),
        (18,18),
        (19,19),
        (24,20),
        (35,19),
        (46,18),
        (57,17),
        (68,16),
        (49,15),
        (30,14),
        (51,13),
        (42,12),
        (26,11),
        (33,10),
        (56,9),
        (27,8),
        (58,7),
        (69,6),
        (70,5);




