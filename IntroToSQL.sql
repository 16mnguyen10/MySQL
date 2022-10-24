CREATE DATABASE record_company;
USE record_company;
/* CREATE TABLE test (
	test_col INT
);
ALTER TABLE test
ADD another_col VARCHAR(255);
DROP TABLE test;
*/
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT, 
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);


/* Insert */
INSERT INTO bands (name) 
VALUES ('IRON MAIDEN!');

INSERT INTO bands (name)
VALUES ('JUNK QUEEN'), ('ROADHOG!!'), ('Mercy');

/* Querying */
SELECT * FROM bands;
SELECT * FROM bands LIMIT 2;
SELECT name FROM bands;
SELECT id AS 'ID', name AS 'Band Name'
FROM bands;
SELECT * FROM bands ORDER BY name;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Numbers', 1998, 1),
		('Roses', 2001, 1),
		('Kings of Men', 2003, 2),
        ('Kettle Sheep Song', 2013, 3),
        ('Test Song', NULL, 3);
        
SELECT * FROM albums;
SELECT name FROM albums;

UPDATE albums
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE release_year < 2010;

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year < 2010 AND band_id = 1;

SELECT * FROM albums 
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

/* Join */
SELECT *  FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

SELECT *  FROM bands
RIGHT JOIN albums ON bands.id = albums.band_id;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id


/* NOTES

Primary Key: Primary identifying column of the table and it is what identifies an individual record (Can't have more than one primary key)
			- No Null Values
            - Contain a unique value for each row of data
            - Every row must have a primary key value
Foreign Key: Any form of key that references a table other than itself 
SELECT *: Selects every column instead of a specific one
AS: Alternate naming of a column's name
WHERE name LIKE '%er%': We want to find only the value with 'er' in its name with any amount of character before and after those characters
HAVING: Similar to WHERE but happens after GROUP BY
*/
