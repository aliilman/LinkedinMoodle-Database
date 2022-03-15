/* APP LANGUAGE | NAME */
INSERT INTO app_language VALUES ("Turkish");
INSERT INTO app_language VALUES ("English");
INSERT INTO app_language VALUES ("Russian");
INSERT INTO app_language VALUES ("German");
INSERT INTO app_language VALUES ("Spanish");
INSERT INTO app_language VALUES ("Azerbaycan Türkçesi");

/* ACCOUNT | ID, USER NAME, PASSWORD, NAME, MIDDLE NAME, SURNAME, GENDER, EMAIL, CREATE DATE, PREMIUM, LAST ACCESS, ACCOUNT TYPE, USER TYPE, LANGUAGE, FOLLOWER */
INSERT INTO account_ VALUES (1, "ekinaslan", "aslanekin97", "Ekin", NULL, "Aslan", "Male", "ekinaslan.js@gmail.com", "2022-01-29", TRUE, NULL, 0, 1, "Turkish", DEFAULT);
INSERT INTO account_ VALUES (2, "aliilman", "ilmanali123", "Ali", NULL, "İlman", "Male", "aliilman48@gmail.com", "2022-01-29", TRUE, NULL, 0, 1, "Turkish", DEFAULT);
INSERT INTO account_ VALUES (3, "esraduman", "mcdonalds78", "Esra", NULL, "Duman", "Female", "esradumann11@gmail.com", "2022-01-29", TRUE, NULL, 0, 1, "Turkish", DEFAULT);
INSERT INTO account_ VALUES (4, "muratosman", "ilovedatabase", "Murat", "Osman", "Ünalır", "Male", "unalir@gmail.com", "2022-01-29", TRUE, NULL, 0, 2, "Turkish", DEFAULT);
INSERT INTO account_ VALUES (5, "codd", "relationalmodel", "Edgar Frank", "Ted", "Codd", "Male", "edgarfcodd@gmail.com", "2022-01-29", FALSE, NULL, 0, 0, "English", DEFAULT);
INSERT INTO account_ VALUES (6, "egeuniversitesi", "123456", "Ege Üniversitesi", NULL, NULL, "None", "mail@ege.edu.tr", "2022-01-29", TRUE, NULL, 1, NULL, "Turkish", DEFAULT);
INSERT INTO account_ VALUES (7, "bilmuh", "while1=1", "Bilgisayar Mühendisliği", NULL, NULL, "None", "bilmuh@ege.edu.tr", "2022-01-29", TRUE, NULL, 1, NULL, "Turkish", DEFAULT);

/* LOCATION | NAME, CITY, COUNRTY, GMT, ADRESS */
INSERT INTO location VALUES ("Ekin Ev", "İzmir", "Turkey", 3, "Mevlana 1751/1");
INSERT INTO location VALUES ("Öğrenci Köyü", "İzmir", "Turkey", 3, "Ege Üniversitesi Kampüsü Öğrenci Köyü");

/* GROUP | ID, NAME, PRIVATE, DESC, RULES, CREATOR ID */
INSERT INTO group_ VALUES (1, "Database Project", TRUE, "Our Database Project Group", "1. Database Hakkında Konuşmak Yasak 2. Database Hakkında Kesinlikle Konuşmak Yasak", 1);

/* LOCATION | ID, NAME, CREATE DATE, DEADLINE, APPLY COUNT, INDUSTRY, EMPLOYMENT TYPE, SENIORITY LEVEL, FUNCTIONS, DESC CREATOR ID */
INSERT INTO job_offer VALUES (1, "Proje Yaptırma", "2022-01-29", "2022-02-02", DEFAULT, "Computer Engineering", "Freelance", "Junior", "Database", "Database bilen birini arıyoruz.", 2);

/* TEST_SCORE | ID, NAME, SCORE, DATE, DESC, ACCOUNT ID */
INSERT INTO test_score VALUES (1, "Unity", 90, "2021-12-12", "Unity With DOTween", 1);
INSERT INTO test_score VALUES (2, "Syber Security Analysis", 90, "2021-12-12", "Blue Team Eğitimi", 2);

