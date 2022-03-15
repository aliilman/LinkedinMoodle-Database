/* CERTIFICATE DATE CONTROL */
ALTER TABLE user_has_certificate
ADD CONSTRAINT certificate_date_control
CHECK (expiration_date >= issue_date);

/* GENDER CONTROL */
ALTER TABLE account_
ADD CONSTRAINT gender_control
CHECK (gender IN ('Male', 'Female', 'Other', 'None'));

/* JOB OFFER DATE CONTROL */
ALTER TABLE job_offer
ADD CONSTRAINT job_offer_date_control
CHECK (deadline >= create_date);

/* ALTER TABLE student_takes_course
ADD CONSTRAINT student_note_control
CHECK (100 >= note); */