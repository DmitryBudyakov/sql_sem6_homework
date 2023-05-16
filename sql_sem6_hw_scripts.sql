# SQL. Семинар 6. Домашняя работа.

USE lesson_6;

/*
Задание 1.
Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
Задание 2.
Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +2: х = 2, х += 2)
*/

-- 1 Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION secs_to_time(n INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE day_secs INT DEFAULT 86400;
    DECLARE hrs_secs INT DEFAULT 3600;
    DECLARE min_secs INT DEFAULT 60;
	DECLARE days INT;
    DECLARE days_ost INT;
    DECLARE hrs INT;
    DECLARE hrs_ost INT;
    DECLARE mins INT;
    DECLARE sec INT;

	SET days = n DIV day_secs;
	SET days_ost = n MOD day_secs;
	SET hrs = days_ost DIV hrs_secs;
	SET hrs_ost = days_ost MOD hrs_secs;
	SET mins = hrs_ost DIV min_secs;
	SET sec = hrs_ost MOD min_secs;
	RETURN concat(days, ' days ', hrs, ' hours ', mins, ' minutes ', sec, ' seconds');

END $$
DELIMITER ;

SELECT secs_to_time(123456);


-- 2 Выведите только четные числа от 1 до 10 включительно.
DELIMITER $$
CREATE FUNCTION even_nums(n INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 2;
    DECLARE res VARCHAR(255) DEFAULT '';
    
    IF n < 2 THEN
		RETURN concat('Вы ввели число ', n, '. Введите число >= 2');
	ELSE
		WHILE i <= n DO
			SET res = CONCAT(res, ' ', i);
            SET i = i + 2;
		END WHILE;
        RETURN res;
	END IF;
END $$
DELIMITER ;

SELECT even_nums(10) AS even_numbers;
