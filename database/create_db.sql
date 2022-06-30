-- create database if not exists informatica_triennale;
-- use informatica_triennale;

create database if not exists informatica_magistrale;
use informatica_magistrale;


-- Teacher table

create table teacher (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    qualification varchar(255),
    office varchar(255),
    phone varchar(255),
    mail varchar(255),
    website varchar(255),
    PRIMARY KEY (id));

-- Class table

create table class (
    code char(8) NOT NULL,
    name varchar(255) NOT NULL UNIQUE,
    sector char(16) DEFAULT 'INF/01',
    course_year tinyint(3) UNSIGNED NOT NULL,
    PRIMARY KEY (code));

-- Class Offered table

create table class_offered (
    `year` char(8) NOT NULL,
    class char(8) NOT NULL,
    cfu integer UNSIGNED DEFAULT 1,
    FOREIGN KEY (class) REFERENCES class(code),
    PRIMARY KEY (`year`, class));

-- Teach table

create table teach (
    class char(8) NOT NULL,
    `year` char(8) NOT NULL,
    teacher int NOT NULL,
    FOREIGN KEY (class) REFERENCES class_offered(class),
    FOREIGN KEY (`year`) REFERENCES class_offered(`year`),
    FOREIGN KEY (teacher) REFERENCES teacher(id),
    PRIMARY KEY (class, `year`, teacher));

-- Prerequisite table

create table prerequisite (
    class char(8) NOT NULL,
    prerequisite char(8) NOT NULL,
    FOREIGN KEY (class) REFERENCES class(code),
    FOREIGN KEY (prerequisite) REFERENCES class(code),
    PRIMARY KEY (class, prerequisite));

-- News table

create table news(
    id int NOT NULL AUTO_INCREMENT,
    author varchar(255),
    content text NOT NULL,
    `date` datetime DEFAULT NOW(),
    PRIMARY KEY (id));

-- Calendar table

create table calendar (
    class char(8) NOT NULL,
    `year` char(8) NOT NULL,
    semester tinyint(2) unsigned NOT NULL,
    `day` tinyint(4) unsigned NOT NULL DEFAULT 0,
    start_time time NOT NULL,
    end_time time NOT NULL,
    room varchar(255),
    building varchar(255) DEFAULT 'SOGENE',
    FOREIGN KEY (class) REFERENCES class_offered(class),
    FOREIGN KEY (`year`) REFERENCES class_offered(`year`),
    PRIMARY KEY (class, `year`, semester, `day`, start_time, end_time));

-- Exam table

create table exam (
    class char(8) NOT NULL,
    `year` char(8) NOT NULL,
    `session` varchar(255) NOT NULL DEFAULT "estiva",
    `call` tinyint(3) unsigned DEFAULT 1,
    `type` varchar(255) NOT NULL DEFAULT "scritto",
    `date` date,
    `hour` time,
    room varchar(255),
    building varchar(255),
    duration integer unsigned,
    -- FOREIGN KEY (`year`) REFERENCES class_offered(`year`),
    -- FOREIGN KEY (class) REFERENCES class_offered(class),
    PRIMARY KEY (class, `year`, `session`, `call`, `type`));    
