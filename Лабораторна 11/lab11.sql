START TRANSACTION;
INSERT INTO department VALUE (null, 'program', 24);
INSERT INTO department VALUE (null, 'харчування', 24);
INSERT INTO department VALUE (null, 'оптимізаційне забезпечення', 24);
SAVEPOINT one;
INSERT INTO project VALUE (null, 'Dojo', '2020-05-28', 1);
COMMIT;
ROLLBACK TO SAVEPOINT one;
COMMIT;