/* NORMAL ACCOUNTS */
CREATE VIEW normals AS
SELECT *
FROM account_
WHERE account_type = 0 AND user_type = 0;

/* STUDENT ACCOUNTS */
CREATE VIEW students AS
SELECT *
FROM account_
WHERE account_type = 0 AND user_type = 1;

/* INSTRUCTOR ACCOUNTS */
CREATE VIEW instructors AS
SELECT *
FROM account_
WHERE account_type = 0 AND user_type = 2;

/* COMPANY ACCOUNTS */
CREATE VIEW companies AS
SELECT *
FROM account_
WHERE account_type = 1;

/* ALL USER ACCOUNTS */
CREATE VIEW users AS
SELECT *
FROM account_
WHERE account_type = 0;