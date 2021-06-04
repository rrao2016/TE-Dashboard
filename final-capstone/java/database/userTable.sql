BEGIN TRANSACTION;
DROP TABLE IF EXISTS modules CASCADE;
DROP SEQUENCE IF EXISTS seq_module_id CASCADE;

DROP TABLE IF EXISTS users CASCADE;
DROP SEQUENCE IF EXISTS seq_user_id CASCADE;

DROP TABLE IF EXISTS students CASCADE;
DROP SEQUENCE IF EXISTS seq_student_id CASCADE;

DROP TABLE IF EXISTS instructors CASCADE;
DROP SEQUENCE IF EXISTS seq_instructor_id CASCADE;

DROP TABLE IF EXISTS student_homework CASCADE;
DROP TABLE IF EXISTS homework CASCADE;
DROP SEQUENCE IF EXISTS seq_homework_id CASCADE;

DROP TABLE IF EXISTS pathway CASCADE;
DROP TABLE IF EXISTS student_pathway CASCADE;
DROP SEQUENCE IF EXISTS seq_pathway_id CASCADE;

DROP TABLE IF EXISTS quizes CASCADE;
DROP SEQUENCE IF EXISTS seq_quiz_id CASCADE;

DROP TABLE IF EXISTS student_quizes CASCADE;

DROP TABLE IF EXISTS questions CASCADE;
DROP SEQUENCE IF EXISTS seq_question_id;

DROP TABLE IF EXISTS answers CASCADE;
DROP SEQUENCE IF EXISTS seq_answer_id;

DROP TABLE IF EXISTS student_selected_answers CASCADE;
DROP SEQUENCE IF EXISTS seq_selected_answer_id;

DROP TABLE IF EXISTS instructor_comments CASCADE;
DROP SEQUENCE IF EXISTS seq_instructor_comment_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_student_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_instructor_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  

  
  CREATE SEQUENCE seq_module_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
  CREATE SEQUENCE seq_homework_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
  
CREATE SEQUENCE seq_pathway_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

  CREATE SEQUENCE seq_quiz_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_question_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_answer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_selected_answer_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_instructor_comment_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id') NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	academic_status varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);


CREATE TABLE students (
	student_id int DEFAULT nextval('seq_student_id') NOT NULL,
	CONSTRAINT PK_student PRIMARY KEY(student_id),
	graduated boolean default false,
	user_id integer,
	instructor_id integer,
	firstname varchar(50),
	lastname varchar(50)	
);

CREATE TABLE instructors (
        instructor_id int DEFAULT nextval('seq_instructor_id') NOT NULL,
        user_id integer,
        CONSTRAINT PK_instructor PRIMARY KEY(instructor_id),
        firstname varchar(50),
        lastname varchar(50) 
);


CREATE TABLE modules (
	module_id int DEFAULT nextval('seq_module_id') NOT NULL,
	module_name varchar(50) NOT NULL,
	CONSTRAINT PK_module PRIMARY KEY (module_id)
);

CREATE TABLE homework (
        homework_id int DEFAULT nextval('seq_homework_id') NOT NULL,
        module_id int,
        CONSTRAINT PK_homework PRIMARY KEY(homework_id),
        name varchar(50)
        
);

CREATE TABLE pathway (
        pathway_id int DEFAULT nextval('seq_pathway_id') NOT NULL,
        module_id int,
        CONSTRAINT PK_pathway PRIMARY KEY(pathway_id),
        name varchar(50)
);

CREATE TABLE student_homework(

        student_id int,
        homework_id int,
        score int,
        feedback varchar(250)
);

CREATE TABLE student_pathway(
        student_id int,
        pathway_id int,
        score int,
        feedback varchar(250)
);

CREATE TABLE quizes (
        quiz_id int DEFAULT nextval('seq_quiz_id') NOT NULL,
        quiz_title varChar(50) NOT NULL,
        module_id int,
        CONSTRAINT PK_quizes PRIMARY KEY(quiz_id)
);

CREATE TABLE student_quizes(
        student_id int,
        quiz_id int,
        quiz_status varChar(50),
        score int,
        max_score int
);

