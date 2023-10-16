-- CREATING DATABASE
create database mybookstore;
drop database mybookstore;
-- MAKING USE OF DATABASE
use mybookstore;
-- CREATING TABLES
create table authors( authors_ID integer PRIMARY KEY, first_name VARCHAR(20) NOT NULL unique , last_name VARCHAR(20) NOT NULL unique);
create table books( books_id INT(20) NOT NULL unique, title VARCHAR(20) NOT NULL unique,
 authors_ID integer PRIMARY KEY, published_year INT(20) NOT NULL);
ALTER TABLE books
ADD FOREIGN KEY (authors_ID) REFERENCES authors(authors_ID);
-- INSERTING VALUES
insert into authors( authors_ID,first_name , last_name) values(12, 'Nompilo', 'Hadebe'),(23,'Mandi','lele')
,(21,'mary','joe'),(25,'mavis','boob');
insert into books( books_id, title, authors_ID, published_year) values (1,'Nothing',12,2007),(2,'freedom',23,2010)
,(3,'the moves',21,2020),(4,'ashes',25,2009);
-- DROP TABLES
drop table authors;
drop table books;

-- ALTER TABLES
alter table books add price INT(20) NOT NULL;
rename table authors to writers;
alter table books modify price FLOAT(20) NOT NULL;
alter table books drop published_year;
-- SHOW TABLES
show tables;
-- SELECT COLUMNS FROM BOOKS TABLE
select books_id,title,authors_ID,price from books;
-- DROP TABLE WRITERS ##failed because table contain FOREIGN KEY
drop table writers;
show tables;
-- SELECT ALL AUTHOR_ID=12
select * from writers
where authors_ID=12;

