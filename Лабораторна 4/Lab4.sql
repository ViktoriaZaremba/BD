SHOW DATABASES;

USE pm_system;

DESCRIBE user;

ALTER TABLE pm_system.user
MODIFY phone_number varchar(13) NOT NULL ;

INSERT INTO user VALUES (1, 'Zaremba', 'Viktoria', 'vika241020@gmail.com', '+380985796738', '12345678');

INSERT INTO user
VALUES (NULL, 'Vyshnevska', 'Anastasia', 'urbica@gmail.com', '+123456789012', 'jlkdc'),
       (NULL, 'Boyechko', 'Denys', 'Denys@gmail.com', '+158956789012', 'vdsvzc'),
       (NULL, 'Popova', 'Daryna', 'daryna@gmail.com', '+123908789012', 'f8uejiosdak'),
       (NULL, 'Kondratyk', 'Bogdana', 'bogdana@gmail.com', '+789456789012', 'cdjvx'),
       (NULL, 'Rogynski', 'Roman', 'roman@gmail.com', '+124568789012', 'jocs,lm'),
       (NULL, 'Osovska', 'Sophia', 'sonya@gmail.com', '+789458909012', 'uhdosj.k'),
       (NULL, 'Мацків', 'Настя', 'nastya@gmail.com', '+789450009012', 'ujdscdosj.k'),
       (NULL, 'Корінь', 'Оля', 'olya@gmail.com', '+789458909012', 'udjsksj.k'),
       (NULL, 'Осташевська', 'Надійка', 'nadia@gmail.com', '+789458909012', 'uhvdjkj.k'),
       (NULL, 'Драбик', 'Ярина', 'yaryna@gmail.com', '+789458909012', 'uhdosj.kjdj'),
       (NULL, 'Зубик', 'Віка', 'vika@gmail.com', '+789458909012', 'uhdokdjv.k');

SELECT * FROM user;

DESCRIBE project;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\project_.csv'
    INTO TABLE project
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (name, date, active, purpose, place,target_audience)
    SET id_project = NULL;

SELECT * FROM project;

ALTER TABLE investor
MODIFY contact_phone varchar(13);
ALTER TABLE investor
MODIFY contact_mail varchar(50);

DESCRIBE investor;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\investor.csv'
    INTO TABLE investor
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (name, type, contact_person, contact_phone, contact_mail)
    SET id_investor = NULL;

SELECT * FROM investor;

DESCRIBE department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\department.csv'
    INTO TABLE department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (name, id_project)
    SET id_department = NULL;

DESCRIBE user_department;

SELECT * FROM project;
SELECT * FROM user;
SELECT * FROM department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\user_department.csv'
    INTO TABLE user_department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (position, id_user, id_department)
    SET id_user_department = NULL;

SELECT * FROM user_department;
SELECT * FROM department;

DESCRIBE task;

ALTER TABLE task
DROP id_version;

UPDATE pm_system.project
SET date = '2020-07-07'
WHERE id_project = 25;

ALTER TABLE pm_system.task
    MODIFY deadline DATE DEFAULT NULL;
ALTER TABLE pm_system.task
    MODIFY start DATE DEFAULT NULL;
ALTER TABLE pm_system.task
MODIFY status tinyint(1) DEFAULT 1;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task.csv'
    INTO TABLE task
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (name,details,deadline,comment, priority, id_department, start, status)
    SET id_task=NULL;

SELECT * FROM task;

DESCRIBE task_user_department;

ALTER TABLE task_user_department
DROP COLUMN start_data;

SELECT * FROM task;
SELECT * FROM user_department;
SELECT * FROM user;
SELECT * FROM department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task_user_department.csv'
    INTO TABLE task_user_department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (id_user_department, id_task)
    SET id_task_user_department=NULL;

DESCRIBE budget;

ALTER TABLE budget
MODIFY price FLOAT UNSIGNED NOT NULL ;

SELECT * FROM investor;

INSERT INTO investor VALUES (4, 'вкладка учасників', 'вкладка', 'учасники', '-','-');
INSERT INTO investor VALUES (5, 'інше', 'інше', 'інше', '-','-');

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\budget.csv'
    INTO TABLE budget
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (cost_type,cost_item,price,number,id_project)
    SET id_budget=NULL;

SELECT * FROM budget;
SELECT * FROM investor;

DESCRIBE budget_investor;

ALTER TABLE budget_investor
MODIFY sum FLOAT UNSIGNED;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\budget_investor.csv'
    INTO TABLE budget_investor
    CHARACTER SET CP1251
    FIELDS TERMINATED BY';'
    LINES TERMINATED BY '\r\n'
    (id_budget,id_investor, sum);

SELECT * FROM budget_investor;
DESCRIBE project;

SELECT * FROM project;
UPDATE project SET name = "Курінний табір"
    WHERE id_project=2;
UPDATE project SET name = "Вишкыл проектного менеджменту"
    WHERE id_project=3;
SELECT * FROM project
ORDER BY date;

SELECT * FROM user;

DELETE FROM user
WHERE surname = 'Popova';

SELECT * FROM user;

