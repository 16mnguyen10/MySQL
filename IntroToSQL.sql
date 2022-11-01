###----- Creating DATABASE -----###
CREATE DATABASE record_company;
USE record_company;


###----- Creating Tables in Database -----###
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,   # id of the band 
	name VARCHAR(255) NOT NULL,       # Name of the band 
    PRIMARY KEY (id)
); 

CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL, # Name of song
    release_year INT,           # Release year, we may not know so it can be NULL 
    band_id INT NOT NULL,       # Band id is referencing the band's table, need foreign key 
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands (id)
);


###----- Inserting and reading data into our bands table -----###
INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands; 			# Gets everything from bands
SELECT * FROM bands LIMIT 2; 	# Gets us the first 2 bands
SELECT name FROM bands; 		# Gets just the name column from bands

SELECT id AS 'ID', name AS 'Band Name' # Change the title using AS
FROM bands;

SELECT * FROM bands ORDER BY name; # Ordering them by alphabetical order of the name
SELECT * FROM bands ORDER BY name DESC; # Ordered by descending the name

### Inserting and reading data into our albums table ###
INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the Beasts', 1985, 1), # Band_id 1 = Iron Maiden, 2 = Deuce, 3 = Avenged Sevenfold
		('Power Slave', 1984, 1),
        ('Nightmare', 2018, 2),
        ('Nightmare', 2010, 3),
        ('Test Album', NULL, 3);

SELECT * FROM albums;
SELECT name FROM albums; # Get all name of song from album
SELECT DISTINCT name FROM albums; # Gets all name that have to be unique

UPDATE albums 			# How to update values in table
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums	# Getting all albums where release year is before 2000
WHERE release_year < 2000;

SELECT * FROM albums 	  # Gets all album where the name is compared to what values we want it to have (LIKE)
WHERE name LIKE '%ow%';   # Anything after the % is ok 

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2; # Two conditions where it output value with song with 'er' or band_id is 2

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1; # Conditional statement where it needs to meet both conditions to be outputted

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018; # Gets output from between two conditions

SELECT * FROM albums
WHERE release_year IS NULL; # Returns output with albums that have no release year

DELETE FROM albums
WHERE id = 5;


###----- JOINING THE TABLES -----###
SELECT * FROM bands      # Basic default (inner) join 
JOIN albums
ON bands.id = albums.id;

SELECT * FROM albums
LEFT JOIN bands ON bands.id = albums.band_id;


###----- Aggregate FUNCTIONs -----###
SELECT AVG(release_year) FROM albums; # Returns average release years of all song in album
SELECT SUM(release_year) FROM albums; # Returns the sum of all release years in album table
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;					  # Counts how many of the band id are in the table

###----- Aggregate Functions + JOINS -----###
SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a
ON b.id = a.band_id
GROUP BY b.id;



/*
 - Primary Key: 
	* Primary identifying column for that table and is unique. Used to identify individual record inside of the table
	* No Null Values
 - Foreign Key: 
    * Any form of key that references another table other than itself
    
 - 4 Types of Joins
  * Inner Join:
	SELECT Table1.Column1, Table1.Column2, Table2.Column2, ....
    FROM Table 1
    INNER JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;
  * Left Join:
	SELECT Table1.Column1, Table1.Column2, Table2.Column2, ...
    FROM Table1
    LEFT JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;
  * Right Join:
    Similar to Left just change LEFT to RIGHT
  * Full Join:
	SELECT Table1.Column1, Table1.Column2, Table2.Column1, ...
    FROM Table1
    FULL JOIN Table2
    ON Table1.MatchingColumnName = Table2.MatchingColumnName;
*/
