USE pm_system;

SELECT * FROM user;

CREATE TABLE pm_system.user1
    AS SELECT id_user, surname, name FROM user
        WHERE id_user<8;

CREATE TABLE pm_system.user2
    AS SELECT id_user, surname, name FROM user
        WHERE id_user>5;

SELECT * FROM user1;

SELECT * FROM user2;

#   обєднання
SELECT * FROM user1
    UNION SELECT * FROM user2;

#   Перетин
SELECT * FROM user1
    WHERE id_user IN (SELECT id_user from user2);

#   Різниця
SELECT * FROM user1
    WHERE id_user NOT IN (SELECT id_user from user2);

#   Декартовий добуток
SELECT * FROM user1, user2;