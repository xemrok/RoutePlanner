CREATE DATABASE routeplanner;
USE routeplanner;
CREATE TABLE users (id_user INTEGER auto_increment PRIMARY KEY NOT NULL,
	login VARCHAR(30) UNIQUE NOT NULL,
	pass VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL);

CREATE TABLE routes (id_routes INTEGER auto_increment PRIMARY KEY NOT NULL,
	id_user INTEGER NOT NULL,
	title VARCHAR(200) NOT NULL,
	date_routes DATE NOT NULL);

CREATE TABLE stage (id_stage INTEGER auto_increment PRIMARY KEY NOT NULL,
	id_routes INTEGER NOT NULL, 
	place VARCHAR(200) NOT NULL,
	date_stage DATE);

CREATE TABLE comments (id_comments INTEGER auto_increment PRIMARY KEY NOT NULL,
	id_stage INTEGER NOT NULL,
	note VARCHAR(1000),
	date_note DATE);

/*Взаимосвязь таблиц*/
ALTER TABLE routes ADD FOREIGN KEY (id_user) REFERENCES users (id_user);	
ALTER TABLE stage ADD FOREIGN KEY (id_routes) REFERENCES routes (id_routes);
ALTER TABLE comments ADD FOREIGN KEY (id_stage) REFERENCES stage (id_stage);

/*Тестовые данные*/
INSERT INTO users (login,pass,email) VALUES('user1','123','sdfsd@sdcsd.com');
INSERT INTO users (login,pass,email) VALUES('user2','123','sdfsd@sdcsd.com');
INSERT INTO users (login,pass,email) VALUES('user3','123','sdfsd@sdcsd.com');

INSERT INTO routes (id_user,title,date_routes) VALUES(1,'test1','2017.01.29');
INSERT INTO routes (id_user,title,date_routes) VALUES(2,'test2','2017.01.29');
INSERT INTO routes (id_user,title,date_routes) VALUES(3,'test3','2017.01.29');
INSERT INTO routes (id_user,title,date_routes) VALUES(1,'test4','2017.01.29');

INSERT INTO stage (id_routes,place,date_stage) VALUES (1,'place','2017.01.29');
INSERT INTO stage (id_routes,place,date_stage) VALUES (2,'place','2017.01.29');
INSERT INTO stage (id_routes,place,date_stage) VALUES (3,'place','2017.01.29');
INSERT INTO stage (id_routes,place,date_stage) VALUES (4,'place','2017.01.29');

INSERT INTO comments (id_stage,note,date_note) VALUES (1,'asdasda','2017.01.29');
INSERT INTO comments (id_stage,note,date_note) VALUES (2,'asdasd','2017.01.29');
INSERT INTO comments (id_stage,note,date_note) VALUES (3,'asdasda','2017.01.29');
INSERT INTO comments (id_stage,note,date_note) VALUES (4,'sfsdfds','2017.01.29');

/*Триггеры*/
CREATE TRIGGER `DeleteComents`
BEFORE DELETE ON `stage`
FOR EACH ROW
DELETE FROM comments WHERE OLD.id_stage = id_stage

CREATE TRIGGER `DeleteStage`
BEFORE DELETE ON `routes`
FOR EACH ROW
DELETE FROM stage WHERE OLD.id_routes = id_routes

CREATE TRIGGER `DeleteRoutes`
BEFORE DELETE ON `users`
FOR EACH ROW
DELETE FROM routes WHERE OLD.id_user = id_user