/* CERTIFICATE | ID, NAME, URL */
INSERT INTO certificate VALUES (1, "Database Management Certificate", "ege.edu.tr");

/* PROJECT | ID, NAME, DESC, URL, START DATE, END DATE */
INSERT INTO project VALUES (1, "Database Management Term Project", "Creating new database with LinkedIn and Moddle.", NULL, "2021-12-01", "2022-02-02");

/* CERTIFICATE | ID, NAME, ANNOUNCEMENT, CERTIFICATE ID, ACCOUNT ID */
INSERT INTO course VALUES (1, "Database Management", NULL, 1, 7);

/* CONTENT | NAME, DESC, DOCUMENT, END TIME, DOCUMENT TYPE, TODO, COURSE ID */
INSERT INTO content VALUES ("EER Model", "EER Model Konu Anlatımı", "eermodel.pdf", NULL, "PDF", TRUE, 1);
INSERT INTO content VALUES ("SQL", "SQL Konu Anlatımı", "sql.mp4", NULL, "MP4", TRUE, 1);

/* CERTIFICATE | ID, URL */
INSERT INTO media VALUES (1, "linkedinmoodle.com/profile/default.png");
INSERT INTO media VALUES (2, "linkedinmoodle.com/profile/ekin.png");
INSERT INTO media VALUES (3, "linkedinmoodle.com/profile/esra.png");

/* STATUS | ID, TEXT, DATE, TYPE, LIKES, COMMENTS ACCOUNT ID */
INSERT INTO status_ VALUES (1, "Bu benim ilk paylaşımım.", "2022-01-29", NULL, DEFAULT, DEFAULT, 2);
INSERT INTO status_ VALUES (2, "DATA IS THE NEW OIL!", "2022-01-29", NULL, DEFAULT, DEFAULT, 4);
INSERT INTO status_ VALUES (3, "Asla pes etme!", "2022-01-29", 0, DEFAULT, DEFAULT, 1);
INSERT INTO status_ VALUES (4, "Kariyer Toplantısı", "2022-01-29", 1, DEFAULT, DEFAULT, 4);
INSERT INTO status_ VALUES (5, NULL, "2022-01-29", 2, DEFAULT, DEFAULT, 3);
INSERT INTO status_ VALUES (6, "İlk grup paylaşımı", "2022-01-29", NULL, DEFAULT, DEFAULT, 3);
INSERT INTO status_ VALUES (7, "Ege Üniversitesi'nin yapmış olduğu...", "2022-02-02", NULL, DEFAULT, DEFAULT, 7);

/* ABILITY | ID, LANGUAGE, LANGUAGE LEVEL, PATENT NAME, BADGE NAME, HONOR AWARD NAME, ACCOUNT ID */
INSERT INTO ability VALUES (1, "Russian", "A1", NULL, NULL, NULL, 1);
INSERT INTO ability VALUES (2, "English", "B1", NULL, NULL, "Satranç Derece Ödülü", 2);
INSERT INTO ability VALUES (3, "English", "C2", NULL, NULL, NULL, 3);

/* VIDEO | URL, STATUS ID */
INSERT INTO video VALUES ("linkedinmoodle.com/videos/motivasyon.mp4", 3);

/* EVENT | URL, STATUD ID */
INSERT INTO event_ VALUES ("teams.microsoft.com/joinid123", 4);

/* IMAGE | URL, STATUS ID */
INSERT INTO image VALUES ("linkedinmoodle.com/images/autumn.jpg", 5);

INSERT INTO user_makes_project VALUES (1, 1);
INSERT INTO user_makes_project VALUES (2, 1);
INSERT INTO user_makes_project VALUES (3, 1);

/* SHARE IN GROUP | STATUS ID, GROUP ID */
INSERT INTO share_in_group VALUES (6, 1);
/* ILLEGAL BUT VALID! */ /* INSERT INTO share_in_group VALUES (2, 1); */

