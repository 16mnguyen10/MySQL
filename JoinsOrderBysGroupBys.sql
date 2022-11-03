CREATE DATABASE ISEKAI_GAME;
USE ISEKAI_GAME;

#------------ Creating the tables -----------#
CREATE TABLE guilds (
	guildID INT NOT NULL AUTO_INCREMENT,
    guildName VARCHAR(255) NOT NULL,
    guildLevel INT NOT NULL,
    
    PRIMARY KEY (guildID)
);

CREATE TABLE players (
	playerID INT NOT NULL AUTO_INCREMENT,
    playerName VARCHAR(255) NOT NULL,
    playerLevel INT NOT NULL,
    playerBirthday VARCHAR(255),
    guildID INT,
    
    PRIMARY KEY (playerID),
    FOREIGN KEY (guildID) REFERENCES guilds (guildID)
);

#------------ Inserting players and guilds ------------#
INSERT INTO guilds (guildID, guildName, guildLevel)
VALUES (1, 'Twinkle Wish', 10),
		(2, 'Gourmet Guild', 15),
        (3, 'Labyrinth', 11),
        (4, 'Dragons Nest', 10),
        (5, 'Caon', 15),
        (6, 'Friendship Club', 6),
        (7, 'Twilight Caravan', 4),
        (8, 'Carmina', 6);
        
INSERT INTO players (playerID, playerName, playerLevel, playerBirthday, guildID)
VALUES (111, 'Rei Shijo', 22, '2001-02-11', 1),
		(112, 'Yui Kusano', 19, '2004-03-22', 1),
        (113, 'Hiyori Harusaki', 18, '2003-02-12', 1),
        (114, 'Kokkoro', 22, '2001-05-21', 2),
        (115, 'Yuuki', 22, '2001-03-19', 2),
        (116, 'Pecorine', 22, '2001-11-23', 2),
        (117, 'Shizuru Hoshino', 21, '2000-02-11', 3),
        (118, 'Rino Inosaki', 20, '2002-02-11', 3),
        (119, 'Jessica', 22, '2001-02-11', 3),
        (120, 'Kaya Kidou', 22, '2001-02-11', 4),
        (121, 'Maho Himemiya', 24, '1999-02-11', 5),
        (122, 'Mary Ensfield', 21, '2002-02-11', 4),
        (123, 'Makoto Aki', 22, '2001-02-11', 5),
        (124, 'Jenny', 25, '1998-02-11', 4),
        (125, 'Diao Liao', 27, '1996-02-22', 5),
        (126, 'Eliza Lee', 22, '2001-04-15', 6),
        (127, 'Shimaza', 23, '1999-09-12', NULL),
        (128, 'Shenzi', 22, '2001-02-11', NULL);
        
#----------- Joins, Order By, Group By Practice -------------#
SELECT * FROM guilds
JOIN players
ON guilds.guildID = players.guildID
ORDER BY guilds.guildName;
        
# Get the number of members in each guild in alphabetical order
SELECT guilds.guildName AS 'Guild Name', COUNT(players.playerID) AS 'Members'
FROM guilds
LEFT JOIN players
ON guilds.guildID = players.guildID
GROUP BY guilds.guildName
ORDER BY guilds.guildName;  

# Get all players whose Player Level is greater than 20 and their guild they are in
SELECT players.playerName AS 'Player Name', players.playerLevel AS 'Level', guilds.guildName
FROM players
LEFT JOIN guilds
ON players.guildID = guilds.guildID
WHERE players.playerLevel > 19
ORDER BY players.playerLevel;

# Get the average member level of each guild
SELECT guilds.guildName AS 'Guild', AVG(players.playerLevel) AS 'Average Member Level'
FROM guilds
LEFT JOIN players
ON guilds.guildID = players.guildID
GROUP BY guilds.guildName;

# Get the guilds with more than 1 members
SELECT guilds.guildName AS 'Guild', COUNT(players.playerID) AS 'Number of Members'
FROM guilds
JOIN players
ON guilds.guildID = players.guildID
GROUP BY guildName
HAVING COUNT(players.playerID) > 1
ORDER BY guildName;
