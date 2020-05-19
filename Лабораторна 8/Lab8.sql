USE pm_system;

SELECT task_name, deadline FROM task
WHERE status = 1
ORDER BY deadline
LIMIT 3;

SELECT * FROM project;

SELECT * FROM task;

DESCRIBE task;

ALTER TABLE project
CHANGE name project_name varchar(99) NOT NULL;
ALTER TABLE department
CHANGE name dep_name varchar(50) not null;
ALTER TABLE task
CHANGE name task_name TEXT NOT NULL;

SELECT project_name, dep_name, task_name, deadline
FROM project
INNER JOIN department
INNER JOIN task
    ON department.id_department = task.id_department
    AND project.id_project = department.id_project
WHERE project.id_project = 25
ORDER BY department.id_department;

SELECT * FROM budget;

SELECT cost_type, SUM(price*number) FROM budget
GROUP BY cost_type;