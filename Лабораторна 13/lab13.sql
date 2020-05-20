
DESCRIBE project;
SHOW INDEX FROM project;

SHOW INDEX FROM department;

SELECT * FROM project;
SELECT * FROM department;

CREATE INDEX userINDX3 ON user (id_user, surname, name);
SHOW INDEX FROM user;

CREATE UNIQUE INDEX projIND ON project (project_name);
SHOW INDEX FROM project;


EXPLAIN SELECT pm_system.user.id_user, pm_system.user.name, pm_system.user.surname, pm_system.task.task_name, pm_system.task.deadline
    FROM pm_system.user LEFT JOIN pm_system.user_department ON
    user.id_user = pm_system.user_department.id_user
    LEFT JOIN pm_system.department ON
    pm_system.user_department.id_department = pm_system.department.id_department
    LEFT JOIN pm_system.task ON
    pm_system.department.id_department = pm_system.task.id_department;

EXPLAIN SELECT STRAIGHT_JOIN pm_system.user.id_user, pm_system.user.name, pm_system.user.surname, pm_system.task.task_name, pm_system.task.deadline
    FROM pm_system.user LEFT JOIN pm_system.user_department ON
    user.id_user = pm_system.user_department.id_user
    LEFT JOIN pm_system.department ON
    pm_system.user_department.id_department = pm_system.department.id_department
    LEFT JOIN pm_system.task ON
    pm_system.department.id_department = pm_system.task.id_department;


EXPLAIN SELECT surname, name, task_name FROM user
INNER JOIN user_department ud on user.id_user = ud.id_user
INNER JOIN task_user_department tud on ud.id_user_department = tud.id_user_department
INNER JOIN department d on ud.id_department = d.id_department
INNER JOIN task t on d.id_department = t.id_department;

EXPLAIN SELECT STRAIGHT_JOIN surname, name, task_name FROM user
INNER JOIN user_department ud on user.id_user = ud.id_user
INNER JOIN task_user_department tud on ud.id_user_department = tud.id_user_department
INNER JOIN department d on ud.id_department = d.id_department
INNER JOIN task t on d.id_department = t.id_department;