CREATE TABLE questions(
        question_id int DEFAULT nextval('seq_question_id') NOT NULL,
        CONSTRAINT PK_question PRIMARY KEY (question_id),
        question_text varChar(250),
        quiz_id int
        
);

CREATE TABLE answers(
        choice_id int DEFAULT nextval('seq_answer_id') NOT NULL,
        CONSTRAINT PK_choice PRIMARY KEY (choice_id),
        correct boolean,
        answer_text varChar(250),
        question_id int
);

CREATE TABLE student_selected_answers(
        selected_answer_id int DEFAULT nextval('seq_selected_answer_id') NOT NULL,
        CONSTRAINT PK_selected_answer PRIMARY KEY (selected_answer_id),
        question_id int,
        student_id int,
        choice_id int
);

CREATE TABLE instructor_comments (
        instructor_comment_id int DEFAULT nextval('seq_instructor_comment_id'),
        CONSTRAINT PK_instructor_comment PRIMARY KEY (instructor_comment_id),
        instructor_id int,
        student_id int,
        comment varchar(500),
        date DATE NOT NULL DEFAULT CURRENT_DATE
);

ALTER TABLE quizes ADD FOREIGN KEY (module_id) REFERENCES modules(module_id);
ALTER TABLE homework ADD FOREIGN KEY (module_id) REFERENCES modules(module_id);

ALTER TABLE pathway ADD FOREIGN KEY (module_id) REFERENCES modules(module_id);

ALTER TABLE students ADD FOREIGN KEY (user_id) REFERENCES users(user_id);
ALTER TABLE students ADD FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id);
ALTER TABLE instructors ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE student_homework ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE student_homework ADD FOREIGN KEY (homework_id) REFERENCES homework(homework_id);
ALTER TABLE student_homework ADD PRIMARY KEY (student_id, homework_id);

ALTER TABLE student_pathway ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE student_pathway ADD FOREIGN KEY (pathway_id) REFERENCES pathway(pathway_id);
ALTER TABLE student_pathway ADD PRIMARY KEY (student_id, pathway_id);

ALTER TABLE student_quizes ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE student_quizes ADD FOREIGN KEY (quiz_id) REFERENCES quizes(quiz_id);
ALTER TABLE student_quizes ADD PRIMARY KEY (student_id, quiz_id);

ALTER TABLE questions ADD FOREIGN KEY (quiz_id) REFERENCES quizes(quiz_id);

ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions(question_id);

ALTER TABLE student_selected_answers ADD FOREIGN KEY (question_id) REFERENCES questions(question_id);
ALTER TABLE student_selected_answers ADD FOREIGN KEY (student_id) REFERENCES students(student_id);
ALTER TABLE student_selected_answers ADD FOREIGN KEY (choice_id) REFERENCES answers(choice_id);

ALTER TABLE instructor_comments ADD FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id);
ALTER TABLE instructor_comments ADD FOREIGN KEY (student_id) REFERENCES students(student_id);

