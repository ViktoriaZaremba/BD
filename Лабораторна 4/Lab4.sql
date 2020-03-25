SHOW DATABASES;

USE pm_system;

DESCRIBE user;

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

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\project.csv'
    INTO TABLE project
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n';

SELECT * FROM project;

DESCRIBE investor;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\investors.csv'
    INTO TABLE investor
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n';

SELECT * FROM investor;

DESCRIBE department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\department.csv'
    INTO TABLE department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n';

DESCRIBE user_department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\user_department.csv'
    INTO TABLE user_department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n';

SELECT * FROM user_department;

DESCRIBE task;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task.csv'
    INTO TABLE task
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (name,deadline,id_department)
    SET id_task=NULL;

DESCRIBE task_user_department;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\task_user_department.csv'
    INTO TABLE task_user_department
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (id_user_department, id_task)
    SET id_task_user_department=NULL;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\budget.cvs'
    INTO TABLE budget
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (cost_item,price,number,id_project)
    SET id_budget=NULL;

SELECT * FROM budget;

DESCRIBE budget_investor;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\budget_investor.cvs'
    INTO TABLE budget_investor
    CHARACTER SET CP1251
    FIELDS TERMINATED BY ';'
    LINES TERMINATED BY '\n'
    (id_budget,id_investor);

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

