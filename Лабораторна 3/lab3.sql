SHOW TABLES;    #Показує таблиці БД
DESCRIBE project;   #Деталі конкретної таблиці

ALTER TABLE pm_system.task_user_department
    DROP FOREIGN KEY fk_tud_ud,
    DROP INDEX fk_tud_ud;

SHOW INDEX FROM pm_system.task_user_department;
SHOW CREATE TABLE pm_system.task_user_department;

ALTER TABLE pm_system.task_user_department
    ADD CONSTRAINT fk_tud_ud FOREIGN KEY(id_user_department)
        REFERENCES PM_System.user_department(id_user_department) ON UPDATE NO ACTION ON DELETE NO ACTION;

DESCRIBE pm_system.task;

ALTER TABLE pm_system.task
    DROP COLUMN status,
    ADD COLUMN start DATE;

ALTER TABLE pm_system.task
    ADD COLUMN status BOOL;

DESCRIBE pm_system.user;

ALTER TABLE pm_system.user
    MODIFY COLUMN phone_number char(12) NULL;

DESCRIBE pm_system.task;

ALTER TABLE pm_system.task
    MODIFY priority ENUM ('low', 'high', 'medium') DEFAULT 'medium',
    ADD COLUMN id_version TINYINT(8) UNSIGNED NOT NULL  AFTER id_task,
    ADD CONSTRAINT UNIQUE OQ_task_version (id_task, id_version);

DESCRIBE pm_system.task;

ALTER TABLE pm_system.department
    DROP FOREIGN KEY fk_department_project;
ALTER TABLE pm_system.department
    ADD CONSTRAINT fk_department_project FOREIGN KEY (id_project)
    REFERENCES pm_system.project (id_project) ON DELETE CASCADE;

ALTER TABLE pm_system.task
    DROP FOREIGN KEY fk_task_department;
ALTER TABLE pm_system.task
    ADD CONSTRAINT fk_task_department FOREIGN KEY (id_department)
    REFERENCES pm_system.department (id_department) ON DELETE CASCADE;

ALTER TABLE pm_system.user_department
    DROP FOREIGN KEY fk_department_user_department;
ALTER TABLE pm_system.user_department
    ADD CONSTRAINT fk_department_user_department FOREIGN KEY(id_department)
        REFERENCES  PM_System.department(id_department) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE pm_system.user_department
    DROP FOREIGN KEY fk_user_user_department;
ALTER TABLE pm_system.user_department
    ADD CONSTRAINT fk_user_user_department FOREIGN KEY(id_user)
        REFERENCES PM_System.user(id_user)  ON DELETE CASCADE;

ALTER TABLE pm_system.user_department
    DROP FOREIGN KEY fk_department_user_department;
ALTER TABLE pm_system.user_department
    ADD CONSTRAINT fk_department_user_department FOREIGN KEY(id_department)
        REFERENCES  PM_System.department(id_department) ON DELETE CASCADE;

ALTER TABLE pm_system.task_user_department
    DROP FOREIGN KEY fk_tud_ud;
ALTER TABLE pm_system.task_user_department
    ADD CONSTRAINT fk_tud_ud FOREIGN KEY(id_user_department)
        REFERENCES PM_System.user_department(id_user_department) ON DELETE CASCADE;

ALTER TABLE pm_system.task_user_department
    DROP FOREIGN KEY fk_tud_task;
ALTER TABLE pm_system.task_user_department
    ADD CONSTRAINT fk_tud_task FOREIGN KEY(id_task)
        REFERENCES  PM_System.task(id_task) ON DELETE CASCADE;