INSERT INTO users (username,password_hash,role, academic_status) VALUES ('admin','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_ADMIN', 'Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('instructor1','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('instructor2','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('instructor3','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('instructor4','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('instructor5','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER', 'Instructor');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student1','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student2','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student3','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student4','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student5','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student6','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student7','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student8','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student9','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student10','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student11','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student12','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student13','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student14','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student15','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student16','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student17','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student18','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student19','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student20','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student21','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student22','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student23','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student24','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student25','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student26','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student27','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');
INSERT INTO users (username,password_hash,role, academic_status) VALUES ('student28','$2a$10$P8/pdl05FYHmQzl1LV0X0OtrHFP8BO/QpeBwCmDq2Z3X1Ur8yuz3a','ROLE_USER','Student');

INSERT INTO instructors (firstname,lastname,user_id) VALUES ('Kirk','Melendez',6),('Judith','Carney',2),('Kyra','Osborne',3),('Dara','Norman',4),('Jolie','Alexander',5);


INSERT INTO students (graduated,user_id,instructor_id,firstname,lastname) VALUES (false,7,2,'Constance','Watkins'),(false,8,2,'Erich','Torres'),(false,9,2,'Carl','Lindsay'),(false,10,1,'Sean','Carpenter'),(false,11,2,'Zeus','Hale'),(false,12,1,'Elvis','Wolfe'),(false,13,5,'Marshall','Douglas'),(false,14,2,'Kareem','Butler'),(false,15,1,'Magee','Kinney'),(false,16,2,'Laura','Finley');
INSERT INTO students (graduated,user_id,instructor_id,firstname,lastname) VALUES (false,17,4,'Lysandra','Parrish'),(false,18,1,'Driscoll','Camacho'),(false,19,5,'Olympia','Long'),(false,20,1,'Lane','Langley'),(false,21,4,'Berk','Edwards'),(false,22,4,'Aristotle','Potts'),(false,23,5,'Tyrone','Roman'),(false,24,4,'Jordan','Fisher'),(false,25,3,'Reed','Howell'),(false,26,1,'Clark','Chandler');
INSERT INTO students (graduated,user_id,instructor_id,firstname,lastname) VALUES (false,27,2,'Lucas','Franks'),(false,28,3,'Alika','Reid');

INSERT INTO modules (module_name) VALUES ('Java');
INSERT INTO modules (module_name) VALUES ('Sql');
INSERT INTO modules (module_name) VALUES ('Frontend');


INSERT INTO homework (name,module_id) VALUES ('Java Expressions',1);
INSERT INTO homework (name,module_id) VALUES ('Java Classes',1);
INSERT INTO homework (name,module_id) VALUES ('Java APIs',1);
INSERT INTO homework (name,module_id) VALUES ('Sql Intro',2);
INSERT INTO homework (name,module_id) VALUES ('Sql Cont',2);
INSERT INTO homework (name,module_id) VALUES ('Sql Advanced',2);
INSERT INTO homework (name,module_id) VALUES ('HTML',3);
INSERT INTO homework (name,module_id) VALUES ('CSS',3);
INSERT INTO homework (name,module_id) VALUES ('Javascript',3);
INSERT INTO homework (name,module_id) VALUES ('Vue',3);

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,1,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,2,2, 'Most of your tests passed! However the');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,3,1, 'Need to study up on APIs');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,4,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,5,3, 'Awesome work!');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,6,3, 'You are a coding genius!');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,7,3, 'Perfect score, keep up the good work!');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (1,8,3, 'Just like Neo, you have mastered the code and have become one with the Matrix!');

INSERT INTO pathway (name, module_id) VALUES ('Resume 1', 1);
INSERT INTO pathway (name, module_id) VALUES ('Resume 2', 1);
INSERT INTO pathway (name, module_id) VALUES ('Resume 3', 1);
INSERT INTO pathway (name, module_id) VALUES ('Linkedin 1', 2);
INSERT INTO pathway (name, module_id) VALUES ('Linkedin 2', 2);
INSERT INTO pathway (name, module_id) VALUES ('Linkedin 3', 2);
INSERT INTO pathway (name, module_id) VALUES ('Job Search 1', 3);
INSERT INTO pathway (name, module_id) VALUES ('Job Search 2', 3);
INSERT INTO pathway (name, module_id) VALUES ('Job Search 3', 3);

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,1,1, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,2,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,3,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,4,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,5,1, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,6,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,7,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (2,8,3, 'Great Job');

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,1,1, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,2,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,3,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,4,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,5,2, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,6,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,7,1, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (3,8,3, 'Great Job');


INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,1,1, 'Skeleton of resume is there, but needs improvement');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,2,2, 'Resume looking better!');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,3,3, 'Your resume is ready for job searching!');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,4,2, 'Linkedin needs a few tweaks');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,5,2, 'Profile pic looks great, need to update summary');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,6,3, 'Great Job!');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,7,3, 'Nice work apply!');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,8,3, 'Keep it up!');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (1,9,3, 'Congrats on the new job!');

INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,1,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,2,1, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,3,1, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,4,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,5,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,6,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,7,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,8,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (2,9,2, 'Great Job');

INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,1,1, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,2,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,3,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,4,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,5,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,6,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,7,3, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,8,2, 'Great Job');
INSERT INTO student_pathway(student_id, pathway_id, score, feedback) VALUES (3,9,1, 'Great Job');