/* ACCOUNT HAS LOCATION | ACCOUNT ID, LOCATION NAME */
INSERT INTO account_has_location VALUES (1, "Ekin Ev");
INSERT INTO account_has_location VALUES (2, "Öğrenci Köyü");
INSERT INTO account_has_location VALUES (3, "Öğrenci Köyü");

/* ACCOUNT BOOKMARK STATUS | ACCOUNT ID, STATUS ID,  */
INSERT INTO account_bookmark_status VALUES (3, 6);

/* ACCOUNT COMMENT STATUS | ACCOUNT ID, STATUS ID, COMMENT, LIKE */
INSERT INTO account_comment_status VALUES (1, 5, "Çok güzel sonbahar fotoğrafı.", 1);

/* ACCOUNT LIKE STATUS | ACCOUNT ID, STATUS ID, TYPE */
INSERT INTO account_like_status VALUES (2, 5, 1);
INSERT INTO account_like_status VALUES (1, 5, 0);
INSERT INTO account_like_status VALUES (1, 2, 2);

/* ACCOUNT MANAGE GROUP | ACCOUNT ID, GROUP ID */
INSERT INTO account_manage_group VALUES (2, 1);

/* USER APPLY JOB | ACCOUNT ID, JOB OFFER ID */
INSERT INTO user_apply_job VALUES (5, 1);

/* ACCOUNT APPROVE TEST SCORE | ACCOUNT ID, TEST SCORE ID */
INSERT INTO account_approve_test_score VALUES (4, 2);

/* USER HAS CERTIFICATE | ACCOUNT ID, CERTIFICATE ID, ISSUE, EXPIRATION */
INSERT INTO user_has_certificate VALUES (1, 1, "2022-02-02", NULL);
INSERT INTO user_has_certificate VALUES (2, 1, "2022-02-02", NULL);
INSERT INTO user_has_certificate VALUES (3, 1, "2022-02-02", NULL);

/* MESSAGE | SENDER ID, RECEIVER ID, TEXT, DATE */
INSERT INTO message VALUES (1, 2, "Kanka projeyi yapıcak adam bulamadın mı :D", "2022-01-29");
INSERT INTO message VALUES (2, 1, "Çok önemli birini buldum.", "2022-01-30");

/* VIEW PROFILE | ACCOUNT ID, VIEWED ACCOUNT ID */
INSERT INTO view_profile VALUES (3, 4);

/* CONNECT | ID, ID */
INSERT INTO connect VALUES (1, 4);
INSERT INTO connect VALUES (2, 4);
INSERT INTO connect VALUES (3, 4);
INSERT INTO connect VALUES (1, 2);
INSERT INTO connect VALUES (1, 3);
INSERT INTO connect VALUES (2, 3);
INSERT INTO connect VALUES (2, 7);
INSERT INTO connect VALUES (3, 7);
/* ILLEGAL! */ /* INSERT INTO connect VALUES (2, 1); */

/* ACCOUNT HAS MEDIA | ACCOUNT ID, PROFILE PHOTO ID */
INSERT INTO account_has_media VALUES (1, 2);
INSERT INTO account_has_media VALUES (2, 1);
INSERT INTO account_has_media VALUES (3, 3);

/* STUDENT TAKES COURSE | ACCOUNT ID, COURSE ID, NOTE */
INSERT INTO student_takes_course VALUES (1, 1, 90);
INSERT INTO student_takes_course VALUES (2, 1, 100);
INSERT INTO student_takes_course VALUES (3, 1, 95);

/* INSTRUCTOR TEACHES COURSE | ACCOUNT ID, COURSE ID */
INSERT INTO instructor_teaches_course VALUES (4, 1);

/* INSTRUCTOR TEACHES COURSE | ACCOUNT ID, COURSE ID */
INSERT INTO account_join_group VALUES (1, 1);
INSERT INTO account_join_group VALUES (2, 1);
INSERT INTO account_join_group VALUES (3, 1);