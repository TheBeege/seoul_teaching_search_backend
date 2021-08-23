-- Database setup
CREATE USER search_backend;
CREATE DATABASE search_backend;
GRANT ALL PRIVILEGES ON DATABASE search_backend TO search_backend;
\c search_backend

-- Entity table setup
CREATE TABLE jobs
(
    id          serial PRIMARY KEY,
    title       text NOT NULL CHECK (title <> ''),
    description text NOT NULL CHECK (description <> ''),
    link        text NOT NULL CHECK (link <> ''),
    min_salary  int NULL,
    max_salary  int NULL,
    start_hour  int NULL,
    end_hour    int NULL,
    CONSTRAINT link UNIQUE(link)
);
CREATE TABLE visas
(
    id          varchar(32) PRIMARY KEY,
    name        varchar(255) NOT NULL CHECK (name <> ''),
    description text
);
CREATE TABLE age_groups
(
    id   serial PRIMARY KEY,
    name varchar(64) NOT NULL CHECK (name <> '')
);
CREATE TABLE locations
(
    id   serial PRIMARY KEY,
    name varchar(64) NOT NULL CHECK (name <> '')
);

-- Linking table setup
CREATE TABLE age_groups_jobs (
    job_id int REFERENCES jobs (id),
    age_group_id int REFERENCES age_groups (id)
);
CREATE TABLE jobs_visas (
    job_id int REFERENCES jobs (id),
    visa_id varchar(32) REFERENCES visas (id)
);
CREATE TABLE jobs_locations (
    job_id int REFERENCES jobs (id),
    location_id int REFERENCES locations (id)
);

-- Lookup data setup
-- More data to be added later. This is just for setup purposes
INSERT INTO visas (id, name, description)
VALUES ('E-2', 'English Teacher Visa', 'The standard visa for English teachers in Korea. It is bound to the company hiring the individual and has many constraints about the work allowed.'),
       ('F-6', 'Marriage Visa', 'The visa provided to spouses of Korean citizens. It provides wide variety in job selection and a large amount of freedom.');
INSERT INTO age_groups (name)
VALUES ('Pre-school and Kindergarten'),
       ('Elementary School'),
       ('Middle School'),
       ('High School'),
       ('University'),
       ('Adult');
INSERT INTO locations (name)
VALUES ('Seoul'),
       ('Gyeonggi'),
       ('Busan');

-- Mock data setup
INSERT INTO jobs (id, title, description, link, min_salary, max_salary, start_hour, end_hour)
VALUES (1, 'Get this fake teaching job!', 'There is description text here. It is very descriptive. Do not question it. Do not hesitate. You will apply. You are compelled to apply. Click me for great justice. Take off many zig.', 'https://google.com/', null, null, null, null),
       (2, 'This job is better! I promise!', 'Bullshit. Nonsense. This guy is a liar. Do not listen. His words are deceit. His desire is malicious. Do not trust him.', 'https://microsoft.com/', 1500000, 3000000, null, null),
       (3, 'This is actually the job you want. Descriptive title.', 'This one speaks truth. This is the diamond in the rough. This one truly wants to help others learn. You can trust him. He will support you.', 'https://github.com/', null, null, 9, 18),
       (4, 'Lazy', 'This is not descriptive. I am tired of typing.', 'https://developer.mozilla.org/', 2500000, 3500000, 12, 16);
INSERT INTO jobs_visas (job_id, visa_id)
VALUES (1, 'E-2'),
       (2, 'E-2'),
       (3, 'E-2'),
       (3, 'F-6');
INSERT INTO age_groups_jobs (job_id, age_group_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 2),
       (3, 6);
INSERT INTO jobs_locations (job_id, location_id)
VALUES (1, 3),
       (2, 2),
       (2, 3),
       (3, 1);
