SELECT * FROM budget;
SELECT * FROM investor;

ALTER TABLE investor
CHANGE name investor_name varchar(250) NOT NULL ;

USE pm_system;

SELECT investor_name, COUNT(cost_type) FROM investor
INNER JOIN budget_investor
    ON investor.id_investor = budget_investor.id_investor
INNER JOIN budget b on budget_investor.id_budget = b.id_budget
GROUP BY investor_name;

SELECT project_name, surname, position, COUNT(task_name) as count
FROM project
INNER JOIN department d on project.id_project = d.id_project
INNER JOIN user_department ud on d.id_department = ud.id_department
INNER JOIN user u on ud.id_user = u.id_user
INNER JOIN task_user_department tud on ud.id_user_department = tud.id_user_department
INNER JOIN task t on d.id_department = t.id_department
GROUP BY surname
WITH ROLLUP
ORDER BY project_name, count;

SELECT * FROM task
ORDER BY deadline;

SELECT surname, COUNT(task_name) FROM user
INNER JOIN user_department ON user.id_user = user_department.id_user
INNER JOIN task_user_department ON user_department.id_user_department = task_user_department.id_user_department
INNER JOIN task ON task_user_department.id_task = task.id_task
WHERE deadline >= ((CURRENT_DATE))
    AND status = 1
GROUP BY surname;

