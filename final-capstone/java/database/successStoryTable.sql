BEGIN TRANSACTION;
DROP TABLE IF EXISTS stories CASCADE;

CREATE TABLE stories (
        story_id serial NOT NULL,
        first_name varchar(50) NOT NULL,
        title varchar(50) NOT NULL,
        message varchar(500) NOT NULL,
        CONSTRAINT PK_story_id PRIMARY KEY (story_id)
);

INSERT INTO stories (first_name, title, message) VALUES ('Trevor', 'Very Worthwhile', 'It gave me all of the tools necessary to help build this website.');

COMMIT TRANSACTION;