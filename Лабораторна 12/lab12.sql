SELECT * FROM investor;
SELECT * FROM budget_investor ORDER BY id_investor;

CREATE
    TRIGGER investor_del BEFORE DELETE
    ON pm_system.investor FOR EACH ROW
    UPDATE pm_system.budget_investor SET id_investor=5 WHERE id_investor=OLD.id_investor;

DELETE FROM investor WHERE id_investor=2;
SELECT * FROM budget_investor ORDER BY id_investor;

CREATE
    TRIGGER user_pass BEFORE
    INSERT ON pm_system.user FOR EACH ROW
    SET NEW.password = HEX(AES_ENCRYPT(NEW.password, 'key-key'));


INSERT INTO user VALUES
    (null,'Zhyk', 'Anastasia', 'nastiositi@gmail.com', '+380946735103', 'j43rfiejfioj398ufiej'),
    (null,'Kruchkovska', 'Krystya', 'Krych@gmail.com', '+398046294683', 'fijeodks');

SELECT * FROM user LIMIT 12, 2;

ALTER TABLE department
ADD max_num_of_tasks INT UNSIGNED NOT NULL  DEFAULT 10;

DELIMITER //
CREATE PROCEDURE err()
    BEGIN
        DECLARE error VARCHAR(30);
        SET error = 'Перевищена кількість завдань';
        SELECT error;
    END;
DELIMITER ;


DELIMITER //
CREATE TRIGGER max_task
    BEFORE INSERT
    ON task FOR EACH ROW
    BEGIN
        DECLARE max INT UNSIGNED;
        DECLARE sum INT UNSIGNED;
        DECLARE MESSAGE_TEXT TEXT;
        SET max = (SELECT max_num_of_tasks FROM department);
        SELECT COUNT(*) INTO @sum FROM task;
        IF sum>28 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Перевищено ліміт завдань';
        end if ;
    end //
DELIMITER ;

DROP TRIGGER max_task;

SELECT * FROM task;
SELECT * FROM department;
SELECT COUNT(task.id_department) as sum FROM task;
DESCRIBE task;

INSERT INTO pm_system.task VALUES
    (null, 'task3', null, null, null, null, 20, null, null),
    (null, 'task4', null, null, null, null, 20, null, null),
    (null, 'task5', null, null, null, null, 20, null, null),
    (null, 'task6', null, null, null, null, 20, null, null),
    (null, 'task7', null, null, null, null, 20, null, null),
    (null, 'task8', null, null, null, null, 20, null, null),
    (null, 'task9', null, null, null, null, 20, null, null);

SELECT * FROM task;

INSERT INTO pm_system.task VALUES
    (null, 'task11', null, null, null, null, 20, null, null);



CREATE TRIGGER budget_investor_sum
    BEFORE INSERT ON budget_investor
    FOR EACH ROW
    BEGIN
        IF NEW.sum = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Некоректна сума інвестицій';
        end if;
    end;

DROP TRIGGER budget_investor_sum;

SELECT * FROM budget;
SELECT * FROM investor;
SELECT * FROM budget_investor;

INSERT INTO budget_investor VALUE (4,5, 0);

