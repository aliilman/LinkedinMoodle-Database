CREATE DATABASE database_schema;

USE database_schema;

CREATE TABLE app_language (
    app_language_name varchar(255),
    
    PRIMARY KEY (app_language_name)
);

CREATE TABLE account_ (
	account_id int,
    user_name varchar(255),
    user_password varchar(255),
    first_name varchar(255),
    middle_name varchar(255),
    last_name varchar(255),
    gender varchar(255),
    email_address varchar(255),
    create_date date,
    premium bool,
    last_access date,
    account_type int,
    user_type int,
    
    PRIMARY KEY (account_id),
    
    app_language_name varchar(255),
    
    FOREIGN KEY (app_language_name) REFERENCES app_language(app_language_name),
    
    followers int DEFAULT 0
);

CREATE TABLE location (
	location_name varchar(255),
    city varchar(255),
    country varchar(255),
    time_period int,
    address varchar(255),
    
    PRIMARY KEY (location_name)
);

CREATE TABLE group_ (
	group_id int,
    group_name varchar(255),
    privacy_type bool,
    about_text varchar(255),
    group_rules varchar(255),
    
    PRIMARY KEY (group_id),
    
    create_account_id int,
    
    FOREIGN KEY (create_account_id) REFERENCES account_(account_id)
);

CREATE TABLE job_offer (
	job_offer_id int,
    job_offer_name varchar(255),
    create_date date,
    deadline date,
    apply_count int DEFAULT 0,
    industry varchar(255),
    employment_type varchar(255),
    seniority_level varchar(255),
    job_functions varchar(255),
    description varchar(255),
    
    PRIMARY KEY (job_offer_id),
    
    creator_id int,
    
    FOREIGN KEY (creator_id) REFERENCES account_(account_id)
);

CREATE TABLE test_score (
	test_score_id int,
    test_score_name varchar(255),
    score int,
    test_date date,
    test_description varchar(255),
    
    PRIMARY KEY (test_score_id),
    
    account_id int,
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE certificate (
	certificate_id int,
    certificate_name varchar(255),
    certificate_url varchar(255),
    
    PRIMARY KEY (certificate_id)
);

CREATE TABLE project (
	project_id int,
    project_name varchar(255),
    project_description varchar(255),
    project_url varchar(255),
    start_date date,
    end_date date,
    
    PRIMARY KEY (project_id)
);

CREATE TABLE course (
	course_id int,
    course_name varchar(255),
    announcement varchar(255),
    
    PRIMARY KEY (course_id),
    
    certificate_id int,
    account_id int,
    
    FOREIGN KEY (certificate_id) REFERENCES certificate(certificate_id),
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE content (
	content_name varchar(255),
    content_text varchar(255),
    document varchar(255),
    end_time date,	
    content_type varchar(255),
    todo varchar(255),
    
    PRIMARY KEY (content_name),
    
    course_id int,
    
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE media ( /* Profil fotoğrafı */
	media_id int,
    media_url varchar(255),
    
    PRIMARY KEY (media_id)
);

CREATE TABLE status_ (
	status_id int,
    text_ varchar(255),
    status_date date,
    status_type int,
    like_count int DEFAULT 0,
    comment_count int DEFAULT 0,
    
    PRIMARY KEY (status_id),
    
    account_id int,
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE user_ ( /* DEPRECATED! */
	/* user_type int, */

	account_id int,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE company ( /* DEPRECATED! */
	account_id int,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE ability (
	ability_id int,
    language_ varchar(255),
    language_profiency varchar(255),
    patent_name varchar(255),
    badge_name varchar(255),
    honor_award_name varchar(255),
    
    PRIMARY KEY (ability_id),
    
    account_id int,
    
    FOREIGN KEY (account_id	) REFERENCES account_(account_id)
);

CREATE TABLE video (
	video_url varchar(255),
    
    status_id int,
    
    PRIMARY KEY (status_id),
    
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE event_ (
	event_url varchar(255),
    
    status_id int,
    
    PRIMARY KEY (status_id),
    
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE image (
	image_url varchar(255),
    
    status_id int,
    
    PRIMARY KEY (status_id),
    
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE user_makes_project (
	account_id int,
    project_id int,
    
    PRIMARY KEY (account_id, project_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE share_in_group (
	status_id int,
    group_id int,
    
    PRIMARY KEY (status_id, group_id),
    
    FOREIGN KEY (status_id) REFERENCES status_(status_id),
    FOREIGN KEY (group_id) REFERENCES group_(group_id)
);

CREATE TABLE account_has_location (
	account_id int,
    location_name varchar(255),
    
    PRIMARY KEY (account_id, location_name),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (location_name) REFERENCES location(location_name)
);

CREATE TABLE account_bookmark_status (
	account_id int,
    status_id int,
    
    PRIMARY KEY (account_id, status_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE account_comment_status (
	account_id int,
    status_id int,
    
	comment_text varchar(255),
    comment_like_counter int,
    
    PRIMARY KEY (account_id, status_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE account_like_status (
	account_id int,
    status_id int,
    
    like_type int,
    
    PRIMARY KEY (account_id, status_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (status_id) REFERENCES status_(status_id)
);

CREATE TABLE account_manage_group (
	account_id int,
    group_id int,
    
    PRIMARY KEY (account_id, group_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (group_id) REFERENCES group_(group_id)
);

CREATE TABLE user_apply_job (
	account_id int,
    job_offer_id int,
    
    PRIMARY KEY (account_id, job_offer_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (job_offer_id) REFERENCES job_offer(job_offer_id)
);

CREATE TABLE account_approve_test_score (
	account_id int,
    test_score_id int,
    
    PRIMARY KEY (account_id, test_score_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (test_score_id) REFERENCES test_score(test_score_id)
);

CREATE TABLE user_has_certificate (
	account_id int,
    certificate_id int,
    
    issue_date date,
    expiration_date date,
    
    PRIMARY KEY (account_id, certificate_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (certificate_id) REFERENCES certificate(certificate_id)
);

CREATE TABLE message (
	sender_id int,
    receiver_id int,
    
    text_message varchar(255),
	message_date date,
    
    PRIMARY KEY (sender_id, receiver_id),
    
    FOREIGN KEY (sender_id) REFERENCES account_(account_id),
    FOREIGN KEY (receiver_id) REFERENCES account_(account_id)
);

CREATE TABLE view_profile (
	account_id int,
	viewed_id int,
    
    PRIMARY KEY (account_id, viewed_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (viewed_id) REFERENCES account_(account_id)
);

CREATE TABLE connect (
	account_id int,
    connecter_id int,
    
    PRIMARY KEY (account_id, connecter_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (connecter_id) REFERENCES account_(account_id)
);

CREATE TABLE account_has_media (
	account_id int,
    media_id int,
    
    PRIMARY KEY (account_id, media_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (media_id) REFERENCES media(media_id)
);

CREATE TABLE student ( /* DEPRECATED! */
	account_id int,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE instructor ( /* DEPRECATED! */
	account_id int,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE normal ( /* DEPRECATED! */
	account_id int,
    
    PRIMARY KEY (account_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id)
);

CREATE TABLE student_takes_course (
	account_id int,
    course_id int,
    
    note int,
    
    PRIMARY KEY (account_id, course_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE instructor_teaches_course (
	account_id int,
    course_id int,
    
    PRIMARY KEY (account_id, course_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE account_join_group (
	account_id int,
    group_id int,
    
    PRIMARY KEY (account_id, group_id),
    
    FOREIGN KEY (account_id) REFERENCES account_(account_id),
    FOREIGN KEY (group_id) REFERENCES group_(group_id)
);