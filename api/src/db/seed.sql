INSERT INTO tasks (name) VALUES
    ('Clear CIF'),
    ('Signatures from S1 battallion'),
    ('Financial meeting'),
    ('Signatures from Ed center'),
    ('Finish TAP process');

INSERT INTO branch (name) VALUES
    ('Air Force'),
    ('Army'),
    ('Marines'),
    ('Navy');

INSERT INTO branch_tasks (task_id, branch_id) VALUES
    (1, 1),
    (2, 2);

INSERT INTO instructors (firstname, middlename, lastname, email, location) VALUES
    ('Jane', 'Dunno', 'Doe1', 'JaneDoe@fakemail.com', 'Austin, Texas'),
    ('Jon', NULL, 'Doe2', 'JonDoe@fakeemail.com', 'Cincinnati, OH');

INSERT INTO students (firstname, middlename, lastname, age, location, base, active, phonenumber, email, appointment) VALUES
    ('Sarah', 'Lynn', 'Marks', 35, 'Clarksville, KY', 'Ft. Campbell', TRUE, 2707981234, 'stoneage@aol.com', '2023-06-10 13:40 CST'),
    ('Chris', 'P', 'Bacon', 80, 'Villages, FL', NULL, FALSE, 7276437382, 'Bacon&Eggs@fakemail.com', NULL),
    ('Mike Ro', 'P', 'Ennis', 25, 'San Francisco, CA', 'Travis Air Force Base', TRUE, 4158299673, 'OverCompensate@fakemail.com', '2023-06-12 09:40 CST'),
    ('Jed', 'I', 'Knight', 38, 'Elkhart, IN', 'Grisson Air Reserve Base', TRUE, 9304734927, 'ForceBeWithYou@fakemail.com', '2023-06-15 08:40 CST'),
    ('Deja', NULL, 'Viau', 22, 'Austin, TX', NULL, FALSE, 5125609246, 'ItsHappeningAgain@fakemail.com', '2023-07-15 10:40 CST'),
    ('Tara', NULL, 'Dactyl', 42, 'Hinesville, GA', 'Ft. Stewart', TRUE, 9127671432, 'Triceratops@fakemail.com', '2023-08-15 15:40 CST'),
    ('Iva', 'Anita', 'Takashita', 27, 'Fort Riley, KS', 'Ft. Riley', TRUE, 7858913456, 'GottaGo@fakemail.com', '2023-10-15 12:40 CST');

INSERT INTO cohorts (courseid, startdate, enddate, numberofstudents) VALUES
    ('MCSP-19', '01/17/2023', '05/26/2013', 24),
    ('MCSP-01', '06/01/1912', '11/18/1912', 15);

INSERT INTO student_tasks (completed) VALUES   
    (TRUE),
    (FALSE);

UPDATE instructors SET cohort_id = 1 WHERE id = 1;
UPDATE instructors SET cohort_id = 2 WHERE id = 2;

UPDATE students SET branch_id = 1 WHERE id = 1;
UPDATE students SET branch_id = 3 WHERE id = 2;
UPDATE students SET branch_id = 2 WHERE id = 3;
UPDATE students SET branch_id = 3 WHERE id = 4;
UPDATE students SET branch_id = 4 WHERE id = 5;
UPDATE students SET branch_id = 1 WHERE id = 6;
UPDATE students SET branch_id = 2 WHERE id = 7;
UPDATE students SET instructor_id = 1 WHERE id = 1;
UPDATE students SET instructor_id = 2 WHERE id = 2;
UPDATE students SET instructor_id = 1 WHERE id = 3;
UPDATE students SET instructor_id = 2 WHERE id = 4;
UPDATE students SET instructor_id = 1 WHERE id = 5;
UPDATE students SET instructor_id = 2 WHERE id = 6;
UPDATE students SET instructor_id = 1 WHERE id = 7;
UPDATE students SET cohort_id = 1 WHERE id = 1;
UPDATE students SET cohort_id = 2 WHERE id = 2;
UPDATE students SET cohort_id = 1 WHERE id = 3;
UPDATE students SET cohort_id = 2 WHERE id = 4;
UPDATE students SET cohort_id = 1 WHERE id = 5;
UPDATE students SET cohort_id = 2 WHERE id = 6;
UPDATE students SET cohort_id = 1 WHERE id = 7;

UPDATE cohorts SET instructor_id = 1 WHERE id = 1;
UPDATE cohorts SET instructor_id = 2 WHERE id = 2;

UPDATE student_tasks SET student_id = 1 WHERE id = 1;
UPDATE student_tasks SET student_id = 2 WHERE id = 2;
UPDATE student_tasks SET branch_tasks_id = 1 WHERE id = 1;
UPDATE student_tasks SET branch_tasks_id = 2 WHERE id = 2;