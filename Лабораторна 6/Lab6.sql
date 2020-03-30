USE pm_system;

SELECT * FROM task;

CREATE TABLE department2 AS SELECT DISTINCT id_department, name, id_project
    FROM department
    WHERE id_department>2 AND id_department<8;

SELECT * FROM department2;

CREATE VIEW task2 AS SELECT DISTINCT name, deadline, id_department
    FROM task;

SELECT * FROM task2;

CREATE VIEW task3 AS SELECT DISTINCT name, deadline, id_department
    FROM task
    WHERE deadline>'2020-01-01';

SELECT * FROM task3;

SELECT department2.id_department, department2.name, task2.name, task2.deadline
    FROM department2, task2
    WHERE department2.id_department = task2.id_department;

SELECT department2.id_department, department2.name, task2.name, task2.deadline
    FROM department2, task2
    WHERE department2.id_department = task2.id_department
    AND task2.deadline>CURDATE();