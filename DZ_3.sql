CREATE DATABASE lesson_3;
USE lesson_3;

# 0. Cоздание и заполнение таблиц

CREATE TABLE IF NOT EXISTS salespeople (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  snum INT UNSIGNED,
  sname VARCHAR(70),
  city VARCHAR(70),
  comm DECIMAL(7,2)
);

INSERT INTO salespeople(
	snum, sname, city, comm)
VALUES
	(1001, "Peel", "London", 0.12),
	(1002, "Serres", "San Jose", 0.13),
	(1004, "Motika", "London", 0.11),
	(1007, "Rifkin", "Barcelona", 0.15),
	(1003, "Axelrod", "New York", 0.10);

CREATE TABLE IF NOT EXISTS customers (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cnum INT UNSIGNED,
  cname VARCHAR(70),
  city VARCHAR(70),
  rating INT UNSIGNED,
  snum INT UNSIGNED
);

INSERT INTO customers(
	cnum, cname, city, rating, snum)
VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);

-- # DROP TABLE orders;

CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  onum INT UNSIGNED,
  amt DECIMAL(7,2),
  odate DATE,
  cnum INT UNSIGNED,
  snum INT UNSIGNED
);

INSERT INTO orders(
	onum, amt, odate, cnum, snum) 
VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3003, 767.19, '1990-03-10', 2001, 1001),
	(3002, 1900.10, '1990-03-10', 2007, 1004),
	(3005, 5160.45, '1990-03-10', 2003, 1002),
	(3006, 1098.16, '1990-03-10', 2008, 1007),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);

# 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

SELECT city, sname, snum, comm 
FROM salespeople;

# 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

SELECT cname, city, rating 
FROM customers
WHERE city = "SanJose";

# 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)

SELECT DISTINCT snum
FROM orders;

# 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html

SELECT cname 
FROM customers
WHERE cname LIKE 'G%';

# 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)

SELECT * 
FROM orders
WHERE amt > 1000;

# 6.	Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)

SELECT
	MIN(amt) AS MinValue
FROM orders;

# 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT *
FROM customers
WHERE rating > 100 AND city <> "Rome";

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  

# 0. 	Создание таблицы

CREATE TABLE IF NOT EXISTS staff (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(45), 
  surname VARCHAR(45), 
  specialty VARCHAR(45), 
  seniority INT UNSIGNED, 
  salary DECIMAL(9, 2), 
  age INT UNSIGNED
);

INSERT staff (
	 name, surname, specialty, seniority, salary, age)
VALUES
	 ('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Петькин', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	 ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
	 ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
	 ('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);

# 1. 	Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT *
FROM staff
ORDER BY salary;

SELECT * 
FROM staff
ORDER BY salary DESC;

# 2.** 	Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

SELECT * 
FROM ( 
	SELECT * 
	FROM staff 
	ORDER BY salary DESC 
	LIMIT 5
) AS res
ORDER BY salary;

# 3. 	Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT 
	specialty, 
    SUM(salary) AS samSalary
FROM staff
GROUP BY specialty
HAVING samSalary > 100000 
ORDER BY samSalary DESC;