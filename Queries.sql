/* TEKLİ TABLOLAR */

/* Tüm premium hesaplar. */
SELECT *
FROM account_
WHERE premium;

/* Tüm gönderiler. */
SELECT *
FROM status_;

/* Tüm gruplar */
SELECT g.group_name AS name_, g.privacy_type AS is_private, g.create_account_id AS creator_id
FROM group_ AS g;

/* İKİLİ TABLOLAR */

/* Kimler takipleşiyor. */
SELECT f.user_name, f.first_name, f.last_name, s.user_name, s.first_name, s.last_name 
FROM account_ AS f, account_ AS s, connect AS c
WHERE f.account_id = c.account_id AND s.account_id = c.connecter_id;

/* Herhangi bir hesabın takipçileri */
SELECT f.user_name, f.first_name, f.last_name, s.user_name, s.first_name, s.last_name
FROM account_ AS f, account_ AS s, connect AS c
WHERE f.user_name = 'aliilman' AND ((f.account_id = c.account_id AND s.account_id = c.connecter_id) OR (f.account_id = c.connecter_id AND s.account_id = c.account_id));

/* Profili görüntüleyen hesaplar. */
SELECT f.first_name AS viewed_name, f.last_name AS viewed_surname, s.first_name AS viewing_name, s.last_name AS viewing_surname
FROM  account_ AS f, account_ AS s, view_profile AS v
WHERE f.user_name = "muratosman" AND v.viewed_id = f.account_id AND v.account_id = s.account_id;

/* Herhangi iki kişi arasındaki mesajlar. */
SELECT f.user_name AS from_, s.user_name AS to_, m.text_message AS message, m.message_date AS time
FROM account_ AS f, account_ AS s, message AS m
WHERE f.user_name = "ekinaslan" AND f.user_name = "aliilman" AND (m.sender_id = f.account_id AND m.receiver_id = s.account_id) OR (m.sender_id = s.account_id AND m.receiver_id = f.account_id)
ORDER BY time;

/* ÜÇLÜ TABLOLAR */

/* Kişilerin beğendiği durumların listesi.*/
SELECT a.user_name, s.text_, s.status_id
FROM account_like_status AS als, account_ AS a, status_ AS s
WHERE als.account_id = a.account_id AND als.status_id = s.status_id;

/* Öğrencilerin aldığı kursların listesi. */
SELECT a.first_name, a.last_name, c.course_name, s.note
FROM instructor_teaches_course AS i, student_takes_course AS s, account_ AS a, course AS c
WHERE i.course_id = s.course_id AND s.account_id = a.account_id AND c.course_id = s.course_id;

/* Herhangi bir hesabın akışı. (Grup paylaşımları dahil değil.) */
SELECT f.user_name AS flow_account, l.first_name AS sharer_name, l.last_name AS sharer_surname, s.text_, s.status_date AS date_, s.status_id
FROM account_ AS f
JOIN status_ AS s
JOIN connect AS c ON (c.account_id = f.account_id AND c.connecter_id = s.account_id) OR (c.account_id = s.account_id AND c.connecter_id = f.account_id)
JOIN account_ AS l ON l.account_id = s.account_id
JOIN share_in_group AS sig ON sig.status_id != s.status_id
WHERE f.user_name = "esraduman"
ORDER BY date_;

/* KRİTİK TABLOLAR */

/* Zayıf şifreleri bulma. */
SELECT *
FROM account_
WHERE user_password LIKE "%123%";

/* Belirli tarihlerdeki gönderiler. */
SELECT *
FROM status_
WHERE status_date BETWEEN "2022-01-01" AND "2022-02-01";

/* Belirli grubun mesajları. */
SELECT a.user_name, s.text_, s.status_date
FROM status_ AS s
JOIN share_in_group AS sig ON sig.status_id = s.status_id
JOIN account_ AS a ON a.account_id = s.account_id
WHERE sig.group_id = 1
ORDER BY s.status_date;

/* Premium hesap sayısı. */
SELECT COUNT(*)
FROM account_
WHERE premium;

/* En yüksek, en düşük ve ortalama not. */
SELECT AVG(note) AS avarage, MIN(note) AS minimum, MAX(note) AS maximum
FROM student_takes_course;

/* UPDATE, DELETE VE INSERT'LER */

/* Not arttırma :) */
UPDATE student_takes_course
SET note = LEAST(note + 10, 100);

/* Sertifika geçerliliğini değiştirme. */
UPDATE user_has_certificate
SET expiration_date = "2025-01-01"
WHERE acount_id = 3;

/* Şifre değiştirme. */
UPDATE account_
SET user_password = "#BF0707"
WHERE user_name = "ekinaslan";

/* Hesap silme. */
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM account_
WHERE account_id = 5;
SET FOREIGN_KEY_CHECKS = 1;

/* Sertifika silme. */
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM user_has_certificate
WHERE account_id = 2 AND certificate_id = 1;
SET FOREIGN_KEY_CHECKS = 1;

/* Not silme. */
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM student_takes_course
WHERE account_id = 3 AND course_id = 1;
SET FOREIGN_KEY_CHECKS = 1;

/* Hesap ekleme. */
INSERT INTO account_ VALUES (5, "codd", "relationalmodel", "Edgar Frank", "Ted", "Codd", "Male", "edgarfcodd@gmail.com", "2022-01-29", FALSE, NULL, 0, 0, "English", DEFAULT);

/* Sertifika ekleme. */
INSERT INTO user_has_certificate VALUES (2, 1, "2022-02-02", NULL);

/* Not ekleme. */
INSERT INTO student_takes_course VALUES (3, 1, 100);