SELECT * FROM questions JOIN quizes ON questions.quiz_id =  quizes.quiz_id WHERE quizes.quiz_id = 1;

SELECT * FROM answers JOIN questions on answers.question_id = questions.question_id WHERE answers.question_id =1;

SELECT * FROM student_selected_answers WHERE question_id = 1 AND student_id =1;

SELECT questions.question_id, questions.question_text, questions.quiz_id, quizes.quiz_title, student_quizes.student_id, student_quizes.quiz_status, student_quizes.score, student_quizes.max_score FROM questions
                JOIN quizes ON questions.quiz_id = quizes.quiz_id 
                JOIN student_quizes ON quizes.quiz_id = student_quizes.quiz_id 
                WHERE questions.quiz_id = 1 AND student_quizes.student_id = 1;
                


// setup dummy data stuff for user usable after entering students
INSERT INTO students (graduated, user_id, instructor_id) VALUES (true, 10, 1);
INSERT INTO students (graduated, user_id, instructor_id) VALUES (true, 11, 1);

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (10,1,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (10,2,2, 'Nice Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (10,3,3, 'Intetesting');

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (9,1,1, 'Try harder');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (9,2,1, 'Tests Do');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (9,3,3, 'Intetesting');

UPDATE users Set academic_status='Instructor' where username='mrinstructor'

INSERT INTO students (graduated, user_id, instructor_id) VALUES (true, 12, 1);

INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,1,3, 'Great Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,2,2, 'Nice Job');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,3,3, 'Interesting');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,4,2, 'You did this');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,5,2, 'Okay');
INSERT INTO student_homework(student_id, homework_id, score, feedback) VALUES (11,6,1, 'Done. I guess.');