USE pm_system;

#Завдання 1
#функції кодування і декодування паролю
CREATE FUNCTION mycms_encode (pass VARCHAR(99))
    RETURNS TINYBLOB
    RETURN AES_ENCRYPT(pass, 'key-key');

CREATE FUNCTION mycms_decode (pass TINYBLOB)
    RETURNS VARCHAR(48)
    RETURN AES_DECRYPT(UNHEX(pass), 'key-key');

SET GLOBAL log_bin_trust_function_creators = 1;

#кодування паролю таблиці user
UPDATE user SET password = HEX(mycms_encode(password));
SELECT surname, password FROM user;

#запит декодованого паролю
SELECT surname, mycms_decode(UNHEX(password)) FROM user;
SELECT surname, password FROM user;

#декодування паролю
UPDATE user SET password = mycms_decode(UNHEX(password));
SELECT surname, password FROM user;


# Завдання 2
SELECT id_task,task_name,start, deadline FROM task;
SELECT * FROM project;
UPDATE task SET start = '2018-11-01' WHERE id_task BETWEEN 34 AND 41;
UPDATE task SET deadline = '2018-12-16' WHERE id_task BETWEEN 34 AND 41;
UPDATE task SET start = '2020-03-30' WHERE id_task BETWEEN 44 AND 48;

DESCRIBE department;


DELIMITER //
CREATE PROCEDURE task_count(IN name VARCHAR(30), IN date1 DATE, IN date2 DATE)
    BEGIN
        DECLARE error VARCHAR(25);
        SET error = 'Неправильні вхідні дані';
        IF (date1 <= date2) THEN
            BEGIN
                CREATE TABLE IF NOT EXISTS pm_system.dep_tasks (department_name VARCHAR(20), number INT UNSIGNED) char set UTF8MB4;
                TRUNCATE pm_system.dep_tasks;
                INSERT INTO pm_system.dep_tasks SELECT pm_system.department.dep_name AS department_name,
                COUNT(pm_system.task.id_task) AS number
                FROM (project INNER JOIN department) INNER JOIN task
                ON project_name = name
                AND project.id_project = department.id_project
                AND department.id_department = task.id_department
                WHERE deadline BETWEEN date1 AND date2
                GROUP BY department_name;
            END;
        ElSE SELECT error;
        END IF;
    END//
DELIMITER;

SELECT * FROM project;
SELECT * FROM task;

CALL task_count('Summer Camp', '2020-05-01', '2020-07-15');
SELECT * FROM pm_system.dep_tasks;

CALL task_count('Summer Camp', '2020-08-01', '2020-07-15');
SELECT * FROM pm_system.dep_tasks;

DROP PROCEDURE show_user_tasks;

# Завдання
DELIMITER //
CREATE PROCEDURE show_user_tasks(IN user_sername VARCHAR(30))
    BEGIN
        CREATE table if not exists user_tasks (u_task VARCHAR(20), t_deadline DATE) char set UTF8MB4;
        TRUNCATE pm_system.user_tasks;
        INSERT INTO pm_system.user_tasks SELECT pm_system.task.task_name as u_task,
        pm_system.task.deadline as t_deadline
        FROM ((pm_system.user INNER JOIN user_department) INNER JOIN task_user_department) INNER JOIN task
        ON surname = user_sername
        AND user.id_user = user_department.id_user
        AND user_department.id_user_department = task_user_department.id_user_department
        AND task_user_department.id_task = task.id_task
        WHERE status = 1;
        SELECT * FROM user_tasks;
    end //
DELIMITER ;

CALL show_user_tasks('Zaremba');
