/* TRIGGERS */

/* COUNT LIKES */
DELIMITER $$
CREATE TRIGGER count_status_likes AFTER INSERT ON account_like_status FOR EACH ROW BEGIN
	UPDATE status_
    SET like_count = like_count + 1 WHERE status_id = NEW.status_id;
END
$$ DELIMITER ;

/* COUNT COMMENTS */
DELIMITER $$
CREATE TRIGGER count_status_comments AFTER INSERT ON account_comment_status FOR EACH ROW
BEGIN
	UPDATE status_
    SET comment_count = comment_count + 1 WHERE status_id = NEW.status_id;
END
$$ DELIMITER ;

/* COUNT FOLLOWERS */
DELIMITER $$
CREATE TRIGGER count_followers AFTER INSERT ON connect FOR EACH ROW BEGIN
	UPDATE account_
    SET followers = followers + 1 WHERE account_id = NEW.account_id OR account_id = NEW.connecter_id;
END
$$ DELIMITER ;

/* COUNT JOB OFFER APPLIES */
DELIMITER $$
CREATE TRIGGER count_job_offer_applies AFTER INSERT ON user_apply_job FOR EACH ROW BEGIN
	UPDATE job_offer
    SET apply_count = apply_count + 1 WHERE job_offer_id = NEW.job_offer_id;
END
$$ DELIMITER ;

/* STUDENT NOTE CONTROL */
/* DELIMITER $$
CREATE TRIGGER student_note_control BEFORE UPDATE ON student_takes_course FOR EACH ROW BEGIN
	IF note > 100 THEN
    UPDATE student_takes_course
	SET note = 100;
	END IF;
END
$$ DELIMITER ; */

/* ASSERTIONS WITH USING TRIGGERS */

/* TEST SCORE ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER test_score_control BEFORE INSERT ON test_score FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND a.account_type = 1 )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* COURSE ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER course_control BEFORE INSERT ON course FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND a.account_type = 0 )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* USER APPLY JOB ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER user_apply_job_control BEFORE INSERT ON user_apply_job FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND a.account_type = 1 )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* USER HAS CERTIFICATE ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER user_has_certificate_control BEFORE INSERT ON user_has_certificate FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND a.account_type = 1 )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* STUDENT TAKES COURSE ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER student_takes_course_control BEFORE INSERT ON student_takes_course FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND ( a.account_type = 1 OR a.user_type != 1 )) /* Normal ve Instructor olan User'ları alma. */
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* INSTRUCTOR TEACHES COURSE ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER instructor_teaches_course_control BEFORE INSERT ON instructor_teaches_course FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM account_ AS a
        WHERE a.account_id = NEW.account_id AND ( a.account_type = 1 OR a.user_type != 2 )) /* Normal ve Instructor olan User'ları alma. */
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* ABILITY ACCOUNT TYPE CONTROL */
DELIMITER $$
CREATE TRIGGER ability_account_control BEFORE INSERT ON ability FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
        FROM ability AS ab
        JOIN account_ AS ac ON ab.account_id = ac.account_id
        WHERE ac.account_type = 1 )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* CONNECT CONTROL */
DELIMITER $$
CREATE TRIGGER connect_control BEFORE INSERT ON connect FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
		FROM connect AS f, connect AS s
		WHERE f.account_id = s.connecter_id AND f.connecter_id = s.account_id )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;

/* CONNECT CONTROL */
DELIMITER $$
CREATE TRIGGER status_privacy_control BEFORE INSERT ON share_in_group FOR EACH ROW
BEGIN
    IF EXISTS (
		SELECT *
		FROM connect AS f, connect AS s
		WHERE f.account_id = s.connecter_id AND f.connecter_id = s.account_id )
	THEN SIGNAL SQLSTATE '45000'; /* İstenmeyen koşul sağlanmadığında hata kodu gönderme. */
    END IF;
END
$$ DELIMITER ;