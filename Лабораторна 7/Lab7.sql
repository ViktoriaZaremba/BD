USE pm_system;

SELECT * FROM user;

SELECT password
    FROM pm_system.user WHERE id_user = 1;

SELECT * FROM task;

SELECT pm_system.user.id_user, pm_system.user.name, pm_system.user.surname, pm_system.task.name, pm_system.task.deadline
    FROM pm_system.user LEFT JOIN pm_system.user_department ON
    user.id_user = pm_system.user_department.id_user
    LEFT JOIN pm_system.department ON
    pm_system.user_department.id_department = pm_system.department.id_department
    LEFT JOIN pm_system.task ON
    pm_system.department.id_department = pm_system.task.id_department;

SELECT pm_system.project.id_project, pm_system.project.name, pm_system.department.name
    FROM pm_system.project INNER JOIN pm_system.department ON
    pm_system.project.id_project = pm_system.department.id_project;

SELECT pm_system.department.name, pm_system.task.name
    FROM pm_system.department INNER JOIN pm_system.task
    ON department.id_department = task.id_department
    WHERE pm_system.department.name IN ('Писарство', 'Інтендантка', 'Реманент');

SELECT pm_system.user.surname, pm_system.user.name FROM user
    WHERE NOT EXISTS
        (SELECT * FROM user_department WHERE user.id_user = user_department.id_user);

SELECT surname, name, password
    FROM user
    WHERE CHAR_LENGTH(password)<8 OR (password NOT REGEXP '[0-9]');