INSERT INTO quizes(quiz_title,module_id) VALUES('Quiz 1: Java',1);
INSERT INTO quizes(quiz_title,module_id) VALUES('Quiz 2: More Java',2);
INSERT INTO quizes(quiz_title,module_id) VALUES('Quiz 3: Javascript',3);

INSERT INTO student_quizes(quiz_id, student_id, quiz_status, score, max_score) VALUES(1, 1, 'completed', 3,3);
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(2, 1, 'assigned');
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(3, 1, 'assigned');
INSERT INTO student_quizes(quiz_id, student_id, quiz_status,score, max_score) VALUES(1, 2, 'completed',2, 3);
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(2, 2, 'assigned');
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(3, 2, 'assigned');
INSERT INTO student_quizes(quiz_id, student_id, quiz_status, score, max_score) VALUES(1, 3, 'completed',2,3);
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(2, 3, 'assigned');
INSERT INTO student_quizes(quiz_id, student_id, quiz_status) VALUES(3, 3, 'assigned');

INSERT INTO questions(quiz_id, question_text) VALUES(1, 'What is a correct syntax to output "Hello World" in Java?'); 
INSERT INTO questions(quiz_id, question_text) VALUES(1, 'Java is short for "Javascript"'); 
INSERT INTO questions(quiz_id, question_text) VALUES(1, 'How do you insert Comments in Java code'); 

INSERT INTO questions(quiz_id, question_text) VALUES(2, 'Which data type is used to create a variable that should store text?'); 
INSERT INTO questions(quiz_id, question_text) VALUES(2, 'How do you create a variable with the numeric value 5?'); 
INSERT INTO questions(quiz_id, question_text) VALUES(2, 'How do you create a variable with the floating number 2.8?'); 


INSERT INTO answers(question_id, answer_text, correct) VALUES(1, 'echo("Hello World");', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(1, 'Console.WriteLine("Hello World);', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(1, 'print("Hello World"', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(1, 'System.out.println("Hello World)', true);
INSERT INTO answers(question_id, answer_text, correct) VALUES(1, 'console.log("Hello Wordl)', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(2, 'True', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(2, 'False', true); 

INSERT INTO answers(question_id, answer_text, correct) VALUES(3, '# This is a comment', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(3, '// This is a comment', true); 
INSERT INTO answers(question_id, answer_text, correct) VALUES(3, '/* This is a comment', false);

INSERT INTO answers(question_id, answer_text, correct) VALUES(4, 'String', true); 
INSERT INTO answers(question_id, answer_text, correct) VALUES(4, 'string', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(4, 'Txt', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(4, 'myString', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(4, 'let', false);

INSERT INTO answers(question_id, answer_text, correct) VALUES(5, 'float x = 5;', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(5, 'num x = 5', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(5, 'x = 5;', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(5, 'int x = 5;', true); 
INSERT INTO answers(question_id, answer_text, correct) VALUES(5, 'let x =5;', false);

INSERT INTO answers(question_id, answer_text, correct) VALUES(6, 'int x = 2.8f;', true);
INSERT INTO answers(question_id, answer_text, correct) VALUES(6, 'byte x = 2.8f', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(6, 'x = 2.8f;', false);
INSERT INTO answers(question_id, answer_text, correct) VALUES(6, 'x = 2.8f;', false);

INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (1,4,1);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (2,7,1);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (3,9,1);

INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (1,3,2);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (2,7,2);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (3,9,2);

INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (1,4,3);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (2,8,3);
INSERT INTO student_selected_answers(question_id, choice_id, student_id) VALUES (3,9,3);

INSERT INTO instructor_comments (instructor_id, student_id, comment) VALUES (2, 1, 'You are doing really good grasping Java concepts. I recommend you keep working on the coding interview problems to keep improving.');
INSERT INTO instructor_comments (instructor_id, student_id, comment) VALUES (2, 2, 'You have the basics of Vue down but are behind on passing props, focus on passing props for the next few days to catch up.');


COMMIT TRANSACTION;
