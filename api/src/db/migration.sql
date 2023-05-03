DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS cohorts;
DROP TABLE IF EXISTS student_tasks;
DROP TABLE IF EXISTS branch_tasks;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS branch;

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE branch (
  id SERIAL PRIMARY KEY,
  name VARCHAR (50)
);

CREATE TABLE branch_tasks (
  id SERIAL PRIMARY KEY,
  task_id INT NOT NULL,
  branch_id INT NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE,
  FOREIGN KEY (branch_id) REFERENCES branch(id) ON DELETE CASCADE
);

CREATE TABLE instructors (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR (30) NOT NULL,
  middlename VARCHAR (30),
  lastname VARCHAR (30) NOT NULL,
  email VARCHAR (255) NOT NULL,
  location VARCHAR (50) NOT NULL
);


CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR (30) NOT NULL,
  middlename VARCHAR (30),
  lastname VARCHAR (30) NOT NULL, 
  age INT NOT NULL,
  location VARCHAR (50) NOT NULL,
  base VARCHAR (50) NOT NULL,
  active BOOLEAN NOT NULL
);


CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  courseid VARCHAR (255) NOT NULL
);

CREATE TABLE student_tasks (
  id SERIAL PRIMARY KEY,
  completed BOOLEAN NOT NULL
);


ALTER TABLE instructors 
ADD COLUMN cohort_id INT NOT NULL,
ADD CONSTRAINT fk_cohort_id FOREIGN KEY (cohort_id) REFERENCES cohorts(id) ON DELETE CASCADE;

ALTER TABLE students 
ADD COLUMN branch_id INT NOT NULL,
ADD COLUMN instructor_id INT NOT NULL,
ADD COLUMN cohort_id INT NOT NULL,
ADD CONSTRAINT fk_branch_id FOREIGN KEY (branch_id) REFERENCES branch(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_cohort_id FOREIGN KEY (cohort_id) REFERENCES cohorts(id) ON DELETE CASCADE;

ALTER TABLE cohorts 
ADD COLUMN instructor_id INT NOT NULL,
ADD COLUMN student_id INT NOT NULL,
ADD CONSTRAINT fk_instructor_id FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE;

ALTER TABLE student_tasks
ADD COLUMN student_id INT NOT NULL,
ADD COLUMN branch_tasks_id INT NOT NULL,
ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
ADD CONSTRAINT fk_branch_tasks_id FOREIGN KEY (branch_tasks_id) REFERENCES branch_tasks(id) ON DELETE CASCADE;
