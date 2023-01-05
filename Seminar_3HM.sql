DROP DATABASE IF EXISTS lesson_3_hm;
CREATE DATABASE lesson_3_hm;
USE lesson_3_hm;

DROP TABLE IF EXISTS staffing;
CREATE TABLE staffing (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR (30) NOT NULL,
    `surname` VARCHAR (30) NOT NULL,
    `speciality` VARCHAR (30) NOT NULL,
    `seniority` INT NOT NULL,
    `salary` INT NOT NULL,
    `age` INT NOT NULL
);

INSERT staffing(`name`, surname, speciality, seniority, salary, age)
VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM staffing LIMIT 5;

/* 1.
Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
*/

SELECT *
FROM staffing
ORDER BY salary;

SELECT *
FROM staffing
ORDER BY salary DESC;

/* 2. 
Выведите 5 максимальных зарплат (salary)
*/

SELECT *
FROM staffing
ORDER BY salary DESC
LIMIT 5;

/* 3. 
Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
*/

SELECT speciality, SUM(salary) AS whole_salary
FROM staffing
GROUP BY speciality;

/* 4. 
Найти количество сотрудников по специальности “Рабочий” (post) в возрасте от 24 до 42 лет
*/

SELECT speciality, COUNT(speciality) AS workers_count
FROM staffing
WHERE age >= 24 AND age <= 42
GROUP BY speciality
HAVING speciality = 'рабочий';

/* 5. 
Найти количество специальностей
*/

SELECT COUNT(DISTINCT speciality) AS speciality_list
FROM staffing;

/* 6. 
Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
*/

SELECT speciality, AVG(age) AS age_to_44
FROM staffing
GROUP BY speciality
HAVING age_to_44 < 44;