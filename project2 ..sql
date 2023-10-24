create database myauthors;
use myauthors;

-- find author who has written the most books in the dataset
SELECT authors, COUNT(*) as book_count
FROM books
GROUP BY authors
ORDER BY book_count DESC
LIMIT 1;


-- calculating the total number of pages written by each author and list them in desc order of the total page count
ALTER TABLE author_table ADD num_pages INT;
UPDATE author_table
JOIN books ON author_table.authors= books.authors
SET author_table.num_pages= books.num_pages;

SELECT DISTINCT authors, SUM(num_pages) as page_count
FROM author_table
GROUP BY authors
ORDER BY page_count DESC;

-- from the book take 'average rating and put it into author_table
ALTER TABLE author_table ADD average_rating DECIMAL(4,2);

UPDATE author_table
JOIN books ON author_table.title = books.title
SET author_table.average_rating = books.average_rating;

-- list the book titles that are available in more than one language

ALTER TABLE book_table ADD language_code CHAR(25);

UPDATE book_table
JOIN books ON book_table.isbn = books.isbn
SET book_table.language_code = books.language_code;

SELECT title
FROM book_table
GROUP BY title
HAVING COUNT(DISTINCT language_code) > 1;

-- determine the average number of pages for books published in each year and identify the year that publish more books.

ALTER TABLE book_table ADD publication_date DATE;

UPDATE books
SET publication_date = STR_TO_DATE(publication_date,'%Y-%m-%d');

UPDATE book_table
JOIN books ON book_table.title = books.title
SET book_table.publication_date = books.publication_date;

ALTER table book_table ADD publication_year INT;
UPDATE book_table
SET publication_year = STR_TO_DATE(publication_date,'%Y-%m-%d');

SELECT year(publication_year), AVG(num_pages) AS avg_page_count
FROM book_table
GROUP BY year(publication_year)
ORDER BY avg_page_count DESC
LIMIT 1;
select* from book_table;


-- find te publisher with the most books published in the language other than english
SELECT publisher, COUNT(*) AS book_count
FROM books
WHERE language_code!='eng'
GROUP BY publisher
ORDER BY book_count DESC
LIMIT 1;