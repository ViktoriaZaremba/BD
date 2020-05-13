CREATE DATABASE PM_System CHARACTER SET utf8;

CREATE TABLE PM_System.user(
    id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
    surname varchar(30) NOT NULL,
    name varchar(40) NOT NULL,
    mail_adress varchar(50) NOT NULL,
    phone_number char(12) NOT NULL,
    password varchar(99) NOT NULL,
    PRIMARY KEY (id_user)
);

CREATE TABLE PM_System.project(
    id_project INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name varchar(99) NOT NULL,
    date DATE NOT NULL,
    active BOOL NOT NULL,
    purpose TEXT,
    place TEXT,
    target_audience VARCHAR(100),
    comments TEXT,
    PRIMARY KEY (id_project)
);

CREATE TABLE PM_System.department(
    id_department INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    id_project INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_department),
    CONSTRAINT fk_department_project FOREIGN KEY (id_project)
        REFERENCES PM_System.project(id_project) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PM_System.task(
    id_task INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name TEXT NOT NULL,
    details TEXT,
    deadline DATE,
    status BOOL,
    comment TEXT,
    priority TINYINT,
    id_department INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_task),
    CONSTRAINT task_department FOREIGN KEY (id_department)
        REFERENCES PM_System.department(id_department) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PM_System.user_department(
    id_user_department INT UNSIGNED NOT NULL AUTO_INCREMENT,
    position VARCHAR(99) NOT NULL,
    id_user INT UNSIGNED NOT NULL,
    id_department INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_user_department),
    CONSTRAINT user_user_department FOREIGN KEY(id_user)
        REFERENCES PM_System.user(id_user) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT department_user_department FOREIGN KEY(id_department)
        REFERENCES  PM_System.department(id_department) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PM_System.task_user_department(
    id_task_user_department INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_user_department INT UNSIGNED NOT NULL,
    id_task INT UNSIGNED NOT NULL,
    start_data DATE NOT NULL,
    PRIMARY KEY (id_task_user_department),
    CONSTRAINT tud_ud FOREIGN KEY(id_user_department)
        REFERENCES PM_System.user_department(id_user_department) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT tud_task FOREIGN KEY(id_task)
        REFERENCES  PM_System.task(id_task) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PM_System.budget(
    id_budget INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cost_type VARCHAR(250) NOT NULL,
    cost_item VARCHAR(250) NOT NULL,
    price INT UNSIGNED NOT NULL,
    number INT UNSIGNED NOT NULL,
    comment TEXT,
    id_project INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_budget),
    CONSTRAINT budget_project FOREIGN KEY (id_project)
        REFERENCES PM_System.project(id_project) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE PM_System.investor(
    id_investor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    type VARCHAR(250),
    contact_person VARCHAR(250) NOT NULL,
    contact_phone VARCHAR(12),
    contact_mail VARCHAR(12),
    PRIMARY KEY (id_investor)
);

CREATE TABLE PM_System.budget_investor(
    id_budget INT UNSIGNED NOT NULL,
    id_investor INT UNSIGNED NOT NULL,
    sum FLOAT NOT NULL,
    PRIMARY KEY (id_investor, id_budget),
    CONSTRAINT bud_inv FOREIGN KEY (id_budget)
        REFERENCES PM_System.budget(id_budget) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT inv_bud FOREIGN KEY (id_investor)
        REFERENCES PM_System.investor(id_investor) ON DELETE NO ACTION ON UPDATE NO ACTION
);
